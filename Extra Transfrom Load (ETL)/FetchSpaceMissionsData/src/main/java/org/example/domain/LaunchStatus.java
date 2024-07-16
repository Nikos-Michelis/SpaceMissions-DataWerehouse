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
public class LaunchStatus implements Serializable {
    @JsonProperty("id")
    private int launch_id;
    @JsonProperty("name")
    private String launch_name;
    @JsonProperty("abbrev")
    private String launch_status;
    @JsonProperty("description")
    private String launch_description;
}
