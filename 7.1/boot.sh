#!/usr/bin/env bash

set -e

if [ "$1" = 'php-fpm' ]; then
    export XDEBUG_EXTENSION=$(find /usr/local/lib/php/extensions/ -name xdebug.so)

    /usr/local/bin/confd -onetime -backend env
fi

exec "$@"
