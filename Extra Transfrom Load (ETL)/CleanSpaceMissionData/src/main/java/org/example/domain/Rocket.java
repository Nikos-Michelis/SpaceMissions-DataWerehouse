package org.example.domain;

import com.opencsv.bean.CsvBindByName;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Rocket implements CsvEntity {
    @CsvBindByName(capture = "rocket_id")
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
    @CsvBindByName(column = "rocket_image_url")
    private String rocket_image_url;
}