package org.example.configuration;

public class CsvHeaderConfiguration {
    public static final String[] LAUNCH_DATE_HEADERS = {"date_id", "day", "month", "year", "launch_Date"};
    public static final String[] LAUNCH_TIME_HEADERS = {"time_id", "hours", "minutes", "seconds", "launch_Date"};
    public static final String[] LAUNCH_ROCKET_HEADERS = {"rocket_id", "rocket_name", "rocket_status", "rocket_family",
            "rocket_fullName", "rocket_variant", "rocket_length", "rocket_diameter", "leo_capacity", "gto_capacity", "rocket_image_url"};
    public static final String[] LAUNCH_PAD_HEADERS = {"launch_pad_id", "launch_pad_name", "map_url", "latitude",
            "longitude", "launch_pad_country_code", "map_image", "total_pad_launches", "total_orbital_launch_attempts"};
    public static final String[] LAUNCH_LOCATION_HEADERS = {"location_id", "location_name", "location_country_code", "location_map_image",
            "location_timezone", "total_location_launches", "total_location_landings"};
    public static final String[] LAUNCH_MISSION_HEADERS = {"mission_id", "mission_name", "mission_type"};
    public static final String[] LAUNCH_ORBIT_HEADERS = {"orbit_id", "orbit_name", "orbit_abbrev"};
    public static final String[] LAUNCH_PROVIDER_HEADERS = {"provider_id", "provider_name", "provider_type", "provider_country_code",
            "provider_administrator", "founding_year", "consecutive_successful_launches",
            "successful_launches", "failed_launches", "total_provider_launches", "pending_launches"};
    public static final String[] LAUNCH_HEADERS = {"launch_id", "provider_id", "location_id", "rocket_id", "date_id", "time_id", "mission_id", "orbit_id", "launch_pad_id",
            "launch_status", "launch_status_description", "launch_cost", "launch_mass"};
}
