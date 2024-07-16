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
public class Configuration implements Serializable {
    @JsonProperty("id")
    private int conf_id;
    @JsonProperty("name")
    private String rocket_name;
    @JsonProperty("active")
    private boolean active;
    @JsonProperty("family")
    private String rocket_family;
    @JsonProperty("full_name")
    private String rocket_fullName;
    @JsonProperty("variant")
    private String rocket_variant;
    @JsonProperty("length")
    private Double rocket_length;
    @JsonProperty("diameter")
    private Double rocket_diameter;
    @JsonProperty("launch_cost")
    private Double launch_cost;
    @JsonProperty("launch_mass")
    private Double launch_mass;
    @JsonProperty("leo_capacity")
    private Integer leo_capacity;
    @JsonProperty("gto_capacity")
    private Integer gto_capacity;
}
