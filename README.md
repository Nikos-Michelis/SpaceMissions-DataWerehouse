
<h1>Star Schema</h1> 

![space_missions_db_final](https://github.com/user-attachments/assets/06e97a03-5a92-41cc-802e-b13cc4035b79)

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

![image](https://github.com/user-attachments/assets/c948d3b7-403d-433a-849d-ff69e2fedd68)



