#!/bin/bash
set -e

if [ ! -e '/var/www/html/index.php' ]; then
	rm -rf /var/www/html
	unzip /usr/src/prestashop.zip -C /var/www/
	mv /var/www/prestashop /var/www/html
	chown -R www-data /var/www/html
fi

exec "$@"
