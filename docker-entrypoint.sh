#!/bin/bash
set -e

if [ "$1" = '/run.sh' ]; then
	exec /run.sh "$@"
fi

if [ ! -e '/var/www/html/index.php' ]; then
	unzip /usr/src/smf.zip -d /var/www/html
	chown -R $auser:$auser /var/www/html
fi

exec "$@"
