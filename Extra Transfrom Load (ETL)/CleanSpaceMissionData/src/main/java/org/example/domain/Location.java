package org.example.domain;

import com.opencsv.bean.CsvBindByName;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Location implements CsvEntity, Serializable {
    @CsvBindByName(column = "location_id")
    private String location_id;

    @CsvBindByName(column = "location_name")
    private String location_name;

    @CsvBindByName(column = "location_country_code")
    private String location_country_code;

    @CsvBindByName(column = "location_map_image")
    private String location_map_image;

    @CsvBindByName(column = "location_timezone")
    private String location_timezone;

    @CsvBindByName(column = "total_location_launches")
    private String total_location_launches;

    @CsvBindByName(column = "total_location_landings")
    private String total_location_landings;
}
