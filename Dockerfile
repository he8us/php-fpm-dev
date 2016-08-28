FROM he8us/php-fpm-common:7.0

MAINTAINER Cedric Michaux <cedric@he8us.be>

COPY boot.sh /boot.sh
COPY confd/ /etc/confd

ENV XDEBUG_VERSION 2.4.1
ENV PHP_API 20151012
ENV XDEBUG_EXTENSION_PATH /usr/local/lib/php/extensions/no-debug-non-zts-${PHP_API}
ENV XDEBUG_EXTENSION ${XDEBUG_EXTENSION_PATH}/xdebug.so

RUN \
    curl -L -o xdebug-${XDEBUG_VERSION}.tgz http://xdebug.org/files/xdebug-${XDEBUG_VERSION}.tgz && \
    tar -xvzf xdebug-${XDEBUG_VERSION}.tgz && \
    cd xdebug-${XDEBUG_VERSION} && \
    phpize && \
    ./configure && \
    make && \
    cp modules/xdebug.so $XDEBUG_EXTENSION_PATH

CMD ["/boot.sh", "php-fpm"]
