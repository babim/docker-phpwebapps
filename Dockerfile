FROM babim/phpbase:5apache

ENV SMF_VERSION 2-0-11

ADD http://download.simplemachines.org/index.php/smf_${SMF_VERSION}_install.tar.gz /usr/src/smf.tar.gz

COPY docker-entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

WORKDIR /var/www
ENTRYPOINT ["/entrypoint.sh"]
CMD ["apache2-foreground"]
