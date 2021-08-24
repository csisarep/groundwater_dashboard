from django.shortcuts import render

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
