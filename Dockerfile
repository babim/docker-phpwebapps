FROM babim/phpbase:5fpm

# Install prestashop
RUN wget https://sourceforge.net/projects/prestashop/files/latest/download && mv download /usr/src/prestashop.zip
RUN if [ -f "/entrypoint.sh" ]; then mv /entrypoint.sh /run.sh; fi
COPY docker-entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

WORKDIR /var/www
ENTRYPOINT ["/entrypoint.sh"]
CMD ["php-fpm"]
