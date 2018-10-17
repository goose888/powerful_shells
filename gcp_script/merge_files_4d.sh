#!/bin/bash
NCO_PATH=/software/dev_tools/swtree/cs400_centos7.2_pe2016-08/nco/4.6.4/centos7.2_gnu5.3.0/bin

prefix=$1   #'ISAM_S3_'
suffix='.nc'
var=$2
# Now merge data from every year for each variable
cd ${var}
fname="../${prefix}${var}${suffix}"
# First combine each year's data into one file
flist=`ls *.nc | tr "\n" " "`
flistsp=`ls -1 *.nc`
for i in ${flistsp}
do
   # Make the time dimension as a record dimension
   ${NCO_PATH}/ncrename -d month,time -v lon,longitude -v lat,latitude ${i}
   ${NCO_PATH}/ncks --mk_rec_dmn time -O ${i} ${i}
done
# Concatenate all files
${NCO_PATH}/ncrcat ${flist} ${fname}
## Attach coord variable "time" from LPJ
${NCO_PATH}/ncks -A ../TTT.nc ${fname}
## Rename coord variables lon and lat
#ncrename -d lon,longitude -v lon,longitude ${fname}
#ncrename -d lat,latitude -v lat,latitude ${fname}
# Add axes for coord variables lon and lat
${NCO_PATH}/ncatted -O -a axis,longitude,c,c,'X' ${fname}
${NCO_PATH}/ncatted -O -a axis,latitude,c,c,'Y' ${fname}
# DONE
cd ..
