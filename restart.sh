#!/usr/bin/env bash

set -e

cd /opt

while true  
do 
  cp /dev/null /tmp/restarted.txt
  /usr/bin/supervisorctl restart pokealert
  sleep 900 
done
