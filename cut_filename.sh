#!/bin/bash

i=0
while read line
do
   echo ${line}
   newname=$(echo ${line} | cut -c158-)
   echo ${newname}
   mv ${line} ${newname}
done < <(ls *.nc)
