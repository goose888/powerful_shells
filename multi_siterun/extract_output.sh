#!/bin/bash

## Get the last 15 year output for specific variable from text file

## User pptions
FILENAME=advect.txt
DIR=`pwd`
FILELIST=list_turbel

# For daily output, length = 365*year
# For weekly output, length = 52year
LENGTH=$(expr 52 \* 15)

# Select specific Column from text file
# Check the isam code to find the variable recorded in each column of the file
# Col=0 means adding all column together
Col=0

# Multiplication factor after the sum or the selection
# This is used because cryoturbation rate is 560 times smaller than frost heave rate
FACTOR=560

# Variable name used as the output file name
VAR=frost_heave

#SITEINFO=1

# Print all settings
echo "DIRECTORY=${DIR}"
echo "FILENAME=${FILENAME}"
echo "FILELIST=${FILELIST}"
echo "LENGTH=${LENGTH}"
echo "COLUMN=${Col}"
echo "FACTOR=${FACTOR}"
echo "VARNAME=${VAR}"

## DO NOT EDIT BELOW
# Get the profile list
echo '##############################################'
echo '# Start extracting data for specific samples #'
echo '##############################################'
while read SAMPLE; do
   echo 'Soil sample ID:' ${SAMPLE}

   # Get the site location
   awk -F= '/=/{gsub(/ /, "", $0); print} ' ${SAMPLE}/namelist.spinup > ${SAMPLE}/ttt.tmp
   lon=`awk -F= '$1=="single_x" { print $2}' ${SAMPLE}/ttt.tmp`
   lat=`awk -F= '$1=="single_y" { print $2}' ${SAMPLE}/ttt.tmp`
   rm ${SAMPLE}/ttt.tmp
   echo "${SAMPLE},${lon},${lat}" >> turbel_position
   

   if [ -d ${SAMPLE} ]; then
     echo 'Found the sample.'
     cd ${SAMPLE}
     tail -n ${LENGTH} ${FILENAME} > ${SAMPLE}.tmp
     if [[ ${Col} == 0 ]]; then
         echo "Sum all columns..."

         while read line ; do
             # echo $line
             # MYARRAY[$index]="${line}"
             IFS=' ' read -r -a array <<< $line
             IFS='+' tot=$(echo "scale=1;(${array[*]})*(${FACTOR})"|bc)
             echo ${tot} >> ../${VAR}_${SAMPLE}.dat
         done < ${SAMPLE}.tmp

     else
         echo "Select only Column ${Col}..."

          while read line ; do
             # echo $line
             # MYARRAY[$index]="${line}"
             IFS=' ' read -r -a array <<< $line
             IFS='+' tot=$(echo "scale=1;(${array[${Col}]})*(${FACTOR})"|bc)
             echo ${tot} >> ../${VAR}_${SAMPLE}.dat
          done < ${SAMPLE}.tmp

     fi

     # Clean all tmp files
     rm *.tmp

     # Return to the case folder
     cd ${DIR}

   else
     echo 'Results for the requested sample do not exist!'
   fi

done < ${FILELIST}

