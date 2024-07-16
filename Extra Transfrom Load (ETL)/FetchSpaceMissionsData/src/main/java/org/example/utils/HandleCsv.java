package org.example.utils;

import com.opencsv.CSVWriter;
import org.example.domain.Results;

import java.io.FileWriter;
import java.io.IOException;
import java.lang.reflect.Field;
import java.util.*;

public class HandleCsv {

    public static <T> void writeDataToCSV(List<T> dataList, String fileName) {
        if (dataList == null || dataList.isEmpty()) {
            throw new IllegalArgumentException("The data list is empty or null");
        }

        try (CSVWriter writer = new CSVWriter(new FileWriter(fileName))) {
            // Generate headers from the structure of the Results class
            Set<String> headerSet = new LinkedHashSet<>();
            for (T obj : dataList) {
                if (obj != null) {
                    addHeaders(obj.getClass(), headerSet);
                }
            }
            String[] header = headerSet.toArray(new String[0]);
            writer.writeNext(header);

            // Write data for each object in dataList
            for (T obj : dataList) {
                Map<String, String> fieldMap = getObjectFields(obj);
                String[] data = new String[header.length];
                for (int i = 0; i < header.length; i++) {
                    data[i] = fieldMap.getOrDefault(header[i], null);
                }
                writer.writeNext(data);
            }
        } catch (IOException | IllegalAccessException e) {
            e.printStackTrace();
        }
    }

    private static Map<String, String> getObjectFields(Object obj) throws IllegalAccessException {
        Map<String, String> fieldMap = new LinkedHashMap<>();
        if (obj == null) {
            return fieldMap;
        }

        Class<?> objClass = obj.getClass();
        for (Field field : objClass.getDeclaredFields()) {
            field.setAccessible(true);
            Object value = field.get(obj);
            String fieldName = field.getName();
            // check also the fields for the nested classes namely when method have called recursively
            if (isPrimitiveOrString(field.getType())) {
                fieldMap.put(fieldName, value != null ? value.toString() : null);
            } else {
                // extract nested objects and call method itself recursively
                fieldMap.putAll(getObjectFields(value));
            }
        }
        return fieldMap;
    }

    private static void addHeaders(Class<?> clazz, Set<String> headerSet) {
        for (Field field : clazz.getDeclaredFields()) {
            field.setAccessible(true);
            String fieldName = field.getName();
            if (isPrimitiveOrString(field.getType())) {
                headerSet.add(fieldName);
            } else {
                addHeaders(field.getType(), headerSet);
            }
        }
    }

    private static boolean isPrimitiveOrString(Class<?> type) {
        return type.isPrimitive() || type.equals(String.class) || Number.class.isAssignableFrom(type)
                || type.equals(Boolean.class) || type.equals(Character.class);
    }
}
