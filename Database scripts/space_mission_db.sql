DROP DATABASE IF EXISTS space_missions_db;
CREATE DATABASE space_missions_db;
USE space_missions_db;

CREATE TABLE `date` (
  `date_id` INT NOT NULL,
  `day` int NOT NULL,
  `month` int NOT NULL,
  `year` int NOT NULL,
  PRIMARY KEY (date_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*DROP TABLE time;*/
CREATE TABLE `time` (
  `time_id` INT NOT NULL,
  `hour` INT NOT NULL,
  `minutes` INT NOT NULL,
  `seconds` INT NOT NULL,
  PRIMARY KEY (time_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*DROP TABLE rocket;*/
CREATE TABLE `rocket` (
  `rocket_id` INT NOT NULL,
  `rocket_name` VARCHAR(45) NOT NULL,
  `rocket_status` VARCHAR(45) NOT NULL,
  `rocket_family` VARCHAR(45) DEFAULT NULL,
  `rocket_fullName` VARCHAR(45) NOT NULL,
  `rocket_variant` VARCHAR(45) DEFAULT NULL,
  `rocket_length` DOUBLE DEFAULT NULL,
  `rocket_diameter` DOUBLE DEFAULT NULL,
  `leo_capacity` DOUBLE DEFAULT NULL,
  `gto_capacity` DOUBLE DEFAULT NULL,
  `rocket_image_url` VARCHAR(255) DEFAULT NULL,
  PRIMARY KEY (rocket_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*DROP TABLE location;*/
CREATE TABLE `location` (
  `location_id` INT NOT NULL,
  `location_name` VARCHAR(255) NOT NULL,
  `location_country_code` VARCHAR(45) NOT NULL,
  `locations_map_image` VARCHAR(255) NOT NULL,
  `location_timezone` VARCHAR(45) DEFAULT NULL,
  `total_location_launch` INT NOT NULL,
  `total_landing` INT NOT NULL,
  PRIMARY KEY (location_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*DROP TABLE mission;*/
CREATE TABLE `mission` (
  `mission_id` INT NOT NULL,
  `mission_name` VARCHAR(255) NOT NULL,
  /*`mission_description` TEXT DEFAULT NULL,*/
  `mission_type` TEXT DEFAULT NULL,
  PRIMARY KEY (mission_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*DROP TABLE orbit;*/
CREATE TABLE `orbit` (
  `orbit_id` INT NOT NULL,
  `orbit_name` VARCHAR(45) NOT NULL,
  `orbit_abbrev` VARCHAR(45) NOT NULL,
  PRIMARY KEY (orbit_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*DROP TABLE launch_provider;*/
CREATE TABLE `launch_provider` (
  `provider_id` INT NOT NULL,
  `provider_name` VARCHAR(255) NOT NULL,
  `provider_type` VARCHAR(255) NOT NULL,
  `provider_country_code` TEXT NOT NULL,
  /*`provider_description` TEXT DEFAULT NULL,*/
  `provider_administrator` VARCHAR(45) DEFAULT NULL,
  `founding_year` INT DEFAULT NULL,
  `total_provider_launches` INT NOT NULL,
  `consecutive_successful_launches` INT NOT NULL,
  `successful_launches` INT NOT NULL,
  `failed_launches` INT NOT NULL,
  `pending_launches` INT NOT NULL,
  PRIMARY KEY (provider_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*DROP TABLE launch_pad;*/
CREATE TABLE `launch_pad` (
  `launch_pad_id` INT NOT NULL,
  `launch_pad_name` VARCHAR(45) NOT NULL,
  `map_url` VARCHAR(255) DEFAULT NULL,
  `latitude` DOUBLE NOT NULL,
  `longitude` DOUBLE NOT NULL,
  `launch_pad_country_code` VARCHAR(45) DEFAULT NULL,
  `map_image` VARCHAR(255) NOT NULL,
  `total_pad_launch` INT NOT NULL,
  `total_orbital_launch_attempt` INT NOT NULL,
  PRIMARY KEY (launch_pad_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*DROP TABLE launch;*/
CREATE TABLE `launch` (
  `launch_id` INT NOT NULL,
  `provider_id` INT NOT NULL,
  `location_id` INT NOT NULL,
  `rocket_id` INT NOT NULL,
  `mission_id` INT DEFAULT NULL,
  `orbit_id` INT DEFAULT NULL,
  `launch_pad_id` INT NOT NULL,
  `date_id` INT NOT NULL,
  `time_id` INT NOT  NULL,
  `launch_status` VARCHAR(45) NOT NULL,
  `launch_status_description` TEXT NOT NULL,
  `launch_cost` DOUBLE DEFAULT NULL,
  `launch_mass` DOUBLE DEFAULT NULL,
  PRIMARY KEY (launch_id),
  FOREIGN KEY (provider_id) REFERENCES launch_provider(provider_id),
  FOREIGN KEY (location_id) REFERENCES location(location_id),
  FOREIGN KEY (rocket_id) REFERENCES rocket(rocket_id),
  FOREIGN KEY (mission_id) REFERENCES mission(mission_id),
  FOREIGN KEY (orbit_id) REFERENCES orbit(orbit_id),
  FOREIGN KEY (launch_pad_id) REFERENCES launch_pad(launch_pad_id),
  FOREIGN KEY (date_id) REFERENCES date(date_id),
  FOREIGN KEY (time_id) REFERENCES time(time_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


