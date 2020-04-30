FROM alpine:3.7
RUN apk --no-cache add curl
RUN apk add --no-cache mysql-client
#FROM mysql:5.6
#FROM alpine

COPY migrate.sh /usr/local/bin/migrate.sh

RUN chmod 777 /usr/local/bin/migrate.sh
rUN mkdir -p /opt/dumps
CMD /usr/local/bin/migrate.sh
