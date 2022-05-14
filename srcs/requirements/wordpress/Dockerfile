FROM alpine:3.14.6 

EXPOSE 9000 3306

COPY install.sh /tmp/install.sh

RUN /tmp/install.sh

ENTRYPOINT ["php-fpm7", "-F"] 
#ENTRYPOINT sleep infinity 
