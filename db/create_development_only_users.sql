set client_encoding='utf8';

CREATE USER sf_web WITH PASSWORD 'devonly:l/8H/6wiGKarJoAaz6GmJEOIcnKfQNHhq6BAttO4jJSZrwTOEE';
ALTER USER sf_web WITH CREATEDB;
-- Only on development, this is needed to be able to run test:prepare
ALTER USER sf_web WITH SUPERUSER;