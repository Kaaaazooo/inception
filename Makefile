LOCAL_VOL = /home/sabrugie/data

all: up

up: volumes
	cd srcs && docker-compose up -d --build

volumes:
	grep -q "sabrugie.42.fr" /etc/hosts || sudo sed -i '1 i\127.0.0.1	sabrugie.42.fr' /etc/hosts
	[ -d /home/sabrugie/data ] || \
	( sudo mkdir -p /home/sabrugie && \
	sudo cp -rp srcs/requirements/tools/data /home/sabrugie/. && \
	sudo chown -R 82:82 $(LOCAL_VOL)/wp && \
	sudo chown -R 100:101 $(LOCAL_VOL)/db )

down:
	cd srcs && docker-compose down

clean:
	docker stop $(docker ps -qa); \
	docker rm $(docker ps -qa); \
	docker rmi -f $(docker images -qa); \
	docker volume rm $(docker volume ls -q); \
	docker network rm $(docker network ls -q) 2>/dev/null

re: down all
