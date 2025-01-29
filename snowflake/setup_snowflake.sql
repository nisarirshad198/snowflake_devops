USE ROLE ACCOUNTADMIN;

-- Separate database for git repository
CREATE OR ALTER DATABASE demo_common;


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

execute immediate from './setup_snowflake_demo_db.sql';




