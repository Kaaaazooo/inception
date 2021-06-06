FROM	alpine:3.12
EXPOSE	9000
RUN	apk add bash \
		php7-fpm php7-common php7-iconv php7-json php7-gd php7-curl php7-xml php7-mysqli php7-imap php7-cgi fcgi php7-pdo php7-pdo_mysql php7-soap php7-xmlrpc php7-posix php7-mcrypt php7-gettext php7-ldap php7-ctype php7-dom

RUN	wget -O /tmp/wordpress.tar.gz https://wordpress.org/latest.tar.gz
RUN	mkdir -p /var/www
RUN	tar -xzvf /tmp/wordpress.tar.gz -C /var/www

COPY	tools/wp-config.php /var/www/wordpress
COPY	tools/run.sh .
RUN	chmod +x run.sh

CMD	./run.sh
