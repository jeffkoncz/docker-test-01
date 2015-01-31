FROM postgres:9.4
MAINTAINER Jeff Koncz <mike@embody.org>

ENV POSTGIS_MAJOR 2.1
ENV POSTGIS_VERSION 2.1.5+dfsg-1~exp2~90.git884bcd4.pgdg70+1

RUN echo deb http://http.debian.net/debian wheezy-backports main >> /etc/apt/sources.list
RUN apt-get update \
      && apt-get install -y --no-install-recommends \
           postgresql-9.4-pgrouting \
      && rm -rf /var/lib/apt/lists/*

RUN mkdir -p /docker-entrypoint-initdb.d
COPY ./initdb-postgis.sh /docker-entrypoint-initdb.d/postgis.sh
