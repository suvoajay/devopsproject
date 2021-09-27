FROM php:apache

COPY website /var/www/html/

CMD ["/usr/sbin/apachectl", "-D", "FOREGROUND"]
