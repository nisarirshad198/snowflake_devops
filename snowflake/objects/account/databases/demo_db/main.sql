execute immediate from './create_database_and_schemas.sql';

execute immediate from './create_role.sql';


execute immediate from './schemas/bronze/create_stages.sql';

execute immediate from './schemas/bronze/create_tables.sql';