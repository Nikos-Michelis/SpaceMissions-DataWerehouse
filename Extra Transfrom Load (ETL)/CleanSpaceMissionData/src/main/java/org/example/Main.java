package org.example;

import org.example.domain.*;
import org.example.utils.CsvHandler;

import java.io.IOException;
import java.util.Scanner;

import static org.example.configuration.CsvHeaderConfiguration.*;
import static org.example.configuration.FolderConfiguration.*;


public class Main {

    public static int readIntMenu(Scanner sc, int lower, int upper) {
        int choice;
        while(true) {
            System.out.print("Your choice: ");
            if (sc.hasNextInt()) {
                choice = sc.nextInt();
                if (choice < lower || choice > upper) {
                    System.out.println("Error: Between" + lower + " and " + upper );
                }
                return choice;
            }
            else {
                sc.nextLine();
            }
        }
    }
    public static void main(String[] args) {
        try (Scanner sc = new Scanner(System.in)) {
            System.out.println("Select an option:");
            System.out.println("1. Clean data without downloading images.");
            System.out.println("2. Clean data and download images.");
            System.out.println("0. Exit.");
            int choice = readIntMenu(sc, 1, 2);

            try {
                CsvHandler.mapCSVToLaunch(INPUT_FILE, LAUNCH_DATE_CSV, LAUNCH_DATE_HEADERS_CSV, choice, LAUNCH_DATE_HEADERS, Date.class);
                CsvHandler.mapCSVToLaunch(INPUT_FILE, LAUNCH_TIME_CSV, LAUNCH_TIME_HEADERS_CSV, choice, LAUNCH_TIME_HEADERS, Time.class);
                CsvHandler.mapCSVToLaunch(INPUT_FILE, LAUNCH_ROCKET_CSV, LAUNCH_ROCKET_HEADERS_CSV, choice, LAUNCH_ROCKET_HEADERS, Rocket.class);
                CsvHandler.mapCSVToLaunch(INPUT_FILE, LAUNCH_PAD_CSV, LAUNCH_PAD_HEADERS_CSV, choice, LAUNCH_PAD_HEADERS, LaunchPad.class);
                CsvHandler.mapCSVToLaunch(INPUT_FILE, LAUNCH_LOCATION_CSV, LAUNCH_LOCATION_HEADERS_CSV, choice, LAUNCH_LOCATION_HEADERS, Location.class);
                CsvHandler.mapCSVToLaunch(INPUT_FILE, LAUNCH_MISSION_CSV, LAUNCH_MISSION_HEADERS_CSV, choice, LAUNCH_MISSION_HEADERS, Mission.class);
                CsvHandler.mapCSVToLaunch(INPUT_FILE, LAUNCH_ORBIT_CSV, LAUNCH_ORBIT_HEADERS_CSV, choice, LAUNCH_ORBIT_HEADERS, Orbit.class);
                CsvHandler.mapCSVToLaunch(INPUT_FILE, LAUNCH_PROVIDER_CSV, LAUNCH_PROVIDER_HEADERS_CSV, choice, LAUNCH_PROVIDER_HEADERS, LaunchProvider.class);
                CsvHandler.mapCSVToLaunch(INPUT_FILE, LAUNCHES_CSV, LAUNCHES_HEADERS_CSV, choice, LAUNCH_HEADERS, Launch.class);
            } catch (InterruptedException | NoSuchFieldException | IllegalAccessException | IOException e) {
                throw new RuntimeException(e);
            }
        }
    }
}
