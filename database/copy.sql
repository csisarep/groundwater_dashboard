SELECT * FROM odk;
/* DELETE FROM odk; */
COPY odk(date,district,latitude,longitude,altitude,precision,well_type,measurement_point_cm,measurement_of_wet_point_on_tape__in_m_,gw_level_from_mp,mp_in_m,gw_level,fid,well_num) FROM '/home/au/work/groundWater/data/gw_level.csv' DELIMITER ',' CSV HEADER;
SELECT * FROM odk;
