#!/bin/bash

flist=`ls -1 ISAM*.nc`
for i in ${flist}
do
   gzip ${i}
done
