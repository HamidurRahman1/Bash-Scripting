#!/usr/bin/env bash

LOGGED_USER=`whoami`
LOGGED_USER=${LOGGED_USER,,}

: '
  1. uppercase a string var: ${var,}
  2. lowercase a string var: ${var,,}
'

echo -e "Please enter logged in username: "
read -s username
username=${username,,}

if [[ $username == $LOGGES_USER ]]; then
  echo "Logged username same as entered username."
else
  echo "incorrect username entered."
fi