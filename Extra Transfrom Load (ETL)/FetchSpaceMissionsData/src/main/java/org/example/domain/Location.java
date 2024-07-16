package org.example.domain;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.annotation.JsonProperty;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;

@Data
@NoArgsConstructor
@AllArgsConstructor
@JsonIgnoreProperties(ignoreUnknown = true)
public class Location implements Serializable {
    @JsonProperty("id")
    private int location_id;
    @JsonProperty("name")
    private String location_name;
    @JsonProperty("country_code")
    private String location_country_code;
    @JsonProperty("map_image")
    private String location_map_image;
    @JsonProperty("timezone_name")
    private String location_timezone;
    @JsonProperty("total_launch_count")
    private Integer total_location_launches;
    @JsonProperty("total_landing_count")
    private Integer total_location_landings;
}
