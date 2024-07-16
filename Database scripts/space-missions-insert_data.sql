LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/db_csv/rocket.csv'
IGNORE INTO TABLE rocket
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(rocket_id, rocket_name, rocket_status, @rocket_family, rocket_fullName, @rocket_variant, @rocket_length, @rocket_diameter, @leo_capacity, @gto_capacity, @rocket_image_url)
SET 
	rocket_family = NULLIF(@rocket_family, 'null'),
	rocket_variant = NULLIF(@rocket_variant, 'null'),
    rocket_length = NULLIF(@rocket_length, 'null'),
    rocket_diameter = NULLIF(@rocket_diameter, 'null'),
    leo_capacity = NULLIF(@leo_capacity, 'null'),
    gto_capacity = NULLIF(@gto_capacity, 'null'),
    rocket_image_url = NULLIF(@rocket_image_url, 'null');

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/db_csv/time.csv'
IGNORE INTO TABLE time 
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"' 
LINES TERMINATED BY '\n' 
IGNORE 1 ROWS 
(time_id, hour, minutes, seconds);

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/db_csv/date.csv'
IGNORE INTO TABLE date
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(date_id, day, month, year);

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/db_csv/orbit.csv'
IGNORE INTO TABLE orbit
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(orbit_id, orbit_name, orbit_abbrev);

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/db_csv/location.csv'
IGNORE INTO TABLE location
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(
    location_id, 
    location_name, 
    location_country_code, 
    locations_map_image, 
    @location_timezone, 
    total_location_launch, 
    total_landing
)
SET 
    location_timezone = NULLIF(@location_timezone, 'null');
    
LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/db_csv/launch_provider.csv'
IGNORE INTO TABLE launch_provider
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(provider_id, provider_name, provider_type, provider_country_code, 
    @provider_administrator, 
    @founding_year, 
    total_provider_launches, 
    consecutive_successful_launches, 
    successful_launches, 
    failed_launches, 
    pending_launches
)
SET 
    provider_administrator = NULLIF(@provider_administrator, 'null'),
    founding_year = NULLIF(@founding_year, 'null');

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/db_csv/launch_pad.csv'
IGNORE INTO TABLE launch_pad
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(launch_pad_id, launch_pad_name, @map_url, latitude, longitude, @launch_pad_country_code, map_image, total_pad_launch, total_orbital_launch_attempt)
SET 
    map_url = NULLIF(@map_url, 'null'),
    launch_pad_country_code = NULLIF(@launch_pad_country_code, 'null');
    
LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/db_csv/mission.csv'
INTO TABLE mission
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(mission_id, mission_name, @mission_type)
SET 
    mission_type = NULLIF(@mission_type, 'null');
    
-- Attempt to load a small batch
LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/db_csv/launch.csv'
INTO TABLE launch
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(launch_id, provider_id, location_id, rocket_id, mission_id, @orbit_id, @launch_pad_id, @date_id, time_id, launch_status, launch_status_description, @launch_cost, @launch_mass)
SET 
    orbit_id = NULLIF(@orbit_id, 'NULL'),
    launch_pad_id = NULLIF(@launch_pad_id, 'NULL'),
    launch_cost = NULLIF(@launch_cost, 'NULL'),
    launch_mass = NULLIF(@launch_mass, 'NULL'),
    date_id = NULLIF(@date_id, 'NULL');



