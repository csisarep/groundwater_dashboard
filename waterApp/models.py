from django.db import models

# Create your models here.
class GwMonitoring(models.Model):
    fid = models.BigIntegerField(blank=True, null=True)
    start = models.CharField(max_length=200, blank=True, null=True)
    end = models.CharField(max_length=200, blank=True, null=True)
    today = models.CharField(max_length=200, blank=True, null=True)
    deviceid = models.CharField(max_length=200, blank=True, null=True)
    enumerator_name = models.CharField(max_length=200, blank=True, null=True)
    select_district = models.CharField(max_length=200, blank=True, null=True)
    geographic_location = models.CharField(max_length=200, blank=True, null=True)
    field_geographic_location_latitude = models.FloatField(db_column='latitude', blank=True, null=True)  # Field renamed because it started with '_'.
    field_geographic_location_longitude = models.FloatField(db_column='longitude', blank=True, null=True)  # Field renamed because it started with '_'.
    field_geographic_location_altitude = models.FloatField(db_column='altitude', blank=True, null=True)  # Field renamed because it started with '_'.
    field_geographic_location_precision = models.FloatField(db_column='location_precision', blank=True, null=True)  # Field renamed because it started with '_'.
    well_type_field = models.CharField(db_column='well_type', max_length=200, blank=True, null=True)  # Field renamed because it contained more than one '_' in a row. Field renamed because it ended with '_'.
    well_no_bd_dw = models.CharField(db_column='well_no_bd_dw', max_length=200, blank=True, null=True)  # Field renamed because it contained more than one '_' in a row.
    well_no_bd_sw = models.CharField(db_column='well_no_bd_sw', max_length=200, blank=True, null=True)  # Field renamed because it contained more than one '_' in a row.
    well_no_bk_dw = models.CharField(db_column='well_no_bk_dw', max_length=200, blank=True, null=True)  # Field renamed because it contained more than one '_' in a row.
    well_no_bk_sw = models.CharField(db_column='well_no_bk_sw', max_length=200, blank=True, null=True)  # Field renamed because it contained more than one '_' in a row.
    measurement_point_cm = models.CharField(max_length=200, blank=True, null=True)
    field_your_mp_is_measurement_point_cm_cm_above_ground_field = models.CharField(db_column='your_mp_is___measurement_point_cm__cm_above_ground__', max_length=200, blank=True, null=True)  # Field renamed because it contained more than one '_' in a row. Field renamed because it started with '_'. Field renamed because it ended with '_'.
    photo_of_well_use_the_camera_to_take_a_clear_photo_of_the_well = models.CharField(db_column='photo_of_well__use_the_camera_to_take_a_clear_photo_of_the_well', max_length=200, blank=True, null=True)  # Field renamed because it contained more than one '_' in a row.
    measurement_of_tape_at_measurement_point_mp_in_m_field = models.FloatField(db_column='measurement_of_tape_at_measurement_point__mp___in_m_', max_length=200, blank=True, null=True)  # Field renamed because it contained more than one '_' in a row. Field renamed because it ended with '_'.
    measurement_of_wet_point_on_tape_in_m_field = models.FloatField(db_column='measurement_of_wet_point_on_tape__in_m_', blank=True, null=True)  # Field renamed because it contained more than one '_' in a row. Field renamed because it ended with '_'.
    gw_level_from_mp = models.FloatField(blank=True, null=True)
    mp_in_m = models.FloatField(blank=True, null=True)
    gw_level = models.FloatField(blank=True, null=True)
    field_the_water_level_is_gw_level_m_below_ground_field = models.FloatField(db_column='the_water_level_is___gw_level__m_below_ground', blank=True, null=True)  # Field renamed because it contained more than one '_' in a row. Field renamed because it started with '_'. Field renamed because it ended with '_'.
    notes = models.CharField(max_length=200, blank=True, null=True)
    audio_notes_use_the_camera_s_microphone_to_record_any_notes = models.CharField(db_column='audio_notes__use_the_camera_s_microphone_to_record_any_notes', max_length=200, blank=True, null=True)  # Field renamed because it contained more than one '_' in a row.
    field_version_field = models.CharField(db_column='version', max_length=200, blank=True, null=True)  # Field renamed because it contained more than one '_' in a row. Field renamed because it started with '_'. Field renamed because it ended with '_'.
    field_id = models.IntegerField(db_column='f_id', blank=True, null=True)  # Field renamed because it started with '_'.
    field_uuid = models.CharField(db_column='f_uuid', max_length=200, blank=True, null=True)  # Field renamed because it started with '_'.
    field_submission_time = models.CharField(db_column='submission_time', max_length=200, blank=True, null=True)  # Field renamed because it started with '_'.
    field_validation_status = models.CharField(db_column='validation_status', max_length=200, blank=True, null=True)  # Field renamed because it started with '_'.
    field_notes = models.CharField(db_column='f_notes', max_length=200, blank=True, null=True)  # Field renamed because it started with '_'.
    field_status = models.CharField(db_column='status', max_length=200, blank=True, null=True)  # Field renamed because it started with '_'.
    field_submitted_by = models.CharField(db_column='submitted_by', max_length=200, blank=True, null=True)  # Field renamed because it started with '_'.
    field_tags = models.CharField(db_column='tags', max_length=200, blank=True, null=True)  # Field renamed because it started with '_'.
    field_index = models.IntegerField(db_column='index', blank=True, null=True)  # Field renamed because it started with '_'.

    class Meta:
        managed = True
        db_table = 'gw_monitoring'

class WellType(models.Model):
    name=models.CharField(max_length=100)

    class Meta:
        managed = True
        db_table = 'type_of_well'

class GwLocations(models.Model):
    well_number = models.CharField(max_length=100, blank=True, null=True)
    identifier = models.CharField(max_length=100, blank=True, null=True)
    place = models.CharField(max_length=100, blank=True, null=True)
    longitude = models.FloatField(blank=True, null=True)
    latitude = models.FloatField(blank=True, null=True)
    type = models.ForeignKey(WellType, on_delete=models.CASCADE, default=1)

    class Meta:
        managed = True
        db_table = 'graound_water_locations'
