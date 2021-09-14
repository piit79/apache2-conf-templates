#!/bin/sh

DIR=$(cd $(dirname $0) && pwd)

ln -s $DIR/conf.d /etc/apache2/conf.d
