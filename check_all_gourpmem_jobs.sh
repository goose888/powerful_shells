#!/bin/bash

# Check all the queued and running jobs from cades-ccsi group
alluser=`getent group cades-ccsi`

IFS=',' read -r -a array <<< "$alluser"

for uu in "${array[@]}"
do
    echo "$uu"
    qstat -u ${uu}
done
