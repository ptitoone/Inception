# Inception

### Docker compose ecosystem

<p align="center">
  <img src="https://i.imgur.com/CVUUxlu.jpg" height="300px" alt="Spinning top" />
</p>

## Containerized services

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

## Usage

Build and launch the ecosystem with `make all`. Edit your `/etc/hosts` file by adding the following lines at the end:

```
127.0.0.1 wordpress.<username>.42.fr
127.0.0.1 static.<username>.42.fr
127.0.0.1 adminer.<username>.42.fr
```

Replace `<username>` with your session username, without the `< >`.

Those URLs will give you acces to the different websites.

For FTP you can log in with a client like filezilla on `localhost:21`. User and password are the same, you can find all logins and passwords in `./srcs/.env` file, including worpress admin dashboard, FTP logins...

If any modification is made to the persistent data, use `make update` to create fresh up to date archives. This helps for migration.

## Skills gained

Going a bit further in depth with Docker compose and system administation. Various services where needed to be configured. This has given me better knowledge with Nginx server blocks/names and Docker networking, volumes, environement variables, PID 1 for clean stop of the containers trough proper signal transmission to child... processes

## Final Grade

![alt text](https://i.imgur.com/uuZEdJb.png "Final grade 125/100")
