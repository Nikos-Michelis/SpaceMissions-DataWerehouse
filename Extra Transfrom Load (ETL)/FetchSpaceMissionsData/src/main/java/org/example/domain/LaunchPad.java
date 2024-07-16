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
public class LaunchPad implements Serializable {
    @JsonProperty("id")
    private String launch_pad_id;
    @JsonProperty("name")
    private String launch_pad_name;
    @JsonProperty("map_url")
    private String map_url;
    @JsonProperty("latitude")
    private double latitude;
    @JsonProperty("longitude")
    private double longitude;
    @JsonProperty("location")
    private Location location;
    @JsonProperty("country_code")
    private String launch_pad_country_code;
    @JsonProperty("map_image")
    private String map_image;
    @JsonProperty("total_launch_count")
    private Integer total_pad_launches;
    @JsonProperty("orbital_launch_attempt_count")
    private Integer total_orbital_launch_attempts;
}
