FROM mysql:5.7

#ENV MYSQL_DATABASE stormlight
#ENV MYSQL_ROOT_PASSWORD supersecret
#ENV MYSQL_USER mysql
#ENV MYSQL_PASSWORD supersecret
#ENV DATABASE_HOST db

# Add the content of the sql-scripts/ directory to your image
# All scripts in docker-entrypoint-initdb.d/ are automatically
# executed during container startup
CMD ["--character-set-server=latin1", "--collation-server=latin1_general_ci", "--skip-character-set-client-handshake"]

COPY ./sql-scripts /docker-entrypoint-initdb.d/