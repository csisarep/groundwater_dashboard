"""groundWaterProject URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/2.2/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""

from django.urls import path
from waterApp import views

urlpatterns = [
    path('dashboard/', views.Dashboard.as_view(), name='dashboard'),
    path('', views.Home.as_view(), name='home'),
    path('meta-data', views.MetaData.as_view(), name='meta-data'),
    path('digital-monitoring/', views.DigitalMonitoring.as_view(), name='digital-monitoring'),
    path('historical-database/', views.HistoricalDatabase.as_view(), name='historical-database'),

]
