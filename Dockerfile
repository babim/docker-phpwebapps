FROM babim/phpbase:5fpm

# Install Wordpress
ADD https://wordpress.org/latest.tar.gz /usr/src/wordpress.tar.gz
RUN if [ -f "/entrypoint.sh" ]; then mv /entrypoint.sh /run.sh; fi
COPY docker-entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

WORKDIR /var/www
ENTRYPOINT ["/entrypoint.sh"]
CMD ["php-fpm"]
