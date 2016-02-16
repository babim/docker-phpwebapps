#!/bin/bash
set -e

if [ ! -e '/var/www/html/index.php' ]; then
	unzip /usr/src/phpbb.zip -d /var/www/
	mv /var/www/phpBB3/ /var/www/html/ && mv /var/www/phpBB3/.* /var/www/html/
	chown -R www-data /var/www/html
fi

exec "$@"
