-- Setup the postgres SQL database
set client_encoding='utf8';

DROP DATABASE IF EXISTS sf_development;
DROP DATABASE IF EXISTS sf_test;

CREATE DATABASE sf_development;
CREATE DATABASE sf_test;

GRANT ALL PRIVILEGES ON DATABASE sf_development TO sf_web;
GRANT ALL PRIVILEGES ON DATABASE sf_test TO sf_web;

ALTER DATABASE sf_development OWNER  TO sf_web;
ALTER DATABASE sf_test OWNER TO sf_web;