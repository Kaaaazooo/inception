FROM	debian:buster


RUN	apt-get update \
	&& apt-get install dumb-init nginx -y

RUN	apt-get install openssl -y

RUN	openssl req -x509 -sha256 -nodes -days 365 -newkey rsa:2048 \
	-subj "/C=BE/ST=Belgium/L=Brussels/O=19/CN=sabrugie.42.fr" \
	-keyout /etc/ssl/private/sabrugie.key -out /etc/ssl/certs/sabrugie.crt

COPY	./tools/nginx.conf /etc/nginx/nginx.conf

COPY	./tools/hosts /etc/


ENTRYPOINT ["/usr/bin/dumb-init"]

EXPOSE	443

CMD	["nginx", "-g", "daemon off;"]
