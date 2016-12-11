FROM babim/phpbase:5apache

# https://www.drupal.org/node/3060/release
ENV DRUPAL_VERSION 8.2.2

RUN curl -fSL "http://ftp.drupal.org/files/projects/drupal-${DRUPAL_VERSION}.tar.gz" -o /usr/src/drupal.tar.gz
RUN if [ -f "/entrypoint.sh" ]; then mv /entrypoint.sh /run.sh; fi

COPY docker-entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

WORKDIR /var/www
ENTRYPOINT ["/entrypoint.sh"]
CMD ["apache2-foreground"]
