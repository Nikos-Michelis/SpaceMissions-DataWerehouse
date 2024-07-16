/*Retrieve all failed missions since 1957 until June 7, 2024 */
SELECT 
	COUNT(CASE WHEN date.year <= 2000 THEN 1 END) AS '20th_total', 
    COUNT(CASE WHEN launch.launch_status = 'Failure' 
            AND date.year <= 2000 
            AND (date.year < 2000 OR (date.year = 2000 AND date.month < 12) OR (date.year = 2000 AND date.month = 12 AND date.day <= 31)) THEN 1 END) AS '20th_failed',
	COUNT(CASE WHEN date.year >= 2001 AND (date.year < 2024 OR (date.year = 2024 AND date.month < 6) OR (date.year = 2024 AND date.month = 6 AND date.day <= 7))  THEN 1 END) AS '21th_total',
    COUNT(CASE WHEN launch.launch_status = 'Failure' 
            AND date.year >= 2001 
            AND (date.year < 2024 OR (date.year = 2024 AND date.month < 6) OR (date.year = 2024 AND date.month = 6 AND date.day <= 7)) THEN 1 END) AS '21st_failed'
FROM launch JOIN date ON launch.date_id = date.date_id;

/*Retrive all active and retired rockets*/
SELECT rocket_status, COUNT(rocket_name) AS status_count
FROM rocket
WHERE rocket_status = "Active"
UNION
SELECT rocket_status, COUNT(rocket_name) AS status_count
FROM rocket 
WHERE rocket_status = "Retired";

/*Retrieve all active and retired rockets from all agencies */
SELECT rocket_status, COUNT(rocket_name) AS status_count
FROM launch LEFT JOIN rocket ON launch.rocket_id = rocket.rocket_id
WHERE rocket_status = "Active"
UNION
SELECT rocket_status, COUNT(rocket_name) AS status_count
FROM launch LEFT JOIN rocket ON launch.rocket_id = rocket.rocket_id
WHERE rocket_status = "Retired";

/*Retrive the number of Apollo missions with different launch status (Success, Failure, Partial Failure) */
SELECT 
	COUNT(launch.launch_id) AS 'total_apollo_missions',
    COUNT(CASE WHEN launch_status = 'Success' THEN 1 END) AS success,
    COUNT(CASE WHEN launch_status = 'Failure' THEN 1 END) AS failure,
    COUNT(CASE WHEN launch_status = 'Partial Failure' THEN 1 END) AS partial_failure
FROM launch 
	JOIN location ON launch.location_id = location.location_id
	LEFT JOIN mission ON launch.mission_id = mission.mission_id
WHERE mission.mission_name LIKE 'Apollo%';

/*Return all total lunches per year*/
SELECT date.year, COUNT(launch_id) AS total_launches_per_year
FROM launch 
	JOIN launch_provider ON launch.provider_id = launch_provider.provider_id
	JOIN location ON launch.location_id = location.location_id
	JOIN rocket ON launch.rocket_id = rocket.rocket_id
	LEFT JOIN mission ON launch.mission_id = mission.mission_id
	LEFT JOIN orbit ON launch.orbit_id = orbit.orbit_id
	JOIN launch_pad ON launch.launch_pad_id = launch_pad.launch_pad_id
	JOIN date ON launch.date_id = date.date_id
	JOIN time ON launch.time_id = time.time_id
GROUP BY date.year
ORDER BY date.year;

/*Retrieve the five companies that have contributed the most*/
SELECT launch_provider.provider_country_code, launch_provider.provider_name, provider_type , COUNT(launch.launch_id) as "Total_Missions" 
FROM launch 
	JOIN launch_provider ON launch.provider_id = launch_provider.provider_id
	LEFT JOIN orbit ON launch.orbit_id = orbit.orbit_id
GROUP BY launch.provider_id
ORDER BY Total_Missions DESC
LIMIT 5;

/*Retrive all successful and failed missions per country */
SELECT location.location_country_code,
	COUNT(CASE WHEN launch.launch_status = 'Success' THEN launch.launch_id END) AS 'success',
	COUNT(CASE WHEN launch.launch_status = 'Failure' THEN launch.launch_id END) AS 'failure'
FROM launch JOIN location ON launch.location_id = location.location_id
GROUP BY location.location_country_code
ORDER BY success DESC, failure DESC;

/*Retrive the total number of misisons for each mission status */
SELECT 
    location.location_country_code,
    COUNT(CASE WHEN launch_status = 'Success' THEN 1 END) AS success,
    COUNT(CASE WHEN launch_status = 'Failure' THEN 1 END) AS failure,
    COUNT(CASE WHEN launch_status = 'Partial Failure' THEN 1 END) AS partial_failure,
    COUNT(CASE WHEN launch_status = 'Go' THEN 1 END) AS go,
    COUNT(CASE WHEN launch_status = 'TBC' THEN 1 END) AS tbc,
    COUNT(CASE WHEN launch_status = 'TBD' THEN 1 END) AS tbd
