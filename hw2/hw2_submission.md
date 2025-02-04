# Question 1:
Answer: 128.3 MB -> answer obtained from using Kestra to orchestrate an execution for Yellow Taxi data for year 2020 and month 12. The uncompressed file size is then obtained from the details of the extract task.

# Question 2:
Answer: Rendered value of the variable file -> green_tripdata_2020-04.csv

# Question 3:
Number of rows for the Yellow Taxi data: 24,648,499
Done by using the following SQL query:
```sql

SELECT count(1)
FROM `de-zoomcamp-449819.kestra_dezoomcamp_data.yellow_tripdata` 
LIMIT 1000

```
# Question 4
Number of rows for the Green Taxi data: 1,734,051
Done by using the following SQL query:
```sql
SELECT count(1)
FROM `de-zoomcamp-449819.kestra_dezoomcamp_data.green_tripdata`
WHERE filename LIKE "green_tripdata_2020%"
LIMIT 1000
```

# Question 5
Number of rows for Yellow Taxi data in March 2021: 1,925152
Done by using the following SQL query:
```sql
SELECT count(1)
FROM `de-zoomcamp-449819.kestra_dezoomcamp_data.yellow_tripdata` 
WHERE filename = "yellow_tripdata_2021-03.csv"
```

# Question 6
Answer found in "https://kestra.io/docs/workflow-components/triggers/schedule-trigger"

```yaml
triggers:
  - id: daily
    type: io.kestra.plugin.core.trigger.Schedule
    cron: "@daily"
    timezone: America/New_York
```
The timezone properly is used as above.
