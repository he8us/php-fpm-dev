FROM he8us/php-fpm-common:5.6

MAINTAINER Cedric Michaux <cedric@he8us.be>

COPY boot.sh /boot.sh
COPY confd/ /etc/confd

ENV XDEBUG_VERSION 2.5.0
ENV PHP_API 20131226
ENV XDEBUG_EXTENSION_PATH /usr/local/lib/php/extensions/no-debug-non-zts-${PHP_API}
ENV XDEBUG_EXTENSION ${XDEBUG_EXTENSION_PATH}/xdebug.so

RUN \
    apk update --no-cache \
    && apk add --no-cache \
            --virtual .phpize-deps $PHPIZE_DEPS \

    && export CFLAGS="$PHP_CFLAGS" CPPFLAGS="$PHP_CPPFLAGS" LDFLAGS="$PHP_LDFLAGS" \
    && pecl install xdebug-$XDEBUG_VERSION \
    && docker-php-ext-enable xdebug \
    && apk del .phpize-deps

CMD ["/boot.sh", "php-fpm"]
