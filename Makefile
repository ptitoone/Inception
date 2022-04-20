
IMAGES		= $(shell docker image ls -qa)
CONTAINERS	= $(shell docker container ls -qa)
VOLUMES		= $(shell docker volume ls -q)
NETWORKS	= $(shell docker network ls -q)
PROCESS		= $(shell docker ps -q)
WP_SRCS		= srcs/requirements/wordpress/www.tar.gz
DB_SRCS		= srcs/requirements/mariadb/mysql.tar.gz

DATA_DIR	= /home/akotzky/data

.PHONY: all build run clean fclean

all:
	sudo tar -xvf $(WP_SRCS) -C $(DATA_DIR)/wp/
#	sudo tar -xvf $(DB_SRCS) -C $(DATA_DIR)/db/
	
build : all
	docker-compose -f ./srcs/docker-compose.yml build 

run :
	docker-compose -f ./srcs/docker-compose.yml up 

clean :

fclean :
#ifdef PROCESS
#	docker rm -f $(PROCESS)
#endif
ifdef CONTAINERS
	docker container rm -f $(CONTAINERS)
endif
ifdef VOLUMES
	docker volume rm -f $(VOLUMES)
endif
	sudo rm -rf $(DATA_DIR)/wp/*
	sudo rm -rf $(DATA_DIR)/db/*
ifdef IMAGES
	docker rmi -f $(IMAGES)
endif
ifdef NETWORKS
	docker network rm -f $(NETWORKS)
endif
