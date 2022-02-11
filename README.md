# Nepal Groundwater Monitoring Dashboard



## Background

The code of this repository is a product of the CSISA-Resilience project in partnership with Nepal’s Groundwater Resources Development Board and aims to contribute to Nepal’s capacity to operate a digital groundwater monitoring system through a small pilot project in the USAID Feed the Future Zone of Nepal’s Tarai region. The ongoing expansion of groundwater resources development will undoubtedly provide great contribution to Nepal’s irrigation sector and food security. Along this way, a digital groundwater monitoring system will be critical to help the country guide the development and management of the resource by providing decision-makers and communities with adequate spatial evidence and information about the opportunities and risks for sustainable and equitable groundwater use.

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



### Docker setup 

The key docker configurations can be found in docker-compose.yml and the respective Dockerfiles.
Most importantly, check in the ./Dockerfile in the root folder of this app for the webApp installation files.
Most other services (Webserver, database etc.) use existing default containers, provided by the developers that are then configured for this project.


### WebApp 

This is the core of the dashboard. The WebApp uses Django as the key framework. See https://docs.djangoproject.com/en/4.0/ for a detailed documentation. Django is organized according the Model-View-Template principle. This means that the data lives in the 'model' component, the page stucture lives in the 'View' component, and the visualization live in the 'template' component.


### Use cases

#### Changing exising text on the dashboard 

As mentioned above, the text and visualziation component are stored in the template component of the app. The template folder contains all the relevant files. Django uses its own templating engine for joining various smaller html files. It essence, the dashboard website starts from the ./template/frontend/base/base.html file. Core elements such as the dashboard webApp title and key global html settings can be changed here.

For changing elements on specific pages, please look at the following folder: ./template/frontend/pages. It contains the html components for each page included in the dashbaord. To stick with out example, the first map on the 'digital monitoring' page lives in the ./template/frontend/pages/digital_monitoring.html file. The tile of the first map can be changed directly in this file (see screenshot below):
***** Add screenshot from both intiial and changed state here******



TODO (Krishna) to think through how to best explain folder and templating structure.
TODO (Krishna) check through frotend, base folder in template folder and explain what each is for. 


For example, if one want to change the header of the first map in the monitoring page: 
1. 

#### Add a new page to the dashboard

Step by step guide:









## Contact

For questions or queries please contact activity leader Anton Urfels (a.urfels@cgiar.org) and developer Krishna Kafle (krishnakafle72@gmail.com)



# restore database in postgres
#### location of groundwater.sql must be inside /var/lib/postgresql

psql groundwater < groundwater.sql

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
