#!/bin/sh

# Insure proper ownership is given to users
chown -R adminer:adminer /home/adminer/;
chown -R wordpress:wordpress /home/wordpress/;
chown -R static:static /home/static/;

# Execute tini as PID 1 with VSFTPD as child
exec tini -- vsftpd /etc/vsftpd/vsftpd.conf;
