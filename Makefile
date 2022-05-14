IMAGES		= $(shell docker images -q)
VOLUMES		= $(shell docker volume ls -q)
NETWORKS	= $(shell docker network ls | grep inception_app | awk '{print $$2}')

CONTAINERS	= $(shell docker container ls -aq)
WP_SRCS		= srcs/requirements/wordpress/wordpress.tar.gz
DB_SRCS		= srcs/requirements/mariadb/mysql.tar.gz
ST_SRCS		= srcs/requirements/static/static.tar.gz
AD_SRCS		= srcs/requirements/adminer/adminer-4.8.1.php

DATA_DIR	= /home/$(USER)/data

.PHONY: all update extract build run clean fclean

all : extract build

update : 
	sudo ./update_data.sh

extract :
ifeq ($(shell ls $(DATA_DIR)/wp),)
	sudo tar -xvzp --same-owner -f $(WP_SRCS) -C $(DATA_DIR)/wp/
endif
ifeq ($(shell ls $(DATA_DIR)/db),)
	sudo tar -xvzp --same-owner -f $(DB_SRCS) -C $(DATA_DIR)/db/
endif
ifeq ($(shell ls $(DATA_DIR)/st),)
	sudo tar -xvzp --same-owner -f $(ST_SRCS) -C $(DATA_DIR)/st/
endif
ifeq ($(shell ls $(DATA_DIR)/ad),)
	sudo cp $(AD_SRCS) $(DATA_DIR)/ad/adminer-4.8.1.php
endif
	
build : extract
	docker-compose -f ./srcs/docker-compose.yml build 

run :
	docker-compose -f ./srcs/docker-compose.yml up 

clean :
	sudo rm -rf $(DATA_DIR)/wp/*
	sudo rm -rf $(DATA_DIR)/db/*
	sudo rm -rf $(DATA_DIR)/st/*
	sudo rm -rf $(DATA_DIR)/ad/*

fclean : clean
ifneq ($(CONTAINERS),)
	docker container rm -f $(CONTAINERS)
endif
ifneq ($(VOLUMES),)
	docker volume rm $(VOLUMES)
endif
ifneq ($(IMAGES),)
	docker rmi -f $(IMAGES)
endif
ifeq ($(NETWORKS),inception_app)
	docker network rm $(NETWORKS)
endif
