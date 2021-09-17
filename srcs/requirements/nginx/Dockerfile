FROM	debian:buster


RUN	apt-get update && \
	apt-get install nginx openssl -y
	

COPY	./tools/sabrugie.42.fr.conf /etc/nginx/sites-available/.

RUN	openssl req -x509 -sha256 -nodes -days 365 -newkey rsa:2048 \
	-subj "/C=BE/ST=Belgium/L=Brussels/O=19/CN=sabrugie.42.fr" \
	-keyout /etc/ssl/private/sabrugie.key -out /etc/ssl/certs/sabrugie.crt && ln -s /etc/nginx/sites-available/sabrugie.42.fr.conf /etc/nginx/sites-enabled/sabrugie.42.fr.conf


EXPOSE	443

#CMD tail -f /dev/null
CMD	["nginx", "-g", "daemon off;"]
