#!/bin/bash

echo "hello world!"

# a single line comment

: '
This is the line 1 of multi-line comment.
this is the line 2 of multi-line comment.
'

# Variables
INT=10
STRING1="A String Value"
STRING2=StringVarWithoutQuotes
_PI=3.1416
echo "Vars: int: $INT -> string1: $STRING1 -> float: $_PI -> string2: $STRING2"

readonly TARGET_IP=0.0.0.0
echo $TARGET_IP

#echo "What is your name?"
#read NAME
#echo "Hello $NAME - hope you are doing well."
#
#read -p "Username: " uservar
#read -sp "Password: " passvar
#echo "Username: $uservar and Password: $passvar"

VAR1="tt "
VAR2="tT"
if [[ -n $VAR1 && $VAR1 == "tt" ]]; then
  echo "vars: $VAR1"
else
  echo "no"
fi

FRUITS=( Apple Banana 'Ground Cherry' Orange 'Star fruit' )
FRUITS_LEN=${#FRUITS}
# shellcheck disable=SC2068
# shellcheck disable=SC2145
echo "Length: $FRUITS_LEN, ELEMENTS: ${FRUITS[@]}"


# shellcheck disable=SC2068
for E in "${FRUITS[@]}"; do
  echo $E
done

# shellcheck disable=SC2068
#for i in ${!FRUITS[@]}; do
#  echo "${FRUITS[$i]}"
#done

#for (( i=0; i<${#FRUITS[@]}; i++ )); do
#  echo ${FRUITS[$i]}
#done


i=0
until [ ! $i -lt 5 ]
do
  echo $i
  ((i++))
done