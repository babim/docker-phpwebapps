#!/bin/bash
set -e

if [ ! -e '/var/www/html/index.php' ]; then
	tar xvf /usr/src/drupal.tar.gz -C /var/www/
	mv /var/www/drupal*/ /var/www/html/ && mv /var/www/drupal*/.* /var/www/html/
	chown -R www-data /var/www/html
fi

exec "$@"
