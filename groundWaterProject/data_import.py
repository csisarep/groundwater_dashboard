
from datetime import datetime



import requests
from requests.auth import HTTPBasicAuth
import pandas as pd
from decouple import config


import os

url= config('kobo_url')
kobo_username = config('kobo_username')
kobo_password = config('kobo_password')
auth = HTTPBasicAuth(kobo_username, kobo_password)


# files = {'filename': open('filename.txt','rb')}
def download_data():
    download = requests.get(url, auth=auth )
    # col_names = ['Enumerator Name','Geo_location','Municipality','village_name','ward','well_type','well_no_stw','well_no_dtw','gw_level','Height_of_measurement','measurement_unit',"Notes"]
    # df = pd.read_csv('updated_data.csv')  
    j = requests.get(url, auth=auth )
    df_json = j.json()
    gw_df = pd.DataFrame.from_dict(df_json)
    print('Script has been started at {}: Data Downloaded'.format(datetime.now()))
    return gw_df
    

df = download_data()

# Used this to get the precise location to save the file so that I could find it, but still was not able to locate the save file
file_to_save = os.path.join(os.path.dirname(os.path.realpath("data_import.py")), "Kobo_data_latest.csv")

## Change the column heading for readbility 

df.columns = ['_id', 'formhub/uuid', 'start', 'end',
       'today', 'deviceid', 'name_enum',
       'Select_District',
       'geo_location',
       'well_type',
       'sw_bk_well_no',
       'measurement_point_cm',
       'Well_photo_Use_the_ed_measurement_point',
       'Measurement_of_tape_ent_point_MP_in_m',
       'wet_point_measruement_on_tape',
       'gw_level_from_mp',
       'mp_in_m', 'gw_level',
       '__version__', '_version_', 'meta/instanceID', '_xform_id_string',
       '_uuid', '_attachments', '_status', '_geolocation', '_submission_time',
       '_tags', '_notes', '_validation_status', '_submitted_by',
       'location_details/bk_dw_no',
       'Audio_Notes_Use_the_to_record_any_notes',
       'Notes',
       'well_no_sw_bardiya',
       'well_no_dw_bardiya']
# Saving the downloaded Kobo database 
df.to_csv(file_to_save)
print(type(df))

## For some reason I cannot seem to find the stored file from above, therefore, trying to read the file that was saved
df_1 = pd.read_csv(file_to_save)

# Reading was possible and was also able to save the file to a desired directory (Which again seems to be lost #lol )
df_1.to_csv('/code/data/kobo_data.csv')
# Printing to check if the cron job is running as expected
print(df_1.shape)

## Please Transform df_1 accordingly and update the database here

# Currently for testing purpose the file is being downloaded every minute

