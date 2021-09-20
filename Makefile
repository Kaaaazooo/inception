LOCAL_VOL = /home/sabrugie/data

all: up

up: volumes
	docker-compose -f srcs/docker-compose.yml up -d --build

volumes:
	grep -q "sabrugie.42.fr" /etc/hosts || sudo sed -i '1 i\127.0.0.1	sabrugie.42.fr' /etc/hosts
	[ -d /home/sabrugie/data ] || \
	( sudo mkdir -p /home/sabrugie && \
	sudo cp -rp srcs/requirements/tools/data /home/sabrugie/. && \
	sudo chown -R 82:82 $(LOCAL_VOL)/wp && \
	sudo chown -R 100:101 $(LOCAL_VOL)/db )

down:
	docker-compose -f srcs/docker-compose.yml && docker-compose down

re: down all
