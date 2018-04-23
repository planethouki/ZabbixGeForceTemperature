#!/bin/bash

first=1

printf "{\n"
printf "\t\"data\":[\n\n"

for line in `nvidia-smi --query-gpu=index,uuid --format=csv,noheader,nounits | sed -e 's/ //g'`
do

if [ $first == 0 ]; then
printf "\t,\n"
fi
first=0

printf "\t{\n"

index=`echo ${line} | cut -d ',' -f 1`
uuid=`echo ${line} | cut -d ',' -f 2`

printf "\t\t\"{#UUID}\":\"$uuid\",\n"
printf "\t\t\"{#INDEX}\":\"$index\"\n"

printf "\t}\n"
done

printf "\n\t]\n"
printf "}\n"
