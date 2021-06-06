FROM alpine:3.12

RUN apk update && \
	apk add bash mysql mysql-client && \
	apk add telegraf --repository http://dl-cdn.alpinelinux.org/alpine/edge/community/ --allow-untrusted

COPY tools/wp_db.sql .
COPY tools/my.cnf /etc/.
COPY tools/run.sh .

RUN chmod +x run.sh

EXPOSE 3306

CMD tail -f /dev/null
#CMD ./run.sh
