# For now we can implement as a specific script. We can allow people to drop offline logger files in protected
# Environment then with automatic updating of these script. This would have to change file naming structure.
# And provide a specific form for doing so in the website. 


import pandas as pd
import plotly.express as px
import os
import time
from datetime import datetime
from datetime import timedelta
import calendar
from django.db import connection,transaction


def update_offline_csv():
  dfOffline = []
  names = ['rohini_khola', 'shikanpurwa','khadaicha','kalhanshgau','d_gau','channawa','banjare_gau']
  #need to changethis path for server mechanism
  path = "data/raw_offline_csv/"

  for x in names:
      fname = path + x + ".csv"
      fname
      df = pd.read_csv(fname,skiprows=1)
      df.columns = ["id","date", "pressure", "temperature", "water_level"]
      df.water_level = -df.water_level
      df['location'] = x
      dfOffline.append(df)

  offlineData = pd.concat(dfOffline, ignore_index=True)
  offlineData['date'] = pd.to_datetime(offlineData['date']).dt.strftime('%Y-%m-%dT%H:%M:%S')
  offlineData.sort_values('date')
  offlineData['id'] = pd.RangeIndex(0, len(offlineData)).to_series()
  offlineData.to_csv("data/offline_logger_full.csv",index=False) #index here used as PK
