#!/bin/sh
set -e
export PATH=/newrelic/daemon/:/newrelic/scripts/:$PATH

export NRSYSMOND_license_key=${NRSYSMOND_license_key:-$NEW_RELIC_LICENSE_KEY}
export NRSYSMOND_loglevel=${NRSYSMOND_loglevel:-info}
export NRSYSMOND_collector_host=${NRSYSMOND_collector_host:-collector.newrelic.com}
export NRSYSMOND_ssl=${NRSYSMOND_ssl:-true}
export NRSYSMOND_disable_docker=${NRSYSMOND_disable_docker:-false}
export NRSYSMOND_disable_nfs=${NRSYSMOND_disable_nfs:-false}

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

#nrsysmond-config --set license_key=${NEW_RELIC_LICENSE_KEY:-NRSYSMOND_license_key}

exec nrsysmond -c /etc/newrelic/nrsysmond.cfg -l /dev/stdout -f

