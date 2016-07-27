FROM python:2.7

MAINTAINER Revelsystems

RUN rm /bin/sh && ln -s /bin/bash /bin/sh

ENV APP_HOME=/home/docker/app
ENV APP_VIRTUALENV_PATH=/virtualenv/app

RUN virtualenv ${APP_VIRTUALENV_PATH}

COPY requirements /tmp/requirements
RUN source ${APP_VIRTUALENV_PATH}/bin/activate && pip install -r /tmp/requirements/base.txt

#VOLUME ${APP_HOME}/
VOLUME ${APP_VIRTUALENV_PATH}/