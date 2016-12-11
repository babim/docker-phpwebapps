FROM babim/phpbase:5apache

ENV JOOMLA_VERSION 3.6.4

RUN curl -fsSL -o /usr/src/joomla.zip \
		"https://github.com/joomla/joomla-cms/releases/download/${JOOMLA_VERSION}/Joomla_${JOOMLA_VERSION}-Stable-Full_Package.zip"
RUN if [ -f "/entrypoint.sh" ]; then mv /entrypoint.sh /run.sh; fi
COPY docker-entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

WORKDIR /var/www
ENTRYPOINT ["/entrypoint.sh"]
CMD ["apache2-foreground"]
