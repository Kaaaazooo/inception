FROM debian:buster

RUN	apt-get update && \
	apt-get install -y wget \
					mariadb-server \
					mariadb-client \
					vim

#COPY tools/wp-config.php /var/www/wordpress/.

EXPOSE 3306

CMD tail -f /dev/null
