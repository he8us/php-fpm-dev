FROM he8us/php-fpm-common:7.0

MAINTAINER Cedric Michaux <cedric@he8us.be>

COPY confd/ /etc/confd

ENV XDEBUG_VERSION 2.5.0

RUN \
    apk --no-cache add \
        --virtual .phpize-deps \
        build-base \
        autoconf \
    && export CFLAGS="$PHP_CFLAGS" CPPFLAGS="$PHP_CPPFLAGS" LDFLAGS="$PHP_LDFLAGS" \
    && pecl install xdebug-$XDEBUG_VERSION \
    && docker-php-ext-enable xdebug \
    && apk del .phpize-deps

