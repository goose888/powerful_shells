#!/bin/bash

cd 141/
tail -n 365 advect.txt > ttt
index=0
while read line ; do
    # echo $line
    # MYARRAY[$index]="${line}"
    IFS=' ' read -r -a array <<< $line
    IFS='+' tot=$(echo "scale=1;(${array[*]})*560"|bc)
    echo ${tot} >> frost_heave.tmp
done < ttt
rm ttt
cd ..
