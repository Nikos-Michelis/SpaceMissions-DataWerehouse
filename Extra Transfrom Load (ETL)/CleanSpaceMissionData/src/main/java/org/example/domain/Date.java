package org.example.domain;

import com.opencsv.bean.CsvBindByName;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Date implements CsvEntity, Serializable {
    @CsvBindByName(column = "date_id")
    private String date_id;
    @CsvBindByName(column = "day")
    private Integer day;
    @CsvBindByName(column = "month")
    private Integer month;
    @CsvBindByName(column = "year")
    private Integer year;
    @CsvBindByName(column = "launch_Date")
    private String launch_Date;
}
