#!/bin/bash

flist=`ls -1 *.gz`
for i in ${flist}
do
   gunzip ${i}
done
