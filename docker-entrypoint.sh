#!/bin/bash
set -e

if [ -z "`ls /usr/local/etc/php/conf.d`" ] 
then
	cp -R /etc-start/php/conf.d/* /usr/local/etc/php/conf.d
fi

# set ID docker run
agid=${agid:-$auid}
auser=www-data

if [[ -z "${auid}" ]]; then
  echo "start"
elif [[ "$auid" = "0" ]] || [[ "$aguid" == "0" ]]; then
 echo "can't run in Root user. Default user still run."
else
  usermod -u $auid $auser
  groupmod -g $agid $auser
fi

if [ ! -e '/var/www/html/index.php' ]; then
	unzip /usr/src/phpbb.zip -d /var/www/
	mv /var/www/phpBB3/ /var/www/html/ && mv /var/www/phpBB3/.* /var/www/html/
	chown -R $auser:$auser /var/www/html
fi

exec "$@"
