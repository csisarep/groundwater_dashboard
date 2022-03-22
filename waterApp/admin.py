from django.contrib import admin
from waterApp.models import *

# Register your models here.
admin.site.register([GwMonitoring, GwMonitoringKobo,GwLocationsData,OfflineLoggerData, HistoricalData])
