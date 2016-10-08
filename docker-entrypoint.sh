#!/bin/sh
set -e

if [[ -f "/var/run/docker.sock" ]]; then
  docker-gen /etc/docker-gen/templates/nginx.sites.tmpl /etc/nginx/conf.d/default.conf
fi

exec "$@"
