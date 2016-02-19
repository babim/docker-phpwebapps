#!/bin/bash
set -e

if [ -z "`ls /usr/local/etc/php/conf.d`" ] 
then
	cp -R /etc-start/php/conf.d/* /usr/local/etc/php/conf.d
fi
if [ ! -e '/var/www/html/version.php' ]; then
	tar cf - --one-file-system -C /usr/src/owncloud . | tar xf -
	chown -R www-data /var/www/html
fi

exec "$@"
