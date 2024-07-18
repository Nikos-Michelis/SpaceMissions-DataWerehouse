package org.example.utils;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import jakarta.ws.rs.client.Client;
import jakarta.ws.rs.client.ClientBuilder;
import jakarta.ws.rs.client.Invocation;
import jakarta.ws.rs.client.WebTarget;
import jakarta.ws.rs.core.MediaType;
import jakarta.ws.rs.core.Response;
import org.example.domain.Results;
import org.example.domain.Rocket;
import org.example.settings.NoDataFoundException;
import java.io.IOException;
import java.net.URI;
import java.net.http.HttpClient;
import java.net.http.HttpRequest;
import java.net.http.HttpResponse;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.concurrent.CountDownLatch;
import java.util.concurrent.TimeUnit;

import static org.example.utils.HandleImages.downloadImages;

public class HandleFetchedData {
    private static String DATA_URL = "---url-here---";
    private static final String THROTTLE_URL = "https://ll.thespacedevs.com/2.2.0/api-throttle/?format=json";
    private static final String DOWNLOAD_ROCKET_DIR = Paths.get(System.getProperty("user.home"), "Desktop", "rocket_images").toString();
    private static final String DOWNLOAD_PADS_DIR = Paths.get(System.getProperty("user.home"), "Desktop", "pad_location_images").toString();
    private static  final String DOWNLOAD_LAUNCH_LOCATIONS_DIR = Paths.get(System.getProperty("user.home"), "Desktop", "launch_location_images").toString();
    private static  final String CSV_FILE_PATH = Paths.get(System.getProperty("user.home"), "Desktop", "space-missions.csv").toString();
    public static void fetchData() throws IOException, InterruptedException, NoDataFoundException {
        HttpClient client = HttpClient.newHttpClient();
        ObjectMapper objectMapper = new ObjectMapper();
        List<Results> resultList = new ArrayList<>();
        boolean hasNextPage = true;
        while (hasNextPage) {
            System.out.println("nextPage-url: " + DATA_URL);
            HttpResponse<String> response = clientGet(client, DATA_URL);
            if (response.statusCode() == 200) {
                JsonNode rootNode = objectMapper.readTree(response.body());
                JsonNode resultsNode = rootNode.get("results");
                if (resultsNode != null && resultsNode.isArray()) {
                    try {
                        //fetchImagesData(resultsNode);
                        for (JsonNode resultNode : resultsNode) {
                            Results result = objectMapper.treeToValue(resultNode, Results.class);
                            resultList.add(result);
                        }
                    } catch (IOException e){
                        e.printStackTrace();
                    }
                    HandleCsv.writeDataToCSV(resultList, CSV_FILE_PATH);
                } else {
                    throw new NoDataFoundException("Failed to fetch data");
                }
                hasNextPage = hasNextPage(rootNode);
            } else {
                System.err.println("Failed to fetch data. Status code: " + response.statusCode());
                fetchThrottleData(client, objectMapper);
                Thread.sleep(100);
            }
        }
    }
    private static void fetchThrottleData(HttpClient client, ObjectMapper objectMapper) throws IOException, InterruptedException {
        HttpResponse<String> throttleResponse = clientGet(client, THROTTLE_URL);
        if (throttleResponse.statusCode() == 200) {
            JsonNode throttleData = objectMapper.readTree(throttleResponse.body());
            // Extract throttle parameters
            int requestLimit = throttleData.get("your_request_limit").asInt();
            int currentUse = throttleData.get("current_use").asInt();
            int nextUseSeconds = throttleData.get("next_use_secs").asInt();
            // Check throttle data before making each request
            if (currentUse >= requestLimit) {
                if (nextUseSeconds > 0) {
                    System.out.println("throttleData: " + throttleData);
                    System.out.println("Request limit reached. Waiting for " + nextUseSeconds + " seconds...");
                    cooldownTimer(nextUseSeconds);
                }
            }
        }
    }
    private static void cooldownTimer(int seconds) throws InterruptedException {
        CountDownLatch latch = new CountDownLatch(1);

        Thread timerThread = new Thread(() -> {
            for (int i = seconds; i >= 0; i--) {
                int hours = i / 3600;
                int minutes = (i % 3600) / 60;
                int remainingSeconds = i % 60;
                System.out.print("\rCountdown timer: " + hours + " hours, " + minutes + " minutes, " + remainingSeconds + " seconds remaining   ");
                try {
                    Thread.sleep(1000);
                } catch (InterruptedException e) {
                    Thread.currentThread().interrupt();
                }
            }
            latch.countDown();
        });
        timerThread.start();
        latch.await();
    }

    private static void fetchImagesData(JsonNode resultsNode) throws IOException {
        for (JsonNode resultNode : resultsNode) {
            String rocketImageUrl = resultNode.has("image") ? resultNode.get("image").textValue() != null ? resultNode.get("image").asText() : "" : "";
            System.out.println("rocketImageUrl: " + rocketImageUrl);
            if (rocketImageUrl != null && !rocketImageUrl.isEmpty()) {
                downloadImages(rocketImageUrl, DOWNLOAD_ROCKET_DIR);
            }
        }
        for (JsonNode resultNode : resultsNode) {
            String padImageUrl = resultNode.path("pad").has("map_image") ? resultNode.path("pad").get("map_image").asText() : "";
            if (!padImageUrl.isEmpty()) {
                System.out.println("padImageUrl: " + padImageUrl);
                downloadImages(padImageUrl, DOWNLOAD_PADS_DIR);
            }
        }
        for (JsonNode resultNode : resultsNode) {
            String padImageUrl = resultNode.path("pad").path("location").has("map_image") ? resultNode.path("pad").path("location").get("map_image").asText() : "";
            if (!padImageUrl.isEmpty()) {
                System.out.println("padImageUrl: " + padImageUrl);
                downloadImages(padImageUrl, DOWNLOAD_LAUNCH_LOCATIONS_DIR);
            }
        }
    }

    private static HttpResponse<String> clientGet(HttpClient client, String url) throws IOException, InterruptedException {
        return client.send(
                HttpRequest.newBuilder()
                        .uri(URI.create(url))
                        .GET()
                        .build(),
                HttpResponse.BodyHandlers.ofString()
        );
    }
    private static Boolean hasNextPage(JsonNode rootNode){
        JsonNode nextPageNode = rootNode.get("next");
        if (nextPageNode != null && !nextPageNode.isNull()) {
            DATA_URL = nextPageNode.asText();
            return true;
        }
        return false;
    }
}
