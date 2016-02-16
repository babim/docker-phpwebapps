#!/bin/bash
set -e

if [ ! -e '/var/www/html/wp-login.php' ]; then
	tar xvf /usr/src/wordpress.tar.gz -C /var/www/
	mv /var/www/wordpress /var/www/html
	chown -R www-data /var/www/html
fi

exec "$@"
