# Nepal Groundwater Monitoring Dashboard



## Background

The code of this repository is a product of the CSISA-Resilience project in partnership with Nepal’s Groundwater Resources Development Board and aims to contribute to Nepal’s capacity to operate a digital groundwater monitoring system through a small pilot project in the USAID Feed the Future Zone of Nepal’s Terai region. The ongoing expansion of groundwater resources development will undoubtedly provide great contribution to Nepal’s irrigation sector and food security. Along this way, a digital groundwater monitoring system will be critical to help the country guide the development and management of the resource by providing decision-makers and communities with adequate spatial evidence and information about the opportunities and risks for sustainable and equitable groundwater use.

The Cereal Systems Initiative in South Asia (CSISA; www.csisa.org) is supported by USIAD and the Bill and Melinda Gates Foundation and is led by the International Maize and Wheat Improvement Center (CIMMYT) and implemented jointly with the International Water Management Institute (IWMI), International Food Policy Research Institute (IFPRI) and the International Rice Research Institute (IRRI). In Nepal, new support from USAID has led to the implementation of the CSISA Covid-19 Response and Resilience Activity (CSISA-Resilience), which is also implemented with Texas A&M University, Cornell University, and International Development Enterprises (iDE). CSISA-Resilience involves two inter-linked objectives that address CSISA’s strengths in core areas needed to assist in COVID-19 response and recovery, as well as Nepal’s longer-term building of processes and structures that can enhance resilience to shocks, with emphasis empowering youth and overcoming challenges faced by women headed farm households. The views expressed on this website do not necessarily reflect the views of the donors.## We be listing the procedure for setup of project later on.

### Objectives of Project (Answers Why this project?)

The main objective of this evaluation is to assess the efficiency, effectiveness, sustainability and viability of digital groundwater monitoring system through a small pilot project. This project ultimately helps to improve consultation mechanisms among the stakeholder groups including regulators, user groups, decision makers and communities with adequate spatial evidence and information about the opportunities and risk for sustainable and equitable groundwater use.

The specific objectives are:

- To find the actual progress made aimed by the pilot project.

- To evaluate the annual cost, human resources and equipment required to implement the project and for the future expansion.

- To summarize the lessons learned during the pilot project.

- To analyze the risks and challenges of digital groundwater monitoring system.

- To compare and validate the data collected from the different approaches.

- To establish protocol for digital groundwater monitoring system.

- To recommend the best groundwater monitoring methodology.

### Work flow diagram (Answers How it is done?)

<p align="center">
<img src="flow-diagram.png" alt="Flow Diagram"/>
</p>

### Open use and extenditibility (call for collaboration)

Although this dashboard has been developed specifically for Nepal and contains Nepal specific data, it can be quickly adjusted for any other context and data collection environment. Doing so merely requires updating the ODK API for accessing the collected data, ensuring that the fields of the data collections are correct and adjusting the graphs of interest. The idea is for this to be a rapid and low-maintenance solution that compelemnts more heavy and  

We licenced this project openly with the MIT Licence. Please feel free to contribute to and extend the project to fit your needs. If you do so we appreciate your getting in touch with us. We particularly encourage the usage of this code to build rapid, hyper flexible, and open data system that compelemnts more general and heavy-weight open-source solutions.

For displaying different graphs, the dashboard can be easily extended. Adding JavaScript graphs can follow the same patterns as implemented already. Some users might prefer to use python for generating interactive graphs and can do so by extending the requirements.txt and simply following the subsequent procedure: For example, one can write a function to generate either graph images or interactive HTML output through e.g. matplotlib, bokeh, or plotly. This function can then be called in the view to generate the output of interest and then included in the relevant html template sections.


## Installation and development guide

We first provide a quick installation guide and then provide a more in-depth explanation of the project setup. If you just want to install the system you may follow the steps below. For adding features or modifying the project, you may refer to the more detailed explanations afterwards.

In the docuemntation we describe key features assuming that the intended user has basic programming skills but may not be familiar with the used software and libraries of this project.

### Installation Process
Please configure .env file for your configuration. Rename .env_sample file to .env and make the changes for credentials and kobo url

```
USER=postgres
PASSWORD=krishna
kobo_url=https://kobo_url_here.com
kobo_password=Kobo_password_here
kobo_username=Kobo_username_here
site_url
```

