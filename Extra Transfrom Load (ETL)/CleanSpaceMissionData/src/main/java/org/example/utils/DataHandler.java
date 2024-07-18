package org.example.utils;

import com.opencsv.CSVWriter;
import org.example.domain.*;
import org.example.domain.Date;
import org.example.exceptions.ParseDataException;
import static org.example.configuration.FolderConfiguration.*;
import static org.example.utils.CsvHandler.writeEntitiesToCSV;

import java.io.*;
import java.net.HttpURLConnection;
import java.net.URL;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.time.LocalDateTime;
import java.time.OffsetDateTime;
import java.time.format.DateTimeFormatter;
import java.time.format.DateTimeParseException;
import java.util.*;
import java.util.function.Function;
import java.util.stream.Collectors;

public class DataHandler {
    private static final DateTimeFormatter INPUT_FORMATTER = DateTimeFormatter.ofPattern("yyyy-MM-dd'T'HH:mm:ssX");
    private static final String UNKNOWN_VALUE = "Unknown";
    private static final String ROCKET_STATUS_ACTIVE = "Active";
    private static final String ROCKET_STATUS_RETIRED = "Retired";
    public static void handleDateFields(Date date) throws RuntimeException {
        if (date.getLaunch_Date() != null && !date.getLaunch_Date().isEmpty()) {
            try {
                LocalDateTime launchDateTime = LocalDateTime.parse(date.getLaunch_Date(), INPUT_FORMATTER);
                date.setDate_id(generateDateId(launchDateTime));
                date.setDay(launchDateTime.getDayOfMonth());
                date.setMonth(launchDateTime.getMonthValue());
                date.setYear(launchDateTime.getYear());
            } catch (DateTimeParseException e) {
                throw new ParseDataException("Error parsing launch_Date: " + e.getMessage() + " " + date.getLaunch_Date());
            }
        }
    }
    private static void handleTimeFields(Time time) throws RuntimeException {
        if (time.getLaunch_Date() != null && !time.getLaunch_Date().isEmpty()) {
            try {
                LocalDateTime launchDateTime = LocalDateTime.parse(time.getLaunch_Date(), INPUT_FORMATTER);
                time.setTime_id(generateTimeId(launchDateTime));
                time.setHours(launchDateTime.getHour());
                time.setMinutes(launchDateTime.getMinute());
                time.setSeconds(launchDateTime.getSecond());
            } catch (DateTimeParseException e) {
                throw new ParseDataException("Error parsing launch_Time: " + e.getMessage());
            }
        }
    }
    private static String generateDateId(LocalDateTime dateTime) {
        return dateTime.format(DateTimeFormatter.ofPattern("dd-MM-yyyy")).replace("-","");
    }
    private static String generateTimeId(LocalDateTime dateTime) {
        return dateTime.format(DateTimeFormatter.ofPattern("HH:mm:ss")).replace(":", "");
    }
    private static Integer generateOrbitId(Integer orbitId) {
        return orbitId != null ? (orbitId == 0 ? 1 : orbitId + 1) : null;
    }
    private static void handleRocketStatusValue(Rocket rocket) {
        if ("true".equals(rocket.getRocket_status())) {
            rocket.setRocket_status(ROCKET_STATUS_ACTIVE);
        } else if ("false".equals(rocket.getRocket_status())) {
            rocket.setRocket_status(ROCKET_STATUS_RETIRED);
        }
    }
    public static String handleSpecialCharacters(Object value) {
        if (value == null || value.toString().isEmpty()) {
            return "null";
        }
        return "???".equals(value.toString()) ? UNKNOWN_VALUE : value.toString().trim();
    }
    private static <T extends CsvEntity> List<T> handleDuplicateEntities(List<CsvEntity> entitiesList, Class<T> entityClass, Function<CsvEntity, String> idGetter) {
        return entitiesList.stream()
                .filter(entityClass::isInstance)
                .map(entityClass::cast)
                .collect(Collectors.collectingAndThen(
                        Collectors.toMap(idGetter, Function.identity(), (e1, e2) -> e1),
                        map -> new ArrayList<>(map.values())
                ));
    }
    public static List<CsvEntity> checkEntitiesInstance(List<CsvEntity> resultList) {
        int counter = 1;
        List<CsvEntity> entitiesList = new ArrayList<>();
        for (CsvEntity csvEntity : resultList) {
            if (csvEntity instanceof Launch launch) {
                launch.setLaunch_id(String.valueOf(counter++));
                launch.setDate_id(generateDateId(OffsetDateTime.parse(launch.getLaunch_Date()).toLocalDateTime()));
                launch.setTime_id(generateTimeId(OffsetDateTime.parse(launch.getLaunch_Date()).toLocalDateTime()));
                launch.setOrbit_id(generateOrbitId(launch.getOrbit_id() != null ? launch.getOrbit_id() : null));
                entitiesList.add(launch);
            } else if (csvEntity instanceof Location) {
                entitiesList.add(csvEntity);
            } else if (csvEntity instanceof Date date) {
                handleDateFields(date);
                entitiesList.add(date);
            } else if (csvEntity instanceof Time time) {
                handleTimeFields(time);
                entitiesList.add(time);
            } else if (csvEntity instanceof Rocket rocket) {
                handleRocketStatusValue(rocket);
                entitiesList.add(rocket);
            } else if (csvEntity instanceof LaunchPad launchPad) {
                entitiesList.add(launchPad);
            } else if (csvEntity instanceof LaunchProvider launchProvider) {
                entitiesList.add(launchProvider);
            } else if (csvEntity instanceof Mission mission) {
                entitiesList.add(mission);
            } else if (csvEntity instanceof Orbit orbit) {
                orbit.setOrbit_id(generateOrbitId(orbit.getOrbit_id()));
                entitiesList.add(orbit);
            } else {
                entitiesList.add(csvEntity);
            }
        }
        return entitiesList;
    }
    public static void writeHeadersToCSV(String outputHeaderFile, String[] headers) throws FileNotFoundException {
        try (CSVWriter writer = new CSVWriter(new FileWriter(outputHeaderFile))) {
            writer.writeNext(headers);
        } catch (IOException e) {
            throw new FileNotFoundException("Unable to find output folder. Please check the local path.");
        }
    }
    public static List<CsvEntity> getUniqueEntities(List<CsvEntity> entitiesList) {
        Map<Class<? extends CsvEntity>, Function<? extends CsvEntity, String>> entityTypeToIdGetterMap = Map.of(
                Launch.class, entity -> ((Launch) entity).getLaunch_id(),
                Date.class, entity -> ((Date) entity).getDate_id(),
                Time.class, entity -> String.valueOf(((Time) entity).getTime_id()),
                Location.class, entity -> ((Location) entity).getLocation_id(),
                LaunchPad.class, entity -> ((LaunchPad) entity).getLaunch_pad_id(),
                LaunchProvider.class, entity -> ((LaunchProvider) entity).getProvider_id(),
                Mission.class, entity -> ((Mission) entity).getMission_id(),
                Orbit.class, entity -> String.valueOf(((Orbit) entity).getOrbit_id()),
                Rocket.class, entity -> String.valueOf(((Rocket) entity).getRocket_id())
        );
        List<CsvEntity> uniqueRecords = new ArrayList<>();
        entityTypeToIdGetterMap.forEach((entityClass, idGetter) -> {
            List<? extends CsvEntity> uniqueEntities = handleDuplicateEntities(entitiesList, entityClass, (Function<CsvEntity, String>) idGetter);
            uniqueRecords.addAll(uniqueEntities);
        });
        return uniqueRecords;
    }
    public static void proceedToDownloadImages(List<CsvEntity> resultList, String outputFileName, String[] headers) throws IOException, IllegalAccessException {
        List<CsvEntity> updatedEntities = new ArrayList<>();

        for (CsvEntity entity : resultList) {
            String imagePath;
            if (entity instanceof Location location) {
                imagePath = downloadImage(location.getLocation_map_image(), DOWNLOAD_LAUNCH_LOCATIONS_DIR);
                location.setLocation_map_image(imagePath);
                updatedEntities.add(location);
            } else if (entity instanceof Rocket rocket) {
                imagePath = downloadImage(rocket.getRocket_image_url(), DOWNLOAD_ROCKET_DIR);
                rocket.setRocket_image_url(imagePath);
                updatedEntities.add(rocket);
            } else if (entity instanceof LaunchPad launchPad) {
                imagePath = downloadImage(launchPad.getMap_image(), DOWNLOAD_PADS_DIR);
                launchPad.setMap_image(imagePath);
                updatedEntities.add(launchPad);
            } else {
                updatedEntities.add(entity);
            }
        }

        writeEntitiesToCSV(updatedEntities, outputFileName, headers);
    }
    private static String downloadImage(String imageUrl, String downloadDir) throws IOException {
        String imagePath = null;
        try {
            if ((imageUrl != null && !imageUrl.isEmpty()) || (imageUrl.startsWith("http://") && imageUrl.startsWith("https://"))) {
                URL url = new URL(imageUrl);
                String fileName = Paths.get(url.getPath()).getFileName().toString();
                Files.createDirectories(Paths.get(downloadDir));
                HttpURLConnection connection = (HttpURLConnection) url.openConnection();
                connection.setRequestMethod("GET");
                int responseCode = connection.getResponseCode();
                if (responseCode == HttpURLConnection.HTTP_OK) {
                    try (InputStream inputStream = connection.getInputStream()) {
                        Files.copy(inputStream, Paths.get(downloadDir, fileName), StandardCopyOption.REPLACE_EXISTING);
                        System.out.println("Downloaded: " + fileName + " to " + downloadDir);
                    }
                } else {
                    System.err.println("Failed to download image: HTTP error code " + responseCode);
                }
                imagePath = downloadDir + File.separator + fileName;
            }

        } catch (FileNotFoundException e) {
            throw new FileNotFoundException("Failed to download image: File not found - " + e.getMessage());
        } catch (IOException e) {
            throw new IOException("Failed to download image: IO error - " + imageUrl);
        }
        return imagePath;
    }
}
