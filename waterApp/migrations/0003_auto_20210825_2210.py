# Generated by Django 2.2 on 2021-08-25 16:25

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('waterApp', '0002_auto_20210825_2205'),
    ]

    operations = [
        migrations.AlterField(
            model_name='gwmonitoring',
            name='field_geographic_location_altitude',
            field=models.CharField(blank=True, db_column='altitude', max_length=200, null=True),
        ),
        migrations.AlterField(
            model_name='gwmonitoring',
            name='field_geographic_location_latitude',
            field=models.CharField(blank=True, db_column='latitude', max_length=200, null=True),
        ),
        migrations.AlterField(
            model_name='gwmonitoring',
            name='field_geographic_location_longitude',
            field=models.CharField(blank=True, db_column='longitude', max_length=200, null=True),
        ),
        migrations.AlterField(
            model_name='gwmonitoring',
            name='field_geographic_location_precision',
            field=models.CharField(blank=True, db_column='location_precision', max_length=200, null=True),
        ),
        migrations.AlterField(
            model_name='gwmonitoring',
            name='field_id',
            field=models.IntegerField(blank=True, db_column='f_id', null=True),
        ),
        migrations.AlterField(
            model_name='gwmonitoring',
            name='field_index',
            field=models.IntegerField(blank=True, db_column='index', null=True),
        ),
        migrations.AlterField(
            model_name='gwmonitoring',
            name='field_notes',
            field=models.CharField(blank=True, db_column='f_notes', max_length=200, null=True),
        ),
        migrations.AlterField(
            model_name='gwmonitoring',
            name='field_status',
            field=models.CharField(blank=True, db_column='status', max_length=200, null=True),
        ),
        migrations.AlterField(
            model_name='gwmonitoring',
            name='field_submission_time',
            field=models.CharField(blank=True, db_column='submission_time', max_length=200, null=True),
        ),
        migrations.AlterField(
            model_name='gwmonitoring',
            name='field_submitted_by',
            field=models.CharField(blank=True, db_column='submitted_by', max_length=200, null=True),
        ),
        migrations.AlterField(
            model_name='gwmonitoring',
            name='field_tags',
            field=models.CharField(blank=True, db_column='tags', max_length=200, null=True),
        ),
        migrations.AlterField(
            model_name='gwmonitoring',
            name='field_the_water_level_is_gw_level_m_below_ground_field',
            field=models.CharField(blank=True, db_column='the_water_level_is___gw_level__m_below_ground', max_length=200, null=True),
        ),
        migrations.AlterField(
            model_name='gwmonitoring',
            name='field_uuid',
            field=models.CharField(blank=True, db_column='f_uuid', max_length=200, null=True),
        ),
        migrations.AlterField(
            model_name='gwmonitoring',
            name='field_validation_status',
            field=models.CharField(blank=True, db_column='validation_status', max_length=200, null=True),
        ),
        migrations.AlterField(
            model_name='gwmonitoring',
            name='field_version_field',
            field=models.CharField(blank=True, db_column='version', max_length=200, null=True),
        ),
        migrations.AlterField(
            model_name='gwmonitoring',
            name='field_your_mp_is_measurement_point_cm_cm_above_ground_field',
            field=models.CharField(blank=True, db_column='your_mp_is___measurement_point_cm__cm_above_ground__', max_length=200, null=True),
        ),
        migrations.AlterField(
            model_name='gwmonitoring',
            name='well_no_bd_dw',
            field=models.CharField(blank=True, db_column='well_no_bd_dw', max_length=200, null=True),
        ),
        migrations.AlterField(
            model_name='gwmonitoring',
            name='well_no_bd_sw',
            field=models.CharField(blank=True, db_column='well_no_bd_sw', max_length=200, null=True),
        ),
        migrations.AlterField(
            model_name='gwmonitoring',
            name='well_no_bk_dw',
            field=models.CharField(blank=True, db_column='well_no_bk_dw', max_length=200, null=True),
        ),
        migrations.AlterField(
            model_name='gwmonitoring',
            name='well_no_bk_sw',
            field=models.CharField(blank=True, db_column='well_no_bk_sw', max_length=200, null=True),
        ),
        migrations.AlterField(
            model_name='gwmonitoring',
            name='well_type_field',
            field=models.CharField(blank=True, db_column='well_type', max_length=200, null=True),
        ),
    ]