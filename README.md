# ServiceFinder

This app started with a client's request for a site where users would always work from a home page.  To do this I used, JQuery to update the page as a user clicks links to perfom actions.  We 'mocked' the users using OpenStruct to give the client a feel for how this would work.  Its not a great UI/UX format, but it does demo my work with JQuery and OpenStruct.

## Developer's Getting Started Guide

### Database creation
As a prerequisite it is assumed that you have a PostgreSQL server setup on your development computer and are and administrative user.  You will have two databases on your local to run and test this project.  Both will be accessed by the `sf_web` user.

- `sf_development`
- `sf_test`

In the *local development mode only*, you may use the shared password `devonly:xxxxxxxx`. You may also setup your own password on your system and set it in the database.yml.  **At no time shall this password be used on a staging or production server**.  Every such server must have its own unique password that is never stored in this repository.

To setup the databases for the first time, run `psql` as your admin user and then run the following SQL to configure the databases.

#### Create the development only database user
In terminal, run:

`psql < db/create_development_only_users.sql`

The `db/create_development_only_users.sql` sets up an sf_web user as a superuser on your local development system.

#### Create the development databases
In terminal, run:

`psql < db/rebuild_development.sql`

As a final step, configure your database by copying `database.yml.example` to `database.yml` in your config directory. *Remember, this default password is never permitted to be used on any server.*

