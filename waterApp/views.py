from django.shortcuts import render
from django.http import HttpResponse
from django.db import connection,transaction

from waterApp.utils.update_odk_csv import update_odkData
from waterApp.utils.update_offline_csv import update_offline_csv

# Create your views here.
from django.views.generic import TemplateView, View
from django.db.models import Count, Q, F, Sum
from waterApp.models import GwLocations, GwMonitoring, GwLocationsData, GwMonitoringKobo, OfflineLoggerData, HistoricalData
import json

# datatable
from django_datatables_view.base_datatable_view import BaseDatatableView
from django.utils.html import escape

class Dashboard(TemplateView):
    template_name = "index.html"

class Home(TemplateView):
    template_name = "frontend/home.html"

class MetaData(TemplateView):
    template_name = "frontend/pages/meta_data.html"

class DownloadTableData(TemplateView):
    template_name = "frontend/pages/data_tables.html"

    def get_context_data(self,*args, **kwargs):
        context = super(DownloadTableData, self).get_context_data(*args,**kwargs)
        context['columHeader']=[f.name for f in GwMonitoringKobo._meta.get_fields()]
        return context

class DigitalMonitoring(TemplateView):
    template_name = "frontend/pages/digital_monitoring.html"
    def get_context_data(self,*args, **kwargs):
        context = super(DigitalMonitoring, self).get_context_data(*args,**kwargs)
        # update_odkData() #update ODK database from KOBO if older than 24h
        # update_offline_csv()
        # with connection.cursor() as cursor:
        #     cursor.execute('DELETE FROM gw_monitoring_kobo', [])
        #     cursor.execute("COPY gw_monitoring_kobo(date,district,latitude,longitude,altitude,precision,well_type,measurement_point_cm,measurement_of_wet_point_on_tape__in_m_,gw_level_from_mp,mp_in_m,gw_level,fid,well_num) FROM '/opt/gw_level.csv' DELIMITER ',' CSV HEADER",[])
        #
        # #Still requires scheduling and adding only new columns - now it's loading all and rewriting database with every call
        # with connection.cursor() as cursor:
        #     # mixed case naming sub-optimal. Requires quoting table names when doing direct SQL.
        #    cursor.execute('DELETE FROM "waterApp_offlineloggerdata"', [])
        #     # Using triple quotes to allow for double quotes on table name and single quotes on file name and delimiter.
        #    cursor.execute("""COPY "waterApp_offlineloggerdata"(id,date,pressure,temperature,water_level,location) FROM '/opt/offline_logger_full.csv' DELIMITER ',' CSV HEADER""",[])

        # context['users'] = df['gw_level'][1]
        #passing one locatio set for deep and one for shallow tubewells to be managed in JS
        context['gw_locations'] = GwLocationsData.objects.all().exclude(latitude__isnull=True)
        context['gw_locations1'] = GwLocationsData.objects.all().exclude(latitude__isnull=True)
        context['tablet_monitoring'] = GwMonitoringKobo.objects.all()
        return context

class HistoricalDatabase(TemplateView):
    template_name = "frontend/pages/historical_database.html"
    def get_context_data(self,*args, **kwargs):
        context = super(HistoricalDatabase, self).get_context_data(*args,**kwargs)
        context['wells_dropdown'] = HistoricalData.objects.order_by('location').values_list('location').distinct()

        # create_histBankeGraph()
        return context

class AjaxGroundMeasurementRequest(View):

    def get(self, request):
        well_location = json.loads(self.request.GET.get("wells"))
        # print(well_location)
        wells=GwLocationsData.objects.filter(location__in =well_location)
        well_num = [well.well_num for well in wells]
        chart_data = {}
        for wn in well_num:
            water_level = GwMonitoringKobo.objects.filter(well_num=wn).order_by('date')
            chart_data[wn]={
                'data':[[str(wl.date),wl.gw_level] for wl in water_level]
            }
        # print(chart_data)
        return HttpResponse(json.dumps(chart_data), content_type="application/json")

class AjaxOfflineLoggerRequest(View):
    def get(self, request):
        well_location = json.loads(self.request.GET.get("wells"))
        chart_data = {}
        for wl in well_location:
            water_level = OfflineLoggerData.objects.filter(location=wl).order_by('date')
            chart_data[wl]={
                'data':[[str(wl.date),wl.water_level] for wl in water_level]
            }
        # print(chart_data)
        return HttpResponse(json.dumps(chart_data), content_type="application/json")

class AjaxHistoricalDataRequest(View):

    def get(self, request):
        well_location = json.loads(self.request.GET.get("wells"))
        chart_data = {}
        for wl in well_location:
            water_level = HistoricalData.objects.filter(location=wl).order_by('date')
            chart_data[wl]={
                'data':[[str(wl.date),wl.water_level] for wl in water_level]
            }
        # print(chart_data)
        return HttpResponse(json.dumps(chart_data), content_type="application/json")


columns_header = [f.name for f in GwMonitoringKobo._meta.get_fields()]
SEARCH_COLUMNS =[]
for col in columns_header:
    try:
        model = GwMonitoringKobo._meta.get_field(col).related_model._meta.model
        SEARCH_COLUMNS.append(col+'__name')
    except:
        SEARCH_COLUMNS.append(col)
class wellDatatable(BaseDatatableView):
    # The model we're going to show
    model = GwMonitoringKobo

    # define the columns that will be returned
    columns = columns_header

    def get_initial_queryset(self):
        # return queryset used as base for futher sorting/filtering
        # these are simply objects displayed in datatable
        # You should not filter data returned here by any filter values entered by user. This is because
        # we need some base queryset to count total number of records.
        qs = GwMonitoringKobo.objects.all()
        return qs

    def paging(self, qs):
        """ Paging
        """
        limit = min(int(self._querydict.get('length', 10)), 1000)
        start = int(self._querydict.get('start', 0))
        # if pagination is disabled ("paging": false)

        if limit == -1:
            return qs

        offset = start + limit

        return qs[start:offset]

    def filter_queryset(self, qs):
        search = self._querydict.get('search[value]', None)
        q = Q()
        filter_method = 'istartswith'
        for col_no, col in enumerate(self.columns_data):
            # col['data'] - https://datatables.net/reference/option/columns.data
            data_field = col['data']
            try:
                data_field = int(data_field)
            except ValueError:
                pass
            if isinstance(data_field, int):
                column = SEARCH_COLUMNS[data_field]  # by index so we need columns definition in self._columns
            else:
                column = data_field
            column = column.replace('.', '__')
            # apply global search to all searchable columns
            if search and col['searchable']:
                q |= Q(**{'{0}__{1}'.format(column, filter_method): search})

            # column specific filter
            if col['search.value']:
                qs = qs.filter(**{
                    '{0}__{1}'.format(column, filter_method): col['search.value']})
        qs = qs.filter(q)
        return qs
