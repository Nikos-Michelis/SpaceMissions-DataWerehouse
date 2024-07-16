package org.example.domain;

import com.opencsv.bean.CsvBindByName;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class LaunchProvider implements CsvEntity {
    @CsvBindByName(column = "provider_id")
    private String provider_id;
    @CsvBindByName(column = "provider_name")
    private String provider_name;
    @CsvBindByName(column = "provider_type")
    private String provider_type;
    @CsvBindByName(column = "provider_country_code")
    private String provider_country_code;
    /*@CsvBindByName(column = "provider_description")
    private String provider_description;*/
    @CsvBindByName(column = "provider_administrator")
    private String provider_administrator;
    @CsvBindByName(column = "founding_year")
    private String founding_year;
    @CsvBindByName(column = "consecutive_successful_launches")
    private String consecutive_successful_launches;
    @CsvBindByName(column = "successful_launches")
    private String successful_launches;
    @CsvBindByName(column = "failed_launches")
    private String failed_launches;
    @CsvBindByName(column = "total_provider_launches")
    private String total_provider_launches;
    @CsvBindByName(column = "pending_launches")
    private String pending_launches;
}
