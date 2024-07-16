package org.example.domain;

import com.opencsv.bean.CsvBindByName;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalTime;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Time implements CsvEntity {
    @CsvBindByName(column = "time_id")
    private String time_id;
    @CsvBindByName(column = "hours")
    private Integer hours;
    @CsvBindByName(column = "minutes")
    private Integer minutes;
    @CsvBindByName(column = "seconds")
    private Integer seconds;
    @CsvBindByName(column = "launch_Date")
    private String launch_Date;
}
