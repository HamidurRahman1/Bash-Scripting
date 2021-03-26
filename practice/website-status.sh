#!/usr/bin/env bash

i=1

while [[ $i -le 5 ]]; do

  RSP_STATUS=`curl -s -o /dev/null -I -w "%{http_code}" http://www.google.com/`

  if [[ $RSP_STATUS == 200 ]]; then
    echo "$RSP_STATUS" >> status-log.txt
  else
    echo "error - `date`" >> status-log.txt
  fi

  sleep 1s

  i=$(($i+1))
done

