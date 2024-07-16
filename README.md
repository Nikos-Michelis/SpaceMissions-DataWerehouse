
<h1>Star Schema</h1> 

![space_missions_db_final](https://github.com/user-attachments/assets/06e97a03-5a92-41cc-802e-b13cc4035b79)

<h1 align="center">- Queries -</h1>

<h2>Retrieve all failed missions from 1957 until June 7, 2024</h2>

```sql
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
```
<h2 align="center">_______</h2>
<p align="center">
  <img src="https://github.com/user-attachments/assets/c948d3b7-403d-433a-849d-ff69e2fedd68" alt="Alt image">
</p>

<h2>Retrive the number of Apollo missions with different launch status (Success, Failure, Partial Failure)</h2>

```sql
SELECT 
	COUNT(launch.launch_id) AS 'total_apollo_missions',
    COUNT(CASE WHEN launch_status = 'Success' THEN 1 END) AS success,
    COUNT(CASE WHEN launch_status = 'Failure' THEN 1 END) AS failure,
    COUNT(CASE WHEN launch_status = 'Partial Failure' THEN 1 END) AS partial_failure
FROM launch 
	JOIN location ON launch.location_id = location.location_id
	LEFT JOIN mission ON launch.mission_id = mission.mission_id
WHERE mission.mission_name LIKE 'Apollo%';
```
<p align="center">
  <img src="https://github.com/user-attachments/assets/37a870f6-dbe2-4d01-b58e-b35921e30820">
</p>

<h2>Retrieve the top five companies by their contributions.</h2>

```sql
SELECT launch_provider.provider_country_code, launch_provider.provider_name, provider_type , COUNT(launch.launch_id) as "Total_Missions" 
FROM launch 
	JOIN launch_provider ON launch.provider_id = launch_provider.provider_id
	LEFT JOIN orbit ON launch.orbit_id = orbit.orbit_id
GROUP BY launch.provider_id
ORDER BY Total_Missions DESC
LIMIT 5;
```
<p align="center">
  <img src="https://github.com/user-attachments/assets/d9a8ea4b-aaf2-47ef-8d48-9c12cde2a17c">
</p>

<h2>Retrieve the total number of missions related to communications.</h2>

```sql
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
```

<p align="center">
  <img src="https://github.com/user-attachments/assets/7c2b006c-1b77-4b5d-8e58-e70bd252170b">
</p>

<h2>Return all Starlink missions in Low Earth Orbit along the other missions in this orbit.</h2>

```sql
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
```
<p align="center">
  <img src="https://github.com/user-attachments/assets/684e558a-9f35-4d0b-a0f4-a65b40e97ed6">
</p>




