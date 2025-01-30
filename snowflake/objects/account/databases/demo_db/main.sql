
execute immediate from './create_database_and_schemas.sql';
USE ROLE ACCOUNTADMIN;
execute immediate from './create_role.sql';
USE ROLE SYSADMIN;
execute immediate from './schemas/bronze/create_stages.sql';

execute immediate from './schemas/bronze/create_tables.sql';