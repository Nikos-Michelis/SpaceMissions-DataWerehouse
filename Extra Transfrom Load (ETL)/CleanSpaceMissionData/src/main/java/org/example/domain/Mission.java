package org.example.domain;

import com.opencsv.bean.CsvBindByName;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Mission implements CsvEntity{
    @CsvBindByName(column = "mission_id")
    private String mission_id;
    @CsvBindByName(column = "mission_name")
    private String mission_name;
   // @CsvBindByName(column = "mission_description")
   // private String mission_description;
    @CsvBindByName(column = "mission_type")
    private String mission_type;

}
