#!/usr/bin/env bash

LOCALTIMEZONE=${LOCALTIMEZONE:-UTC}

set -e

# Set timezone
if [ -f /usr/share/zoneinfo/$LOCALTIMEZONE ] ; then
   rm /etc/localtime
   ln -s /usr/share/zoneinfo/$LOCALTIMEZONE /etc/localtime
else
   rm /etc/localtime
   ln -s /usr/share/zoneinfo/UTC /etc/localtime
fi

# Double check files permission
chmod 400 /opt/.env
chmod 755 /opt/run.sh /opt/restart.sh

exec /usr/bin/supervisord -n -c /etc/supervisord.conf
