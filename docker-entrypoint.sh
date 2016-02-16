#!/bin/bash
set -e

if [ ! -e '/var/www/html/index.php' ]; then
	unzip /usr/src/joomla.zip -d /var/www/html
	chown -R www-data /var/www/html
fi

exec "$@"
