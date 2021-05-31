FROM debian:buster

RUN	apt-get update && \
	apt-get install -y openssl

CMD openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
	-keyout /etc/ssl/private/nginx.key \
	-out /etc/ssl/certs/nginx.crt \
	-subj "/C=BE/ST=BRUSSELS/O=19/CN=nginx-service"
