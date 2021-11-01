# groundWater
## We be listing the procedure for setup of project later on.

Documentation for higher level issues and decision taken:
https://docs.google.com/document/d/1iPiLmMDzfiNsVfwgOoOnJweTDDF2DTpf43fIuvbWxaw/edit?usp=sharing

I addedd the schema to a Google Sheet:
https://docs.google.com/spreadsheets/d/1MfJqkCz7o-e7jgZG_KTTIiDoeIAfE5WgPWRdj4R6swQ/edit?usp=sharing

Will still be expanded, but can get started from here.


# restore database in postgres
# location of groundwater.sql must be inside /var/lib/postgresql

psql groundwater < groundwater.sql

#this command restore backed up database to the existing database named "groundwater"


docker cp ./database/well_type_update.sql groundwater_db_1:/opt/


# docker commands

docker exec -it groundwater_1_db /bin/bash
groundwater_1_db is the container name
you can use docker ps -a    to list all containers and names
su postgres
psql
