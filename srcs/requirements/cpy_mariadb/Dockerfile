FROM debian:buster

RUN	apt-get update && \
	apt-get install -y wget \
					mariadb-server \
					mariadb-client \
					vim

RUN mkdir /tools

COPY tools/wp_db.sql /tools/.
COPY tools/run.sh /tools/.

RUN chmod +x /tools/run.sh
#COPY tools/wp_db.sql .
#COPY tools/run.sh /tools/.

#CMD /tools/run.sh
CMD tail -f /dev/null

EXPOSE 3306

