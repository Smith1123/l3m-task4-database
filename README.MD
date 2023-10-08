# Task 4

## How to run env and sql's

To be run sql script's, you need to run the `liquibase:update` command in maven.

But first you need a postgreSql server. The simplest way is to run the docker compose file (`./docker-compose/compose.yml`)
but you need a Docker Desktop to use it.

If you would like to run it outside docker, you might need to configure the 'liquibase.properties' file (`./src/main/resources/configuration/`).

After liquibase:update is success, you can see the result on your DB server. (Docker compose can run pgAdmin4 for you,
and in this case you have to configure your local server in pgAdmin. Be aware, your **_host_** in this case is `host.docker.internal`).

## Indexes task