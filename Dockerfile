FROM nginx:alpine
MAINTAINER Dave Wikoff <dgsims@gmail.com>

EXPOSE 80 443

RUN apk add --no-cache openssl

# Templates / Docker-gen
ENV DOCKER_GEN_VERSION 0.7.3

RUN wget https://github.com/jwilder/docker-gen/releases/download/$DOCKER_GEN_VERSION/docker-gen-linux-amd64-$DOCKER_GEN_VERSION.tar.gz \
    && tar -C /usr/local/bin -xvzf docker-gen-linux-amd64-$DOCKER_GEN_VERSION.tar.gz \
    && rm /docker-gen-linux-amd64-$DOCKER_GEN_VERSION.tar.gz

RUN mkdir -p /etc/docker-gen/templates/

COPY etc/nginx.sites.tmpl /etc/docker-gen/templates/
COPY etc/nginx.conf /etc/nginx/

COPY docker-entrypoint.sh /
ENTRYPOINT ["/docker-entrypoint.sh"]
CMD ["nginx", "-g", "daemon off;"]
