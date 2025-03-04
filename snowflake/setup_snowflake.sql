USE ROLE ACCOUNTADMIN;
CREATE OR ALTER WAREHOUSE COMPUTE_WH;
USE WAREHOUSE COMPUTE_WH;
GRANT USAGE ON WAREHOUSE COMPUTE_WH TO SYSADMIN;
USE ROLE SYSADMIN;
CREATE OR ALTER DATABASE DEMO_COMMON;

use role ACCOUNTADMIN;


-- API integration is needed for GitHub integration
CREATE OR REPLACE API INTEGRATION git_api_integration
  API_PROVIDER = git_https_api
  API_ALLOWED_PREFIXES = ('https://github.com/nisarirshad198')
  ENABLED = TRUE;


-- Git repository object is similar to external stage
CREATE OR REPLACE GIT REPOSITORY demo_common.public.demo_repo
  API_INTEGRATION = git_api_integration
  ORIGIN = 'https://github.com/nisarirshad198/snowflake_devops'; -- INSERT URL OF FORKED REPO HERE

-- To monitor data pipeline's completion
CREATE OR REPLACE NOTIFICATION INTEGRATION email_integration
  TYPE=EMAIL
  ENABLED=TRUE;
GRANT READ , WRITE  ON GIT REPOSITORY demo_common.public.demo_repo TO ROLE SYSADMIN;
GRANT USAGE ON ALL STAGES IN DATABASE demo_common TO ROLE SYSADMIN;
GRANT USAGE ON FUTURE STAGES IN DATABASE demo_common TO ROLE SYSADMIN;

  CREATE OR ALTER WAREHOUSE WH_END_USERS 
  WAREHOUSE_SIZE = XSMALL 
  AUTO_SUSPEND = 300 
  AUTO_RESUME= TRUE;

  CREATE OR ALTER WAREHOUSE WH_DEV 
  WAREHOUSE_SIZE = XSMALL 
  AUTO_SUSPEND = 300 
  AUTO_RESUME= TRUE;

  
  CREATE OR ALTER WAREHOUSE WH_BU 
  WAREHOUSE_SIZE = XSMALL 
  AUTO_SUSPEND = 300 
  AUTO_RESUME= TRUE;

USE ROLE SYSADMIN;
execute immediate from './objects/account/databases/demo_db/main.sql';
execute immediate from './objects/account/databases/demo_db2/main.sql';






