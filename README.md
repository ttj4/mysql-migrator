## How to use:

pass the following in docker-compose.yml:

    db-dumper:
        image: ttj4/mysql-migrator
        environment:
            - SERVICE_HEALTHCHECK=<micro-service:80/health>
            - MYSQL_HOST=<db-host>
            - MYSQL_ROOT_PASSWORD=<db-password>
            - MYSQL_DATABASE=<db-name>
        volumes:
            - ./<dir-where-.sql-files-reside>:/opt/dumps
