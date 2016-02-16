#!/bin/bash
set -e

if [ ! -e '/var/www/html/index.php' ]; then
	unzip /usr/src/prestashop.zip
	mv /usr/src/prestashop /var/www/html
	chown -R www-data /var/www/html
fi

exec "$@"
