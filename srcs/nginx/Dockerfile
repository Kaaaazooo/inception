FROM debian:buster

RUN	apt-get update && \
	apt-get install -y nginx openssl

COPY srcs/run.sh /scripts/run.sh
COPY srcs/nginx.conf /etc/nginx/sites-available/default

RUN chmod +x /scripts/run.sh

EXPOSE 80 443

#CMD tail -f /dev/null
CMD sh /scripts/run.sh
