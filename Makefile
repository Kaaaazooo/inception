all: up

up:
	cd srcs && docker-compose up -d

stop:
	cd srcs && docker-compose stop

re: stop all
