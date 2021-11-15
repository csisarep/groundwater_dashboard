# syntax=docker/dockerfile:1
FROM python:3

WORKDIR /code
COPY requirements.txt /code/
RUN apt-get update && apt-get -y install python3-pip
RUN pip install -r requirements.txt
COPY . /code/
ENV PYTHONUNBUFFERED=1
