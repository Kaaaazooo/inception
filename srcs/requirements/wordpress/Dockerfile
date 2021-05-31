FROM debian:buster

RUN	apt-get update && \
	apt-get install -y wget \
						mariadb-server \
						mariadb-client \
						php-cgi \
						php-common \
						php-fpm \
						php-pear \
						php-mbstring \
						php-zip \
						php-net-socket \
						php-gd \
						php-xml-util \
						php-gettext \
						php-mysql \
						php-bcmath \
						vim

RUN	mkdir -p /var/www
RUN	wget -O /tmp/wordpress.tar.gz https://wordpress.org/latest.tar.gz
RUN	tar -xzvf /tmp/wordpress.tar.gz -C /var/www/.

COPY tools/wp-config.php /var/www/wordpress/.

EXPOSE 9000

CMD tail -f /dev/null
