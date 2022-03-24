FROM postgres
COPY ./groundwater.sql /opt
COPY ./create_initialdb.sh /docker-entrypoint-initdb.d
ENV POSTGRES_DB=groundwater
ENV POSTGRES_USER=postgres
ENV POSTGRES_PASSWORD=postgres
RUN chown -R postgres:postgres /docker-entrypoint-initdb.d/