# Usage
```
docker run --name php -it -v /data/phpconfig:/usr/local/etc/php/conf.d -v /data/www:/var/www -p 9000:9000 babim/phpwebapp:(tag)
```
# Volume
```
/usr/local/etc/php/conf.d
/var/www
```
