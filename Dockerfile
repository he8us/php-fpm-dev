FROM he8us/php-fpm-common

MAINTAINER Cedric Michaux <cedric@he8us.be>

COPY boot.sh /boot.sh
COPY confd/ /etc/confd

ENV XDEBUG_VERSION 2.4.0
ENV XDEBUG_DATE 20160303
ENV XDEBUG_EXTENSION /usr/local/lib/php/extensions/no-debug-non-zts-${XDEBUG_DATE}

RUN \
    curl -L -o xdebug-${XDEBUG_VERSION}.tgz http://xdebug.org/files/xdebug-${XDEBUG_VERSION}.tgz && \
    tar -xvzf xdebug-${XDEBUG_VERSION}.tgz && \
    cd xdebug-${XDEBUG_VERSION} && \
    phpize && \
    ./configure && \
    make && \
    cp modules/xdebug.so $XDEBUG_EXTENSION


CMD ["/boot.sh", "php-fpm"]

