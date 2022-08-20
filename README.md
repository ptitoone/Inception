# Inception

### [Docker Compose] [CMS] [PHP] [SQL] [HTML] [CSS] [BASH] [SYSADMIN]

#### Build of a Docker ecosystem with multiple services containerized:

- Nginx
- PHP-fpm
- MariaDB
- Redis
- FTP
- SSH

The whole setup is pre-configured and persistent on deployment. A simple bash script `update_data.sh` is present to update and backup files such as wordpress filesystem, database and static website. Several volumes have been set up to serve one or more containers.

Nginx serves multiple applications:
 - Wordpress website
 - A static website
 - Adminer single page database manager
 
Redis manages the database requests done by Wordpress and caches them for optimized speed.
 
VSFTPD gives FTP acces to each application served by Nginx. Each app filesystem is chrooted and has their own user accounts for access.

MariaDB is used as DBMS to serve Wordpress app.

PHP-fpm serves for php files.

A last container with SSH is present just for demonstation, it is possible to play Snake game `nsnake` in terminal trough SSH.

![alt text](https://i.imgur.com/8rljST8.png "Docker compose schema")

#### Skills gained:

Going a bit further in depth with Docker compose and system administation. Various services where needed to be configured. This has given me better knowledge with Nginx server blocks/names and Docker networking, volumes, environement variables, PID 1 for clean stop of the containers trough proper signal transmission to child... processes
