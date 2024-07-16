package org.example.configuration;

import java.io.File;
import java.nio.file.Paths;

public class FolderConfiguration {
    private static final String ROOT_PATH = Paths.get(System.getProperty("user.home"), "Desktop").toString();
    private static final String ROOT_FOLDER = Paths.get(System.getProperty("user.home"), "Desktop","db_csv_new").toString();
    public static final String ROOT_FOLDER_HEADERS = Paths.get(System.getProperty("user.home"), "Desktop","db_headers_csv").toString();
    public static final String INPUT_FILE = ROOT_PATH + File.separator + "SpaceMissionsDataset.csv";
    public static final String LAUNCH_DATE_CSV = ROOT_FOLDER + File.separator + "date.csv";
    public static final String LAUNCH_TIME_CSV =  ROOT_FOLDER + File.separator + "time.csv";
    public static final String LAUNCH_ROCKET_CSV =  ROOT_FOLDER + File.separator + "rocket.csv";
    public static final String LAUNCH_PAD_CSV =  ROOT_FOLDER + File.separator + "launch_pad.csv";
    public static final String LAUNCH_LOCATION_CSV =  ROOT_FOLDER + File.separator + "location.csv";
    public static final String LAUNCH_MISSION_CSV =  ROOT_FOLDER + File.separator + "mission.csv";
    public static final String LAUNCH_ORBIT_CSV =  ROOT_FOLDER + File.separator + "orbit.csv";
    public static final String LAUNCH_PROVIDER_CSV =  ROOT_FOLDER + File.separator + "launch_provider.csv";
    public static final String LAUNCHES_CSV =  ROOT_FOLDER + File.separator + "launch.csv";
    public static final String LAUNCH_DATE_HEADERS_CSV = ROOT_FOLDER_HEADERS + File.separator + "date-header.csv";
    public static final String LAUNCH_TIME_HEADERS_CSV =  ROOT_FOLDER_HEADERS + File.separator + "time-header.csv";
    public static final String LAUNCH_ROCKET_HEADERS_CSV =  ROOT_FOLDER_HEADERS + File.separator + "rocket-header.csv";
    public static final String LAUNCH_PAD_HEADERS_CSV =  ROOT_FOLDER_HEADERS + File.separator + "launch_pad-header.csv";
    public static final String LAUNCH_LOCATION_HEADERS_CSV =  ROOT_FOLDER_HEADERS + File.separator + "location-header.csv";
    public static final String LAUNCH_MISSION_HEADERS_CSV =  ROOT_FOLDER_HEADERS + File.separator + "mission-header.csv";
    public static final String LAUNCH_ORBIT_HEADERS_CSV =  ROOT_FOLDER_HEADERS + File.separator + "orbit-header.csv";
    public static final String LAUNCH_PROVIDER_HEADERS_CSV =  ROOT_FOLDER_HEADERS + File.separator + "launch_provider-header.csv";
    public static final String LAUNCHES_HEADERS_CSV =  ROOT_FOLDER_HEADERS + File.separator + "launch-header.csv";
    public static final String DOWNLOAD_ROCKET_DIR = ROOT_PATH + File.separator + "rockets";
    public static final String DOWNLOAD_PADS_DIR = ROOT_PATH + File.separator + "pads";
    public static final String DOWNLOAD_LAUNCH_LOCATIONS_DIR = ROOT_PATH + File.separator + "locations";
}
