#!/bin/bash

## Values received by this script:
# index = $1 / GPU index
# query = $2 / GPU information

if [ $# -ne 2 ]; then
  echo 'number of args must be 2'
  exit 1
fi

index=$1
query=$2

nvidia-smi --query-gpu=$query --format=csv --id=$index | sed -e '1d' -e 's/%//g'
