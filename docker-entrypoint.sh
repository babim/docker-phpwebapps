#!/bin/bash
set -e

if [ ! -e '/var/www/html/wp-login.php' ]; then
	rm -rf /var/www/html
	tar xvf /usr/src/wordpress.tar.gz -C /var/www/
	mv /var/www/wordpress /var/www/html
	chown -R www-data /var/www/html

exec "$@"
