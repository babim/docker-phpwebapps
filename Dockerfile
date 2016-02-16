FROM babim/phpbase:5apache

# Install prestashop
RUN wget https://sourceforge.net/projects/prestashop/files/latest/download && mv download /usr/src/prestashop.zip

COPY docker-entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

WORKDIR /var/www/html
ENTRYPOINT ["/entrypoint.sh"]
CMD ["apache2-foreground"]
