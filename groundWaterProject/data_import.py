#!/usr/bin/env python
# coding: utf-8

# In[1]:


import requests
import pandas as pd
import os


# In[2]:


import numpy as np


# In[3]:


import psycopg2 as pg
import psycopg2.extras


# In[4]:
from decouple import config

url= config('kobo_url')
kobo_username = config('kobo_username')
kobo_password = config('kobo_password')


response = requests.get("https://kobo.humanitarianresponse.info/api/v2/assets/ajbNkrfgsftG7FsDVqc5h9/data.json", headers = {"Authorization" : "Token 818c144f9d063d35f99e024b2686963be3249308"})
j = response.json()
df = pd.json_normalize(j['results'])
gw_df = df


# In[5]:


gw_df.columns = ['_id',
        'uuid',
        'start',
        'end',
        'today',
        'deviceid',
        'enumerator',
        'district',
        'geo_location',
        'well_type',
        'sw_bk_well_no',
        'measurement_point_cm',
        'Well_photo_Use_the_ed_measurement_point',
        'measurement_of_wet_point_on_tape__in_m_',
        'wet_point_measruement_on_tape',
        'gw_level_from_mp',
        'mp_in_m', 'gw_level',
        'version1', 'version2', 'meta/instanceID', '_xform_id_string',
        '_uuid', '_attachments', '_status', '_geolocation', '_submission_time',
        '_tags', '_notes', '_submitted_by',
        'bk_dw_no', 'Audio_Notes',
        'Notes',
        'well_no_sw_bardiya',
        'well_no_dw_bardiya'
       ]


# In[6]:


df_filtered = gw_df
df_filtered['well_num'] = (df_filtered['sw_bk_well_no'].combine_first(df_filtered['bk_dw_no']).combine_first(df_filtered['well_no_sw_bardiya']).combine_first(df_filtered['well_no_dw_bardiya']))
df_filtered['today'] = pd.to_datetime(df_filtered['today'])
df_filtered['latitude'] = df_filtered['geo_location'].apply(str).str.split(expand = True)[0]
df_filtered['longitude'] = df_filtered['geo_location'].apply(str).str.split(expand = True)[1]
df_filtered['precision'] = df_filtered['geo_location'].apply(str).str.split(expand = True)[3]
df_filtered['altitude'] = df_filtered['geo_location'].apply(str).str.split(expand = True)[2]


# In[7]:


df_filtered['fid'] = pd.RangeIndex(0, len(df_filtered)).to_series()
df_filtered = df_filtered[['today', 'district', 'latitude','longitude','altitude','precision','well_type','measurement_point_cm', 'measurement_of_wet_point_on_tape__in_m_',
         'gw_level_from_mp','mp_in_m','gw_level', 'fid','well_num']]
df_filtered = df_filtered.rename(columns={"today": "date"})
df_filtered = df_filtered.sort_values(by=['date'])
df_filtered.index = np.arange(1, len(df_filtered) + 1)


# In[8]:


df_filtered['well_type'].mask(df_filtered['well_type'] == 'sw', 1, inplace=True)
df_filtered['well_type'].mask(df_filtered['well_type'] == 'dt', 2, inplace=True)


# In[39]:

engine = psycopg2.connect(user=config('USER'),
                                  password=config('PASSWORD'),
                                  host="db",
                                  port="5432",
                                  database="groundwater")
# engine = pg.connect("dbname='groundwater' user='postgres' host='127.0.0.1' port='5432' password='krishna'")
engine.autocommit = True
df_pgadmin = pd.read_sql('select * from gw_monitoring_kobo', con=engine)
df_pgadmin = df_pgadmin.sort_values(by=['date'])
df_pgadmin.index = np.arange(1, len(df_pgadmin) + 1)


# In[40]:


df_filtered_postgres = df_filtered[df_filtered.index > len(df_pgadmin)]
df_filtered_postgres['fid']=df_filtered_postgres.index


# In[41]:


if len(df_filtered_postgres)>0:
    try:
        print('{} rows need to be updated'.format(len(df_filtered_postgres)))
        df_columns = list(df_filtered_postgres)
        table = 'gw_monitoring_kobo'
        # create (col1,col2,...)
        columns = ",".join(df_columns)

        # create VALUES('%s', '%s",...) one '%s' per column
        values = "VALUES({})".format(",".join(["%s" for _ in df_columns]))

        #create INSERT INTO table (columns) VALUES('%s',...)
        insert_stmt = "INSERT INTO {} ({}) {}".format(table,columns,values)
#         cur = engine.cursor() #= conn.cursor(cursor_factory=psycopg2.extras.DictCursor)
        cur = engine.cursor(cursor_factory=psycopg2.extras.DictCursor)
        psycopg2.extras.execute_batch(cur, insert_stmt, df_filtered_postgres.values)
        cur.execute("ROLLBACK")

        print('{} rows updated'.format(len(df_filtered_postgres)))
    except (Exception, pg.Error) as e:
        print(e)
    finally:
        if (engine):
            cur.close()
            engine.close()
            print("Connection closed.")
else:
    print('{} rows need to be updated'.format(0))
    print('{} rows updated'.format(0))
