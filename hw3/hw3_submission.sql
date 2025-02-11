-- Create external table referring to gcs path
CREATE OR REPLACE EXTERNAL TABLE `kestra_dezoomcamp_data.external_yellow_trip_data`
OPTIONS (
  format = 'parquet',
  uris = ['gs://kestra-dezoomcamp-bucket/yellow_tripdata_2024-*.parquet']
);

-- Select the table
SELECT *
from kestra_dezoomcamp_data.external_yellow_trip_data
limit 10;

-- Count of records for 2024 yellow taxi data
select count(1)
from kestra_dezoomcamp_data.external_yellow_trip_data

-- Create a non partitioned table from external table
create or replace table kestra_dezoomcamp_data.non_partitioned_yellow_trip_data
as select * from kestra_dezoomcamp_data.external_yellow_trip_data

-- Create a partitioned table from external table
create or replace table kestra_dezoomcamp_data.partitioned_yellow_trip_data
partition by
  date(tpep_pickup_datetime) as
  select * from kestra_dezoomcamp_data.external_yellow_trip_data

-- How many records have a fare_amount of 0?
select count(1)
from kestra_dezoomcamp_data.non_partitioned_yellow_trip_data
where fare_amount = 0

-- Write a query to retrieve the distinct VendorIDs between tpip_dropoff_datetime 2024-03-01 and 2024-03-15 (inclusive)
select distinct(VendorID)
from kestra_dezoomcamp_data.external_yellow_trip_data
where date(tpep_pickup_datetime) between '2024-03-01' and '2024-03-15'

-- question 5 create the partition table
select distinct(VendorID)
from kestra_dezoomcamp_data.partitioned_yellow_trip_data
where date(tpep_pickup_datetime) between '2024-03-01' and '2024-03-15'