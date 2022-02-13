{{ config(materialized='view') }}


select *
from {{ source('staging','fhv_tripdata') }}
where dispatching_base_num is not null and extract(year from pickup_datetime) = 2019