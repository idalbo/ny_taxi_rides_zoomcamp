{{ config(materialized='view') }}


select 
    cast(dispatching_base_num as integer) as dispatching_base_num,
    cast(SR_Flag as integer) as sr_flag,
    cast(PULocationID as integer) as  pickup_locationid,
    cast(DOLocationID as integer) as dropoff_locationid,
    cast(pickup_datetime as timestamp) as pickup_datetime,
    cast(dropoff_datetime as timestamp) as dropoff_datetime,
from {{ source('staging','fhv_tripdata') }}
where dispatching_base_num is not null and extract(year from pickup_datetime) = 2019