FROM babim/phpbase:5apache

ENV PHPBB_VERSION 3.1.7-pl1

RUN curl -fsSL -o /usr/src/phpbb.zip \
		"https://www.phpbb.com/files/release/phpBB-${PHPBB_VERSION}.zip"

COPY docker-entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

WORKDIR /var/www/html
ENTRYPOINT ["/entrypoint.sh"]
CMD ["apache2-foreground"]
