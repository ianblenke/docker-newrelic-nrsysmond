#!/bin/sh
set -e
export PATH=/newrelic/daemon/:/newrelic/scripts/:$PATH

export NRSYSMOND_license_key=${NRSYSMOND_license_key:-$NEW_RELIC_LICENSE_KEY}
export NRSYSMOND_loglevel=${NRSYSMOND_loglevel:-info}
export NRSYSMOND_ssl=${NRSYSMOND_ssl:-true}

#NRSYSMOND_disable_docker=${NRSYSMOND_disable_docker:-false}
#NRSYSMOND_disable_nfs=${NRSYSMOND_disable_nfs:-false}
#NRSYSMOND_collector_host=${NRSYSMOND_collector_host:-collector.newrelic.com}
#NRSYSMOND_labels=type:docker-host;cluster:coreos;region:useast;
#NRSYSMOND_proxy=
#NRSYSMOND_docker_connection=
#NRSYSMOND_docker_cert_path=
#NRSYSMOND_docker_cert=
#NRSYSMOND_docker_key=
#NRSYSMOND_docker_cacert=
#NRSYSMOND_ssl_ca_bundle=
#NRSYSMOND_ssl_ca_path=
#NRSYSMOND_cgroup_root=

env | grep NRSYSMOND | while read line ; do
  key="$(echo $line | cut -d= -f1- | sed -e 's/^NRSYSMOND_//')"
  value="$(echo $line | cut -d= -f2-)"
  nrsysmond-config --set $key="$value"
done

if [ -n "$CAT_CONFIG" ]; then
  cat /etc/newrelic/nrsysmond.cfg
fi

exec nrsysmond -c /etc/newrelic/nrsysmond.cfg -l /dev/stdout -f
