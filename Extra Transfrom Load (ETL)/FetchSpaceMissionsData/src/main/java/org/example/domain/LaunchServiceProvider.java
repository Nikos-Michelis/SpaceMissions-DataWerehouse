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
public class LaunchServiceProvider implements Serializable {
    @JsonProperty("id")
    private int provider_id;
    @JsonProperty("name")
    private String provider_name;
    @JsonProperty("type")
    private String provider_type;
    @JsonProperty("country_code")
    private String provider_country_code;
    @JsonProperty("description")
    private String provider_description;
    @JsonProperty("administrator")
    private String provider_administrator;
    @JsonProperty("founding_year")
    private Integer founding_year;
    @JsonProperty("total_launch_count")
    private Integer total_provider_launches;
    @JsonProperty("consecutive_successful_launches")
    private Integer consecutive_successful_launches;
    @JsonProperty("successful_launches")
    private Integer successful_launches;
    @JsonProperty("failed_launches")
    private Integer failed_launches;
    @JsonProperty("pending_launches")
    private Integer pending_launches;
}
