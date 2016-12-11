#!/bin/bash
set -e

if [ "$1" = '/run.sh' ]; then
	exec /run.sh "$@"
fi

if [ ! -e '/var/www/html/index.php' ]; then
	unzip /usr/src/prestashop.zip -d /var/www/
	mv /var/www/prestashop/ /var/www/html/ && mv /var/www/prestashop/.* /var/www/html/
	chown -R $auser:$auser /var/www/html
fi

exec "$@"
