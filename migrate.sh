#!/bin/sh

set -e
until [ "$(curl --silent --show-error --connect-timeout 1 -I $SERVICE_HEALTHCHECK | grep -i 'ok')" ];
do
  echo "Waiting for" $SERVICE_HEALTHCHECK
  sleep 10
done

for sqldump in /opt/dumps/*;do
    if [ ${sqldump: -4} == ".sql" ]
    then
        echo $sqldump
        mysql -h $MYSQL_HOST -u root -p$MYSQL_ROOT_PASSWORD $MYSQL_DATABASE < "$sqldump";
    fi
done;
