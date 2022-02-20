FROM alpine:latest

ENV TIMEZONE Europe/Paris

ENV COMPOSER_ALLOW_SUPERUSER=1

WORKDIR /app

VOLUME /app

EXPOSE 80 8000 3000 8080 443 3306

RUN apk add --no-cache git npm composer nano

# RUN ln -s $(/usr/bin/${php_version}) /usr/bin/php

# COPY entrypoint.sh /
COPY /scripts/* /dwb/scripts/
COPY /config/* /dwb/config/

RUN chmod +x /dwb/scripts/*
# ENTRYPOINT ["/dwb/entrypoint.sh"]
