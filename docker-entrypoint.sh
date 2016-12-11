#!/bin/bash
set -e

if [ "$1" = '/run.sh' ]; then
	exec /run.sh "$@"
fi

if [ ! -e '/var/www/html/wp-login.php' ]; then
	tar xvf /usr/src/wordpress.tar.gz -C /var/www/
	mv /var/www/wordpress/ /var/www/html/ && mv /var/www/wordpress/.* /var/www/html/
	chown -R $auser:$auser /var/www/html
fi

exec "$@"
