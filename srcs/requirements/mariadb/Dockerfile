FROM alpine:3.14.6

EXPOSE 3306

COPY install.sh /tmp/install.sh
COPY my.cnf /etc/my.cnf

RUN /tmp/install.sh

ENTRYPOINT ["mysqld", "--user=root"]

