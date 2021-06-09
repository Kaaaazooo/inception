FROM alpine:3.12

RUN	apk update && \
	apk upgrade && \
	apk add nginx openssl

COPY tools/run.sh /scripts/run.sh
COPY tools/nginx.conf /etc/nginx/conf.d/default.conf

EXPOSE 443

RUN chmod +x /scripts/run.sh

CMD sh /scripts/run.sh
