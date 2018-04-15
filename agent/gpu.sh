#!/bin/bash

## Values received by this script:
# uuid = $1 / GPU uuid
# query = $2 / GPU information

uuid=$1
query=$2

nvidia-smi --query-gpu=uuid,$query --format=csv,noheader,nounits | grep $uuid | awk '{print $2}'
