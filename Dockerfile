FROM babim/phpbase:5fpm

# Install Wordpress
ADD https://wordpress.org/latest.tar.gz /usr/src/wordpress.tar.gz

COPY docker-entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

WORKDIR /var/www
ENTRYPOINT ["/entrypoint.sh"]
CMD ["apache2-foreground"]
