# Generated by Django 2.2 on 2021-08-25 16:32

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('waterApp', '0003_auto_20210825_2210'),
    ]

    operations = [
        migrations.AlterField(
            model_name='gwmonitoring',
            name='field_geographic_location_altitude',
            field=models.FloatField(blank=True, db_column='altitude', null=True),
        ),
        migrations.AlterField(
            model_name='gwmonitoring',
            name='field_geographic_location_latitude',
            field=models.FloatField(blank=True, db_column='latitude', null=True),
        ),
        migrations.AlterField(
            model_name='gwmonitoring',
            name='field_geographic_location_longitude',
            field=models.FloatField(blank=True, db_column='longitude', null=True),
        ),
        migrations.AlterField(
            model_name='gwmonitoring',
            name='field_geographic_location_precision',
            field=models.FloatField(blank=True, db_column='location_precision', null=True),
        ),
        migrations.AlterField(
            model_name='gwmonitoring',
            name='field_the_water_level_is_gw_level_m_below_ground_field',
            field=models.FloatField(blank=True, db_column='the_water_level_is___gw_level__m_below_ground', null=True),
        ),
        migrations.AlterField(
            model_name='gwmonitoring',
            name='gw_level',
            field=models.FloatField(blank=True, null=True),
        ),
        migrations.AlterField(
            model_name='gwmonitoring',
            name='gw_level_from_mp',
            field=models.FloatField(blank=True, null=True),
        ),
        migrations.AlterField(
            model_name='gwmonitoring',
            name='measurement_of_tape_at_measurement_point_mp_in_m_field',
            field=models.FloatField(blank=True, db_column='measurement_of_tape_at_measurement_point__mp___in_m_', max_length=200, null=True),
        ),
        migrations.AlterField(
            model_name='gwmonitoring',
            name='measurement_of_wet_point_on_tape_in_m_field',
            field=models.FloatField(blank=True, db_column='measurement_of_wet_point_on_tape__in_m_', null=True),
        ),
        migrations.AlterField(
            model_name='gwmonitoring',
            name='mp_in_m',
            field=models.FloatField(blank=True, null=True),
        ),
    ]
