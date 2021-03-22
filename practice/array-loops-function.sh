#!/usr/bin/env bash

readonly SP_CHAR="=>"

readonly GREETINGS=( Hi Hello Hey Hola Bonjour "Asalaam alaikum" )

echo "$SP_CHAR Greetings: ${GREETINGS[@]}"
echo "$SP_CHAR Total greetings: ${#GREETINGS[@]}"

function greet_logged_user_randomly {
  if (( $# <= 0 )); then
    echo "$SP_CHAR No greetings array provided, greeting with all from GREETINGS."
    for greeting in "${GREETINGS[@]}"; do
      echo "$greeting, `whoami`"
    done
  else
    : '
    You can pass an array by name reference to a function in bash (since version 4.3+), by setting the -n attribute.
    In this case, variable ARR will have the same values as variable GREETINGS.
    '
    local -n ARR=$1

    # generate a random number between 0-len of array.
    i=$(( ( RANDOM % ${#ARR[@]} )  + 0 ))
    echo "$SP_CHAR ${ARR[i]}, `whoami`"
  fi
}

greet_logged_user_randomly GREETINGS
greet_logged_user_randomly

