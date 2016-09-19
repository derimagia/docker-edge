#!/bin/sh
set -e

docker-gen /etc/docker-gen/templates/nginx.sites.tmpl /etc/nginx/conf.d/default.conf

exec "$@"
