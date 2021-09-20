FROM alpine:3.12

RUN apk update && \
	apk add bash mariadb mariadb-common mariadb-client

COPY tools/wp_db.sql .
COPY tools/my.cnf /etc/.
COPY tools/run.sh .

RUN chmod +x run.sh

EXPOSE 3306

CMD ./run.sh
