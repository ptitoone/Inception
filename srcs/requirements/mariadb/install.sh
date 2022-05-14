#!/bin/sh

# Install dependencie
apk update;
apk add mariadb mariadb-common mariadb-client --no-cache;

# Create requiered directories and socket file
mkdir -p /etc/mysql/mariadb.conf.d/;
mkdir -p /etc/mysql/conf.d/;
mkdir -p /run/mysqld/;
touch /run/mysqld/mysqld.sock;

# Remove install files
rm /tmp/*;
