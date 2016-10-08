#!/bin/sh
set -e

socket_file=${DOCKER_HOST#unix://}
if [ -S $socket_file ]; then
  docker-gen /etc/docker-gen/templates/nginx.sites.tmpl /etc/nginx/conf.d/default.conf
fi

exec "$@"
