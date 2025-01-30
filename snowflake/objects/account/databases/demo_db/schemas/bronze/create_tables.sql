USE ROLE ACCOUNTADMIN;
USE WAREHOUSE COMPUTE_WH;
use database DEMO_DB;
use schema bronze;
create or alter table vacation_spots (
    city varchar
  , airport varchar
  , co2_emissions_kg_per_person float
  , punctual_pct float
  , avg_temperature_air_f float
  , avg_relative_humidity_pct float
  , avg_cloud_cover_pct float
  , precipitation_probability_pct float
  , aquarium_cnt int
  , zoo_cnt int
  , korean_restaurant_cnt int) ;