FROM mysql:8

# initdbはdocker-compose.ymlでやるとPermission DeniedになるのでDockerfileで
COPY db/initdb/ /docker-entrypoint-initdb.d/
COPY application/vendor/laravel/sail/database/mysql/create-testing-database.sh /docker-entrypoint-initdb.d/
RUN chmod 777 /docker-entrypoint-initdb.d/*.sh
