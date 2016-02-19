#!/bin/bash
set -e

if [ -z "`ls /usr/local/etc/php/conf.d`" ] 
then
	cp -R /etc-start/php/conf.d/* /usr/local/etc/php/conf.d
fi
if [ ! -e '/var/www/html/index.php' ]; then
	unzip /usr/src/phpbb.zip -d /var/www/
	mv /var/www/phpBB3/ /var/www/html/ && mv /var/www/phpBB3/.* /var/www/html/
	chown -R www-data /var/www/html
fi

exec "$@"
