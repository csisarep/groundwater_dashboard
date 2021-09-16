from django.shortcuts import render
from django.http import HttpResponse

from waterApp.utils.update_odk_csv import update_odkData
from waterApp.utils.historical_lineGraph import create_histBankeGraph

# Create your views here.
from django.views.generic import TemplateView, View
from waterApp.models import GwLocations, GwMonitoring, GwLocationsData, GwMonitoringKobo
import json

class Dashboard(TemplateView):
    template_name = "index.html"

class Home(TemplateView):
    template_name = "frontend/home.html"

class MetaData(TemplateView):
    template_name = "frontend/pages/meta_data.html"

class DigitalMonitoring(TemplateView):
    template_name = "frontend/pages/digital_monitoring.html"
    def get_context_data(self,*args, **kwargs):
        context = super(DigitalMonitoring, self).get_context_data(*args,**kwargs)
        # df = update_odkData()
        # context['users'] = df['gw_level'][1]
        context['gw_locations'] = GwLocationsData.objects.all().exclude(latitude__isnull=True)
        return context

class HistoricalDatabase(TemplateView):
    template_name = "frontend/pages/historical_database.html"
    def get_context_data(self,*args, **kwargs):
        context = super(HistoricalDatabase, self).get_context_data(*args,**kwargs)
        create_histBankeGraph()
        return context

class AjaxGroundMeasurementRequest(View):

    def get(self, request):
        well_location = json.loads(self.request.GET.get("wells"))
        # print(well_location)
        wells=GwLocationsData.objects.filter(location__in =well_location)
        well_num = [well.well_num for well in wells]
        chart_data = {}
        for wn in well_num:
            water_level = GwMonitoringKobo.objects.filter(well_num=wn)
            chart_data[wn]={
                'data':[[str(wl.date),wl.gw_level] for wl in water_level]
            }
        # print(chart_data)
        return HttpResponse(json.dumps(chart_data), content_type="application/json")