For installation one merely requires Docker and Docker Compose to be installed. First Build the docker container with following commands:

```
docker-compose build
````


The website can then be simply started for testing and further development by running:
```
docker-compose up
```

When the website is running for the first time, the database needs to first be restored by logging into the db container and executing a restore with the following sequence of commands in your terminal:

```
docker exec -it groundwater_db_1 /bin/bash  #entering the db container shell
su postgres #switching to postgress user
psql -U postgres -f /opt/groundwater.sql #restoring the database
```

Potentially, the container name 'goundwater_db_1' has to be adjusted to match the local container name.

You are all set for the local development and boom you can collaborate or use as per your requirements.

### Folder structure
This will present user the basic folder structure of this project. It presents which file can be found at what location and explain a bit how user can
modify the project for his/her requirements. We will explain this in detail during the use case scenario examples.

```
    .
    ├── data                   # datafiles 'csv' to be shared with web containers
    ├── db_data                # datafiles 'csv' to be shared with db container
    ├── groundWaterProject     # Original project file created by django
    ├   ├── settings.py
    ├   ├── urls.py            # Main url file where other url from different apps are imported
    ├── static                 #  static content to be used in django project
    ├── templates              # HTMLTemplates to be used by django project
    ├── waterApp               # water app include combination of models, views, templates, template tags, static files, URLs, middleware, etc.
    ├   ├── models.py
    ├   ├── views.py
    ├   ├── urls.py
    ├   
    ├── LICENSE
    ├── .env
    ├── .gitignore
    ├── docker-compose.yml
    ├── Dockerfile
    ├── requirements.txt
    └── README.md
```


### Docker setup

The key docker configurations can be found in docker-compose.yml and the respective Dockerfiles.
Most importantly, check in the ./Dockerfile in the root folder of this app for the webApp installation files.
Most other services (Webserver, database etc.) use existing default containers, provided by the developers that are then configured for this project.


### WebApp

This is the core of the dashboard. The WebApp uses Django as the key framework. See https://docs.djangoproject.com/en/4.0/ for a detailed documentation. Django is organized according the Model-View-Template principle. This means that the data lives in the 'model' component, the page stucture lives in the 'View' component, and the visualization live in the 'template' component.

### Django MVT (<a href='https://www.javatpoint.com/django-mvt'>refer here</a> )
The MVT (Model View Template) is a software design pattern. It is a collection of three important components Model View and Template. The Model helps to handle database. It is a data access layer which handles the data.

The Template is a presentation layer which handles User Interface part completely. The View is used to execute the business logic and interact with a model to carry data and renders a template.
<p align="center">
<img src="MVT.png" alt="MVT architecture"/>
</p>

### Use cases:

#### Changing exising text on the dashboard

As mentioned above, the text and visualziation component are stored in the template component of the app. The template folder contains all the relevant files. Django uses its own templating engine for joining various smaller html files. It essence, the dashboard website starts from the ./template/frontend/base/base.html file. Core elements such as the dashboard webApp title and key global html settings can be changed here.

Here, users need to understand about template and static folder structure in order to make changes in the for texts and figures.

##### Templates folder structures
```
├── template
├   ├── base                                      # TODO for backed section of Project
├   ├     ├──include
├   ├     ├──base.html
├   ├── frontend
├   ├      ├──base
├   ├      ├    ├──include
├   ├      ├    ├     ├──navbar.html              # you can edit here for navbar
├   ├      ├    ├──base.html                      # you can add/edit libraries, title of page etc
├   ├      ├──pages
├   ├      ├    ├──data_tables.html               # you can make changes for datatables for downloading monitoring data
├   ├      ├    ├──digital_monitoring.html        # any changes required for didgital monitoring page goes here
├   ├      ├    ├──historical_database.html       # Historical data chart can be modified here
├   ├      ├    ├──meta_data.html                 # changes for metadata discription goes here
├   ├      ├──home.html
├   ├── index.html                                # TODO for backend section of Project

