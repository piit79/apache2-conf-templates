#!/bin/sh

DIR=$(cd $(dirname $0) && pwd)
SRC="$DIR/conf.d"
DST=/etc/apache2/conf.d

[ -h $DST ] || echo "[II] Creating symlink $DST -> $SRC" && ln -s "$SRC" $DST

cd /etc/apache2/conf-available
if [ ! -h php-fpm.conf ]; then
    echo "[II] Symlink php-fpm.conf doesn't exist"
    php_fpm="$(ls -1 php*-fpm.conf)"
    if [ "$(echo "$php_fpm" | wc -l)" != "1" ]; then
        echo "[WW] Multiple PHP-FPM versions found, using the first one."
        php_fpm="$(echo "$php_fpm" | head -n1)"
    fi
    echo "[II] Creating symlink php-fpm.conf -> $php_fpm"
    ln -s $php_fpm php-fpm.conf
fi
