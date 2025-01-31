USE ROLE SYSADMIN;
USE WAREHOUSE COMPUTE_WH;

use database DEMO_DB;
use schema bronze;
-- Schema level objects
CREATE OR REPLACE FILE FORMAT json_format TYPE = 'json';
CREATE OR ALTER STAGE bronze.raw;
