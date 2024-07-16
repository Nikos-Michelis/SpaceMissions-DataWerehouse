package org.example.domain;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.annotation.JsonProperty;
import jakarta.enterprise.inject.Default;
import jakarta.ws.rs.DefaultValue;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;

@Data
@NoArgsConstructor
@AllArgsConstructor
@JsonIgnoreProperties(ignoreUnknown = true)
public class Mission implements Serializable {
    @DefaultValue("null")
    @JsonProperty("id")
    private Integer mission_id;
    @DefaultValue("")
    @JsonProperty("name")
    private String mission_name;
    @DefaultValue("")
    @JsonProperty("description")
    private String mission_description;
    @DefaultValue("")
    @JsonProperty("type")
    private String mission_type;
    private Orbit orbit;
}


