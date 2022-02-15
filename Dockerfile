# syntax=docker/dockerfile:1

# This file provides the instructions for building the webApp container.
# Think of it as installing all key component on a fresh linux system.
# As you can see the webApp is code is installed by copying the code folder.
# And other key components and configurations are installed and adjusted afterwards. 

FROM python:3
WORKDIR /code
COPY . /code/
RUN apt-get update && apt-get -y install python3-pip && apt install cron -y
RUN pip install -r requirements.txt
RUN pip install gunicorn 
RUN pip uninstall decouple
### RUN CRON JOB TO DONWLOAD THE DATA from Crontab
# RUN apt install cron -y
RUN service cron start
RUN touch /var/log/cron.log
COPY crontab /etc/cron.d/cjob
RUN chmod 0644 /etc/cron.d/cjob
ENV PYTHONUNBUFFERED 1
CMD cron -f

# CMD ["cron","-f"]