# Generated by Django 2.2 on 2021-08-26 06:48

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('waterApp', '0005_gwlocations'),
    ]

    operations = [
        migrations.CreateModel(
            name='WellType',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(max_length=100)),
            ],
            options={
                'db_table': 'type_of_well',
                'managed': True,
            },
        ),
    ]
