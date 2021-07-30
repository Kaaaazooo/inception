all: up

up:
	cd srcs && docker-compose up -d --build

stop:
	cd srcs && docker-compose stop

re: stop all
