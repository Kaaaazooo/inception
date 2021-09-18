LOCAL_VOL = /home/sabrugie/data

all: up

up: volumes
	cd srcs && docker-compose up -d

volumes:
	grep -q "sabrugie.42.fr" /etc/hosts || sudo sed -i '1 i\127.0.0.1	sabrugie.42.fr' /etc/hosts
	[ -d /home/sabrugie/data ] || ( sudo cp -rp srcs/requirements/tools/data /home/sabrugie/. && \
	sudo chown -R 82:82 $(LOCAL_VOL)/wp && \
	sudo chown -R 100:101 $(LOCAL_VOL)/db )

down:
	cd srcs && docker-compose down

re: stop all
