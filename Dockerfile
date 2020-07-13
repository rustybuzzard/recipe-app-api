FROM python:3.7-alpine
MAINTAINER CloudCollections Ltd

ENV PYTHONUNBUFFERED 1

COPY ./requirements.txt /requirements

RUN pip  install -r /requirements

RUN mkdir /app
WORKDIR /app
COPY ./app /app

# Don't want to access root user. Create a user
RUN adduser -D user
USER user
