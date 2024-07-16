package org.example.domain;

import com.opencsv.bean.CsvBindByName;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Launch implements CsvEntity {
    @CsvBindByName(column = "launch_id")
    private String launch_id;
    @CsvBindByName(column = "provider_id")
    private String provider_id;
    @CsvBindByName(column = "location_id")
    private String location_id;
    @CsvBindByName(column = "rocket_id")
    private String rocket_id;
    @CsvBindByName(column = "date_id")
    private String date_id;
    @CsvBindByName(column = "time_id")
    private String time_id;
    @CsvBindByName(column = "mission_id")
    private String mission_id;
    @CsvBindByName(column = "orbit_id")
    private Integer orbit_id;
    @CsvBindByName(column = "launch_pad_id")
    private String launch_pad_id;
    @CsvBindByName(column = "launch_status")
    private String launch_status;
    @CsvBindByName(column = "launch_status_description")
    private String launch_status_description;
    @CsvBindByName(column = "launch_cost")
    private String launch_cost;
    @CsvBindByName(column = "launch_mass")
    private String launch_mass;
    @CsvBindByName(column = "launch_Date")
    private String launch_Date;
}
