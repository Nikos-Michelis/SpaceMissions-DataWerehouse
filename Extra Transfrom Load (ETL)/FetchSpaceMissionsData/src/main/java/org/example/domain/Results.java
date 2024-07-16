package org.example.domain;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.annotation.JsonProperty;
import com.fasterxml.jackson.annotation.JsonRootName;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;

@Data
@NoArgsConstructor
@AllArgsConstructor
@JsonIgnoreProperties(ignoreUnknown = true)
public class Results implements Serializable {
    private LaunchStatus status;
    @JsonProperty("window_start")
    private String launch_date;
    private LaunchServiceProvider launch_service_provider;
    private Rocket rocket;
    private Mission mission;
    private LaunchPad pad;
    @JsonProperty("image")
    private String rocket_image;
}
