FROM babim/phpbase:5fpm

ENV SMF_VERSION 2-0-12

ADD http://download.simplemachines.org/index.php/smf_${SMF_VERSION}_install.tar.gz /usr/src/smf.tar.gz
RUN if [ -f "/entrypoint.sh" ]; then mv /entrypoint.sh /run.sh; fi
COPY docker-entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

WORKDIR /var/www
ENTRYPOINT ["/entrypoint.sh"]
CMD ["php-fpm"]