```
Any user if wishes to make changes to the webpage, he/she can do so by editing the html content as shown in the template structure
#### Static folder structures
```
├── static
├   ├── admin                                       # For django admin pages, we haven't implemented this for now.
├   ├── css
├   ├    ├──style.css                               # modify style rule for web page
├   ├    ├── ......                                 # other css libraries
├   ├── img                                         # all image for the web page goes here. User can add/remove image here and adjust the link from html,js files
├   ├── js
├   ├    ├── waterApp                               # modify JavaScript rule for web page
├   ├    ├      ├── chart.js                        # User can add remove the chart type or modify the existing chart
├   ├    ├      ├── chartData.js                    # data formating for chart type. Data obtained from API has to be restructured as per the requirements of chart.
├   ├    ├      ├── filter.js                       # Json filter operation is done here. In our case we have filtered json data based upon the district
├   ├    ├      ├── functions.js
├   ├    ├      ├── layers.js                       # layers for the leaflet map are initiated here. user can add/remove the layers required for the map here as per his/her requirements.
├   ├    ├      ├── monitoring.js                   # JavaScript rule for the data, chart & map is defined here.
├   ├    ├── ......                                 # other JavaScript libraries

```
User should be able to make changes to css and javascript file from here. But we assume the user have some basic understanding of html, css and javascript. User can refer to following sites for basic understanding of concepts:
 - https://www.w3schools.com/html/default.asp for HTML
 - https://www.w3schools.com/css/default.asp for CSS
 - https://www.w3schools.com/js/default.asp for javascript
 - https://leafletjs.com/examples.html for leaflet examples and documentations
  - https://docs.djangoproject.com/en/4.0/topics/templates/ for django template structure in addition to html, javascript and css




For changing elements on specific pages, please look at the following folder: ./template/frontend/pages. It contains the html components for each page included in the dashbaord. To stick with out example, the first map on the 'digital monitoring' page lives in the ./template/frontend/pages/digital_monitoring.html file.

<p align="center">
<img src="dashboard.png" alt="dashboard"/>
Preview for dashbaord we have developed <br> https://gw-nepal.com/
</p>

User should be able to make changes to the web page now with these concepts. In case user still has issue, please go to above reference and have some basic understanding on the topic.


#### Add a new page to the dashboard

Step by step guide:

  1. Create a html django template in 'template/frontend/pages' folder named sample_page.html then populate the content as per you requirements

```
{% extends 'frontend/base/base.html' %}
{% load static %}

{% block page_content %}

<div class="wrapper wrapper-content">
  <div class="container">
    <div class="row">
      <div class="col-md-12">
        <div class="ibox">
          <div class="ibox-title">
            <h1>Sample page of this Dashboard</h1>
          </div>
          <div class="ibox-content">
            <p>
              Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.

          </div>
        </div>

      </div>

    </div>


  </div>
</div>
{% endblock %}

```
  2. Add class named 'SamplePage' inside 'waterApp/views.py' with following code:
  ```
  class SamplePage(TemplateView):
      '''
          this page displays the sample page information for the dashboard
      '''
      template_name = "frontend/pages/sample_page.html"
  ```
  3. Add urls inside 'waterApp/urls.py' with following code:
  ```
    path('sample-page', views.SamplePage.as_view(), name='sample-page')
  ```
  4. Add header for navbar inside "template/frontend/base/include/navbar.html" with following code:
  ```
  <li class="{% if 'sample-page' in request.path %}active {% endif %}" >
      <a aria-expanded="false" role="button" href='{% url "sample-page" %}'> Sample Page </a>
  </li>
  ```
  <p align="center">
  <img src="sample_page.png" alt="dashboard"/>
  Preview for sample page that we have added
  </p>






## Contact

For questions or queries please contact activity leader Anton Urfels (a.urfels@cgiar.org) and developer Krishna Kafle (krishnakafle72@gmail.com)



# restore database in postgres
#### location of groundwater.sql must be inside /var/lib/postgresql

psql groundwater < groundwater.sql

or go to postgres docker container, and postgres shell
```
docker exec -it <postgres_container> bash
psql -U postgres
```
connect to groundwater database, and run the sql file to upload data to database

```
\c groundwater
\i /var/lib/postgres/data/groundwater.sql
```


### this command restore backed up database to the existing database named "groundwater" (TO be removed later on)


docker cp ./database/well_type_update.sql groundwater_db_1:/opt/


# docker commands
```
docker exec -it groundwater_1_db /bin/bash #groundwater_1_db is the container name
you can use docker ps -a   #to list all containers and names
su postgres
psql -d groundwater #Enters database named groundwater
\dt #Listout all tables for database

```
you can further use command lines for database queries from here
