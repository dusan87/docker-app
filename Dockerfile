FROM python:2.7

MAINTAINER Revelsystems

ENV APP_HOME=/home/docker/app

RUN easy_install supervisor

COPY requirements /tmp/requirements
RUN  pip install -r /tmp/requirements/base.txt

COPY config/supervisord.conf /etc/supervisor/supervisord.conf

VOLUME ${APP_HOME}/

CMD ["supervisord", "-n"]