#!/usr/bin/env bash

while getopts lu:f: flag
do
    case "${flag}" in
        u) username=${OPTARG};;

        f) if [[ -f ${OPTARG} ]]; then
            echo "File exists and valid for flag -f"
          else
            echo "Invalid file provided with -f flag - ${OPTARG}"
          fi;;

        l)
          echo "Recursively printing all files - "
          for v in `ls -R`; do
            echo "=>"$v
          done ;;

        *) echo "invalid flag provided" ;;
    esac
done

echo "Provided username with flag -u : $username"
