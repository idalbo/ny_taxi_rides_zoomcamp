{{ config(materialized='table') }}

for_hire as (
    select *
    from {{ ref('stg_fhv_tripdata') }}
    where pickup_locationid is not null or dropoff_locationid is not null
), 

dim_zones as (
    select * from {{ ref('dim_zones') }}
)
select 
    for_hire.*, 
    pickup_zone.borough as pickup_borough, 
    pickup_zone.zone as pickup_zone, 
    dropoff_zone.borough as dropoff_borough, 
    dropoff_zone.zone as dropoff_zone
from for_hire
inner join dim_zones as pickup_zone
on for_hire.pickup_locationid = pickup_zone.locationid
inner join dim_zones as dropoff_zone
on for_hire.dropoff_locationid = dropoff_zone.locationid