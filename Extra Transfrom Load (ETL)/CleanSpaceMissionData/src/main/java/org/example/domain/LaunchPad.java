package org.example.domain;

import com.opencsv.bean.CsvBindByName;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;


@Data
@NoArgsConstructor
@AllArgsConstructor
public class LaunchPad implements CsvEntity {
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
    @CsvBindByName(column = "total_pad_launches")
    private String total_pad_launches;
    @CsvBindByName(column = "total_orbital_launch_attempts")
    private String total_orbital_launch_attempts;


}