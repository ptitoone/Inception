FROM debian:buster

EXPOSE 9000 3306

RUN apt-get update -y && \
	apt-get install php-fpm php-mysql \
	php-xml php-mbstring php-zip php-gd php-pear php-gettext php-cgi php-curl php-imagick -y

RUN service php7.3-fpm start 

#COPY www.tar.gz /var/www/www.tar.gz

#RUN tar -xvf /var/www/www.tar.gz -C /var/www  && rm /var/www/www.tar.gz && chmod -R 775 /var/www/wordpress

#COPY wp-config.php /var/www/wordpress/wp-config.php 

COPY config.inc.php /var/www/wordpress/phpmyadmin/config.inc.php 

RUN chown -R www-data:www-data /var/www/
RUN chmod 660 /var/www/wordpress/phpmyadmin/config.inc.php

RUN echo "listen = 9000\nclear_env = no" >> /etc/php/7.3/fpm/pool.d/www.conf

#VOLUME /var/www 

CMD ["php-fpm7.3", "-F"] 