FROM launch JOIN location ON launch.location_id = location.location_id
GROUP BY location.location_country_code
ORDER BY Success desc
LIMIT 5;

/*Retrieve the total number of missions related to communications for the 20th century and the 21st century. */
SELECT
	mission.mission_type,
    COUNT(CASE WHEN date.year <= 2000 THEN 1 END) AS '20th_century',
    COUNT(CASE WHEN date.year <= 2000 AND launch.launch_status = 'Success' THEN 1 END) AS 'success_20th',
    COUNT(CASE WHEN date.year <= 2000 AND launch.launch_status = 'Failure' THEN 1 END) AS 'failure_20th',
    COUNT(CASE WHEN date.year > 2000 THEN 1 END) AS '21st_century',
    COUNT(CASE WHEN date.year > 2000 AND launch.launch_status = 'Success' THEN 1 END) AS 'success_21st',
    COUNT(CASE WHEN date.year > 2000 AND launch.launch_status = 'Failure' THEN 1 END) AS 'failure_21st'
FROM launch 
	 LEFT JOIN mission ON launch.mission_id = mission.mission_id
	 JOIN date ON launch.date_id = date.date_id
WHERE mission.mission_type = 'Communications'
GROUP BY '20th_century', '21th_century';

/*Return all Starlink missions in Low Earth Orbit and the other missions in this orbit */
SELECT
	launch_provider.provider_name, mission.mission_type,
    COUNT(CASE WHEN  mission.mission_name LIKE('Starlink%') THEN 1 END) AS 'starlink_missions',
    COUNT(CASE WHEN  mission.mission_name NOT LIKE('Starlink%') THEN 1 END) AS 'other_missions'
FROM launch 
	JOIN launch_provider ON launch.provider_id = launch_provider.provider_id
	LEFT JOIN mission ON launch.mission_id = mission.mission_id
	JOIN orbit ON launch.orbit_id = orbit.orbit_id
WHERE mission.mission_type = 'Communications' 
	AND launch_provider.provider_name = 'SpaceX' 
    AND orbit.orbit_name = "Low Earth Orbit";
    
/*Retrieve all successful launches related to one orbit for each country code. */
SELECT location.location_country_code, COUNT(launch.launch_id) AS 'total_launches'
FROM launch 
	JOIN launch_provider ON launch.provider_id = launch_provider.provider_id
	JOIN location ON launch.location_id = location.location_id
	JOIN rocket ON launch.rocket_id = rocket.rocket_id
	LEFT JOIN mission ON launch.mission_id = mission.mission_id
	LEFT JOIN orbit ON launch.orbit_id = orbit.orbit_id
WHERE launch.launch_status = "Success" AND launch.orbit_id IS NOT NULL
GROUP BY location.location_country_code
ORDER BY total_launches DESC;

/*Retrieve all companies which has the highest average spending*/
SELECT launch_provider.provider_name, AVG(launch.launch_cost) as "Average_Spending" 
FROM launch 
	JOIN launch_provider ON launch.provider_id = launch_provider.provider_id
WHERE launch.launch_cost IS NOT NULL
GROUP BY launch_provider.provider_name
ORDER BY AVG(launch.launch_cost) DESC;

/*Retrieve all missions which took time above the average.*/
SELECT DISTINCT launch_provider.provider_name, mission.mission_name, time.hour, avg_time.avg_hour
FROM launch 
    JOIN launch_provider ON launch.provider_id = launch_provider.provider_id
    LEFT JOIN mission ON launch.mission_id = mission.mission_id
    JOIN date ON launch.date_id = date.date_id
	JOIN time ON launch.time_id = time.time_id
    JOIN (SELECT AVG(time.hour) AS avg_hour
			 FROM launch
			 JOIN time ON launch.time_id = time.time_id
			 WHERE launch.launch_status = 'Success') AS avg_time
WHERE launch.launch_status = "Success" AND time.hour > avg_time.avg_hour AND mission_name IS NOT NULL
ORDER BY time.hour DESC;

/*Count the number of times each rocket achieved a specific orbit */
SELECT rocket.rocket_name, orbit.orbit_name, COUNT(orbit.orbit_id) AS total_orbit_count
FROM launch 
	JOIN launch_provider ON launch.provider_id = launch_provider.provider_id
	JOIN rocket ON launch.rocket_id = rocket.rocket_id
	LEFT JOIN mission ON launch.mission_id = mission.mission_id
	LEFT JOIN orbit ON launch.orbit_id = orbit.orbit_id
GROUP BY rocket.rocket_name, orbit.orbit_name
HAVING total_orbit_count > 0
ORDER BY total_orbit_count DESC
LIMIT 20;

    

