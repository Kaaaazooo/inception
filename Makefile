LOCAL_VOL = /home/sabrugie/data

all: up

up: volumes
	#[ -d /home/sabrugie/data ] || sudo cp -r srcs/requirements/tools/data /home/sabrugie/. && sudo chown -R www-data:www-data $(LOCAL_VOL)/wp && sudo chown -R mysql:mysql $(LOCAL_VOL)/db
	docker-compose -f srcs/docker-compose.yml up -d

volumes:
	grep -q "sabrugie.42.fr" /etc/hosts || sudo sed -i '1 i\127.0.0.1	sabrugie.42.fr' /etc/hosts
	sudo userdel www-data && sudo useradd -u 82 www-data
	sudo mkdir -p $(LOCAL_VOL)/db && sudo chown -R 100:101 $(LOCAL_VOL)/db
	sudo mkdir -p $(LOCAL_VOL)/wp && sudo chown -R www-data:www-data $(LOCAL_VOL)/wp

down:
	docker-compose -f srcs/docker-compose.yml down

re: stop all
