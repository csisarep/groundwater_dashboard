from django.shortcuts import render
from django.http import HttpResponse
import requests
import pandas as pd
import os
import time
from datetime import datetime
from datetime import timedelta
import calendar
from django.db import connection,transaction



def update_odkData():
    diff = timedelta(hours=24)
    if os.path.exists("data/gw_level.csv"):
        mod_date = os.path.getmtime("data/gw_level.csv")
        cur_time = datetime.fromtimestamp(mod_date)
        diff = datetime.today() - cur_time
    if diff > timedelta(days=0.00001):
                response = requests.get("https://kobo.humanitarianresponse.info/api/v2/assets/ajbNkrfgsftG7FsDVqc5h9/data.json", headers = {"Authorization" : "Token 818c144f9d063d35f99e024b2686963be3249308"})
                j = response.json()
                df = pd.json_normalize(j['results'])
                gw_df = df
                gw_df.columns
                #rename columns for easier reading
                gw_df.columns = ['_id', 'uuid', 'start', 'end', 'today', 'deviceid',
                       'enumerator',
                       'district',
                       'geo_location',
                       'well_type',
                       'well_no_sw_bardiya',
                       'measurement_point_cm',
                       'Well_photo_Use_the_ed_measurement_point',
                       'Measurement_of_tape_ent_point_MP_in_m',
                       'wet_point_measruement_on_tape',
                       'gw_level_from_mp',
                       'mp_in_m', 'gw_level',
                       'version1', 'version2', 'meta/instanceID', '_xform_id_string',
                       '_uuid', '_attachments', '_status', '_geolocation', '_submission_time',
                       '_tags', '_notes', '_submitted_by',
                       'well_no_dw_bardiya',
                       'bk_dw_no',
                       'sw_bk_well_no',
                       'Audio_Notes',
                       'Notes']
                gw_df

                #selection of columns here
                all_cols = ['enumerator','geo_location','district',
                    'well_type','sw_bk_well_no','bk_dw_no','well_no_sw_bardiya','well_no_dw_bardiya','measurement_point_cm',
                    'Measurement_of_tape_ent_point_MP_in_m', 'wet_point_measruement_on_tape','gw_level',
                    'Notes','today','Audio_Notes','mp_in_m','gw_level_from_mp']

                        # print(gw_df)
                df = pd.DataFrame()

                #subset for columns
                for cols in all_cols:
                    df[cols] = gw_df[cols]

                        # df = gw_df.copy()  
                        # print(df) 
                        # df = df.sort_values(by='today')
                        # print(df)
                        # df['Enumerator']
                            # print(gw_df[i])   
                df['well_no'] = (df['sw_bk_well_no'].combine_first(df['bk_dw_no']).combine_first(df['well_no_sw_bardiya']).combine_first(df['well_no_dw_bardiya']))
                ## onvertt he today data to date    

                df['today'] = pd.to_datetime(df['today'])

                df['today']

                df['Month'] = df['today'].dt.month
                # print(df['Month'])
                df['Month'] = df['Month'].apply(lambda x: calendar.month_abbr[x]) 
                #Now ensure to match the data model in django (i.e. the gw_monitoring_kobo)
                df['latitude'] = df['geo_location'].apply(str).str.split(expand = True)[0]
                df['longitude'] = df['geo_location'].apply(str).str.split(expand = True)[1]
                df['precision'] = df['geo_location'].apply(str).str.split(expand = True)[3]
                df['altitude'] = df['geo_location'].apply(str).str.split(expand = True)[2]
                df.drop(columns =["geo_location","sw_bk_well_no", "bk_dw_no", "well_no_sw_bardiya", "well_no_dw_bardiya"], inplace = True)
                df['fid'] = pd.RangeIndex(0, len(df)).to_series()
                df = df[['today', 'district', 'latitude','longitude','altitude','precision','well_type','measurement_point_cm', 'Measurement_of_tape_ent_point_MP_in_m',
                         'gw_level_from_mp','mp_in_m','gw_level', 'fid','well_no']]  
                df = df.rename(columns={"today": "date"})
                df = df.sort_values(by=['date'])


                df.to_csv("data/gw_level.csv",index=False)

                return(df)
                #else:
                #    df = pd.read_csv("data/gw_level.csv")
    else:
                df = pd.read_csv("data/gw_level.csv")
                return(df)
    
        
        

