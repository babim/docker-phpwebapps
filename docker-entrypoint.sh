#!/bin/bash
set -e

if [ "$1" = '/run.sh' ]; then
	exec /run.sh "$@"
fi

if [ ! -e '/var/www/html/version.php' ]; then
	tar cf - --one-file-system -C /usr/src/owncloud . | tar xf -
	chown -R $auser:$auser /var/www/html
fi

exec "$@"
