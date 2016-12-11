#!/bin/bash
set -e

if [ "$1" = '/run.sh' ]; then
	exec /run.sh "$@"
fi

if [ ! -e '/var/www/html/index.php' ]; then
	tar xvf /usr/src/drupal.tar.gz -C /var/www/
	mv /var/www/drupal*/ /var/www/html/ && mv /var/www/drupal*/.* /var/www/html/
	chown -R $auser:$auser /var/www/html
fi

exec "$@"
