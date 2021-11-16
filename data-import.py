
from datetime import datetime



import requests
from requests.auth import HTTPBasicAuth
import pandas as pd



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
df.to_csv('code/data/downloaded_data')

print(type(df))

# from pathlib import Path

# output_file = 'Kobo_data_latest.csv'
# output_dir = Path('/code/data/downloaded_data')

# output_dir.mkdir(parents=True, exist_ok=True)

# df.to_csv(output_dir / output_file) 