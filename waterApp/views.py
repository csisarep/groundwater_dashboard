from django.shortcuts import render
from waterApp.utils.update_odk_csv import update_odkData
from waterApp.utils.historical_lineGraph import create_histBankeGraph
# Create your views here.
from django.views.generic import TemplateView


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
        df = update_odkData()
        context['users'] = df['gw_level'][1]
        return context

class HistoricalDatabase(TemplateView):
    template_name = "frontend/pages/historical_database.html"
    def get_context_data(self,*args, **kwargs):
        context = super(HistoricalDatabase, self).get_context_data(*args,**kwargs)
        create_histBankeGraph()
        return context

