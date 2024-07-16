package org.example;

import org.example.settings.NoDataFoundException;
import java.io.*;
import static org.example.utils.HandleFetchedData.fetchData;

public class Main {

    public static void main(String[] args) {
        try {

            fetchData();
            System.out.println("Data successfully downloaded!");
        } catch (IOException | InterruptedException | NoDataFoundException e) {
            e.printStackTrace();
        }
    }
}
