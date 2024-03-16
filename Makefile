all: up

up: 
	docker compose -f ./srcs/docker-compose.yml up -d --build
down:
	docker compose -f ./srcs/docker-compose.yml down
start:
	docker compose -f ./srcs/docker-compose.yml start
stop:
	docker compose -f ./srcs/docker-compose.yml stop 
clean:	
	docker compose -f ./srcs/docker-compose.yml --rmi all -v

fclean: clean
       sudo rm -rf ${HOME}/data/mariadb/* && sudo rm -rf ${HOME}/data/wordpress/* &&\
       echo "removed"

re: fclean all

.PHONY: all, clean, fclean, re

