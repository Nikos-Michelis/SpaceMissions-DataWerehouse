package org.example.utils;

import com.opencsv.CSVReader;
import com.opencsv.CSVWriter;
import com.opencsv.bean.CsvToBean;
import com.opencsv.bean.CsvToBeanBuilder;
import com.opencsv.bean.HeaderColumnNameTranslateMappingStrategy;
import org.example.domain.CsvEntity;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.lang.reflect.Field;
import java.util.*;

import static org.example.utils.DataHandler.*;

public class CsvHandler {
    private static final Map<String, String> COLUMN_TO_FIELD_MAPPING = new HashMap<>();

    public static void mapCSVToLaunch(String fileName, String outputFile, String headersFile, Integer choice,  String[] headers, Class<? extends CsvEntity> type) throws InterruptedException, IOException, NoSuchFieldException, IllegalAccessException {
        HeaderColumnNameTranslateMappingStrategy<CsvEntity> strategy = new HeaderColumnNameTranslateMappingStrategy<>();
        strategy.setType(type);
        for (Field field : type.getDeclaredFields()) {
            field.setAccessible(true);
            for (String header : headers) {
                if (field.getName().equals(header)) {
                    COLUMN_TO_FIELD_MAPPING.put(header, field.getName());
                }
            }
        }
        strategy.setColumnMapping(COLUMN_TO_FIELD_MAPPING);
        List<CsvEntity> csvEntities = loadCSV(fileName, strategy);
        List<CsvEntity> uniqueEntities = getUniqueEntities(DataHandler.checkEntitiesInstance(csvEntities));
        if(choice == 2) {
            proceedToDownloadImages(uniqueEntities, outputFile, headers);
        }
        writeHeadersToCSV(headersFile, headers);
        writeEntitiesToCSV(uniqueEntities, outputFile, headers);
    }
    private static List<CsvEntity> loadCSV(String fileName, HeaderColumnNameTranslateMappingStrategy<CsvEntity> strategy) throws FileNotFoundException, IllegalAccessException {
        List<CsvEntity> results = new ArrayList<>();
        try (CSVReader csvReader = new CSVReader(new FileReader(fileName))) {
            CsvToBean<CsvEntity> csvToBean = new CsvToBeanBuilder<CsvEntity>(csvReader)
                    .withMappingStrategy(strategy)
                    .build();
            List<CsvEntity> parsedResults = csvToBean.parse();
            for (CsvEntity entity : parsedResults) {
                if (!isEmpty(entity) ) {
                    results.add(entity);
                }
            }
        } catch (IOException e) {
            throw new FileNotFoundException("Unable to find input file. Please check the local path: " + fileName);
        } catch (IllegalAccessException e) {
            throw new IllegalAccessException("Unable to access entity. ");
        }
        return results;
    }
    private static boolean isEmpty(CsvEntity entity) throws IllegalAccessException {
        Map<String, String> fieldMap = getObjectFields(entity);
        for (String value : fieldMap.values()) {
            if (value != null && !value.trim().isEmpty()) {
                return false;
            }
        }
        return true;
    }
    private static Map<String, String> getObjectFields(Object obj) throws IllegalAccessException {
        Map<String, String> fieldMap = new LinkedHashMap<>();
        if (obj == null) {
            return fieldMap;
        }
        Class<?> objClass = obj.getClass();
        for (Field field : objClass.getDeclaredFields()) {
            field.setAccessible(true);
            try {
                Object value = field.get(obj);
                String fieldName = field.getName();
                fieldMap.put(fieldName, value != null ? value.toString() : null);
            } catch (IllegalAccessException e) {
                throw new IllegalAccessException("Failed to access field: " + field.getName() + " in object: " + obj);
            }
        }
        return fieldMap;
    }
    static String[] convertToCSVRow(CsvEntity entity, String[] headers) throws NoSuchFieldException, IllegalAccessException {
        List<String> dataList = new ArrayList<>();
        for (String header : headers) {
            try {
                String fieldName = COLUMN_TO_FIELD_MAPPING.get(header);
                Field field = entity.getClass().getDeclaredField(fieldName);
                field.setAccessible(true);
                Object value = field.get(entity);
                dataList.add(DataHandler.handleSpecialCharacters(value));
            } catch (NoSuchFieldException e) {
                throw new NoSuchFieldException("No mapping found for header: " + header);
            } catch (IllegalAccessException e) {
                throw new IllegalAccessException(e.getMessage());
            }
        }
        return dataList.toArray(new String[0]);
    }
    static void writeEntitiesToCSV(List<CsvEntity> entities, String outputFileName, String[] headers) throws FileNotFoundException, IllegalAccessException {
        try (CSVWriter writer = new CSVWriter(new FileWriter(outputFileName))) {
            writer.writeNext(headers);
            for (CsvEntity entity : entities) {
                String[] data = CsvHandler.convertToCSVRow(entity, headers);
                writer.writeNext(data);
            }
        } catch (IOException e) {
            throw new FileNotFoundException("Unable to find output folder. Please check the local path.");
        } catch (NoSuchFieldException e) {
            throw new RuntimeException("Error accessing field: " + e.getMessage(), e);
        } catch (IllegalAccessException e) {
            throw new IllegalAccessException(e.getMessage());
        }
    }
}
