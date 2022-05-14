#!/bin/bash

if [[ -n $(ls /home/akotzky/data/wp) ]];
then
    cd /home/akotzky/data/wp
    sudo tar -czvp --same-owner -f /home/akotzky/Inception/srcs/requirements/wordpress/wordpress.tar.gz .
fi

if [[ -n $(ls /home/akotzky/data/db) ]];
then
    cd /home/akotzky/data/db
    sudo tar -czvp --same-owner -f /home/akotzky/Inception/srcs/requirements/mariadb/mysql.tar.gz .
fi


if [[ -n $(ls /home/akotzky/data/st) ]];
then
    cd /home/akotzky/data/st
    sudo tar -czvp --same-owner -f /home/akotzky/Inception/srcs/requirements/static/static.tar.gz .
fi

