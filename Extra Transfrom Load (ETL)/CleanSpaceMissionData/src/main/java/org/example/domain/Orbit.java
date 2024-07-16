package org.example.domain;

import com.opencsv.bean.CsvBindByName;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Orbit implements CsvEntity {
    @CsvBindByName(column = "orbit_id")
    private Integer orbit_id;
    @CsvBindByName(column = "orbit_name")
    private String orbit_name;
    @CsvBindByName(column = "orbit_abbrev")
    private String orbit_abbrev;
}
