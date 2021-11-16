# syntax=docker/dockerfile:1
FROM python:3

WORKDIR /code
COPY . /code/
RUN apt-get update && apt-get -y install python3-pip && apt install cron -y
RUN pip install -r requirements.txt

### RUN CRON JOB TO DONWLOAD THE DATA from Crontab
# RUN apt install cron -y
RUN service cron start
RUN touch /var/log/cron.log
COPY crontab /etc/cron.d/cjob
RUN chmod 0644 /etc/cron.d/cjob
ENV PYTHONUNBUFFERED 1
CMD cron -f
# CMD ["cron","-f"]
