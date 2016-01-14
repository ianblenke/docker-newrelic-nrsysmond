FROM debian:squeeze
MAINTAINER Ian Blenke <ian@blenke.com>

ENV VERSION 2.3.0.129

RUN apt-get update -q && apt-get install -yq ca-certificates wget procps && \
    echo deb http://apt.newrelic.com/debian/ newrelic non-free >> /etc/apt/sources.list.d/newrelic.list && \
    wget -O- https://download.newrelic.com/548C16BF.gpg | apt-key add - && \
    apt-get update -q && \
    apt-get install -y -qq newrelic-sysmond && \
    apt-get clean

ADD run.sh /
CMD ["/run.sh"]
