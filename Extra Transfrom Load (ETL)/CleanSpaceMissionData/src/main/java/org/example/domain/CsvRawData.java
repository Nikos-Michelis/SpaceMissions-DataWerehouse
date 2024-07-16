package org.example.domain;

import com.opencsv.bean.CsvBindByName;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class CsvRawData implements CsvEntity {

    @CsvBindByName(column = "launch_id")
    private String launch_id;

    @CsvBindByName(column = "launch_name")
    private String launch_name;

    @CsvBindByName(column = "launch_status")
    private String launch_status;

    @CsvBindByName(column = "launch_status_description")
    private String launch_status_description;

    @CsvBindByName(column = "launch_Date")
    private String launch_Date;

    // Separate fields for day, month, year, hours, minutes, seconds
    private Integer date_id;
    private Integer day;
    private Integer month;
    private Integer year;
    private Integer time_id;
    private Integer hours;
    private Integer minutes;
    private Integer seconds;

    @CsvBindByName(column = "rocket_id")
    private String rocket_id;

    @CsvBindByName(column = "rocket_name")
    private String rocket_name;

    @CsvBindByName(column = "rocket_status")
    private String rocket_status;

    @CsvBindByName(column = "rocket_family")
    private String rocket_family;

    @CsvBindByName(column = "rocket_fullName")
    private String rocket_fullName;

    @CsvBindByName(column = "rocket_variant")
    private String rocket_variant;

    @CsvBindByName(column = "rocket_length")
    private String rocket_length;

    @CsvBindByName(column = "rocket_diameter")
    private String rocket_diameter;

    @CsvBindByName(column = "leo_capacity")
    private String leo_capacity;

    @CsvBindByName(column = "gto_capacity")
    private String gto_capacity;

    @CsvBindByName(column = "launch_cost")
    private String launch_cost;

    @CsvBindByName(column = "launch_mass")
    private String launch_mass;

    @CsvBindByName(column = "provider_id")
    private String provider_id;

    @CsvBindByName(column = "provider_name")
    private String provider_name;

    @CsvBindByName(column = "provider_type")
    private String provider_type;

    @CsvBindByName(column = "provider_country_code")
    private String provider_country_code;

    @CsvBindByName(column = "provider_description")
    private String provider_description;

    @CsvBindByName(column = "provider_administrator")
    private String provider_administrator;

    @CsvBindByName(column = "founding_year")
    private String founding_year;

    @CsvBindByName(column = "total_provider_launch")
    private String total_provider_launch;

    @CsvBindByName(column = "consecutive_successful_launches")
    private String consecutive_successful_launches;

    @CsvBindByName(column = "successful_launches")
    private String successful_launches;

    @CsvBindByName(column = "failed_launches")
    private String failed_launches;

    @CsvBindByName(column = "pending_launches")
    private String pending_launches;

    @CsvBindByName(column = "mission_id")
    private String mission_id;

    @CsvBindByName(column = "mission_name")
    private String mission_name;

    @CsvBindByName(column = "mission_description")
    private String mission_description;

    @CsvBindByName(column = "mission_type")
    private String mission_type;

    @CsvBindByName(column = "orbit_name")
    private String orbit_name;

    @CsvBindByName(column = "orbit_abbrev")
    private String orbit_abbrev;

    @CsvBindByName(column = "launch_pad_id")
    private String launch_pad_id;

    @CsvBindByName(column = "launch_pad_name")
    private String launch_pad_name;

    @CsvBindByName(column = "map_url")
    private String map_url;

    @CsvBindByName(column = "latitude")
    private String latitude;

    @CsvBindByName(column = "longitude")
    private String longitude;

    @CsvBindByName(column = "launch_pad_country_code")
    private String launch_pad_country_code;

    @CsvBindByName(column = "map_image")
    private String map_image;

    @CsvBindByName(column = "total_pad_launch")
    private String total_pad_launch;

    @CsvBindByName(column = "orbital_launch_attempt_count")
    private String orbital_launch_attempt_count;

    @CsvBindByName(column = "location_id")
    private String location_id;

    @CsvBindByName(column = "location_name")
    private String location_name;

    @CsvBindByName(column = "country_code")
    private String location_country_code;

    @CsvBindByName(column = "locations_map_image")
    private String locations_map_image;

    @CsvBindByName(column = "location_timezone")
    private String location_timezone;

    @CsvBindByName(column = "total_launch_count")
    private String total_location_launch;

    @CsvBindByName(column = "total_landing_count")
    private String total_location_landing;

    @CsvBindByName(column = "rocket_image_url")
    private String rocket_image_url;
}
