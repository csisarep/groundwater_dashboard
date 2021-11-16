
from datetime import datetime



import requests
from requests.auth import HTTPBasicAuth
import pandas as pd
from decouple import config


import os

url= "https://kc.humanitarianresponse.info/api/v1/data/669773.json"
auth = HTTPBasicAuth('gw_monitoring', 'gwmonitor@2020')


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
# old_df = pd.read_csv('/code/data/Kobo_data_latest.csv')

file_to_save = os.path.join(os.path.dirname(os.path.realpath("data_import.py")), "Kobo_data_latest.csv")

# if len(df) > len(old_df):
df.to_csv(file_to_save)
print(type(df))
df_1 = pd.read_csv(file_to_save)
df_1.to_csv('/code/data/kobo_data.csv')
print(df_1.shape)
