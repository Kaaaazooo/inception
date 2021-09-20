FROM debian:buster

RUN apt-get update \
    && apt-get upgrade -y \
    && apt-get install vim -y \
	&& apt-get install tar -y \
	&& apt-get install php-fpm php-mysql -y \
	&& mkdir -p /run/php/

ADD https://wordpress.org/latest.tar.gz /tmp/latest.tar.gz
RUN cd /tmp && \
	tar xzvf latest.tar.gz && \
	rm latest.tar.gz && \
	mkdir -p /var/www && \
	mv -f wordpress /var/www/ && \
	chmod 775 -R /var/www/wordpress && \
	chown -R www-data:www-data /var/www/wordpress && \
	sed -i 's/listen =.*/listen = 9000/' /etc/php/7.3/fpm/pool.d/www.conf


RUN rm -rf /var/www/wordpress/wp-config-sample.php
COPY tools/wp-config.php /var/www/wordpress/.
COPY tools/run.sh /tmp/run.sh
RUN chmod +x /tmp/run.sh 

EXPOSE 9000

ENTRYPOINT [ "/tmp/run.sh" ]

