FROM debian:buster

EXPOSE 3306

ARG DB_USER=${DB_USER}
ARG DB_PASSWORD=${DB_PASSWORD}


RUN apt-get update -y && \
#	apt-get upgrade -y && \
	apt-get install mariadb-server -y 

COPY mysql.tar.gz /var/lib/mysql.tar.gz 

RUN tar -xvf /var/lib/mysql.tar.gz -C /var/lib/mysql && rm /var/lib/mysql.tar.gz


RUN service mysql start && \
    mysql -u root --execute="GRANT ALL PRIVILEGES ON ${DB_USER}.* TO '${DB_USER}'@'wordpress.inception_app' IDENTIFIED BY '${DB_PASSWORD}' WITH GRANT OPTION;" 

COPY my.cnf /etc/mysql/my.cnf


ENTRYPOINT ["mysqld"]
