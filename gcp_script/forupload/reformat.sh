#!/bin/bash

NCO_PATH=/software/dev_tools/swtree/cs400_centos7.2_pe2016-08/nco/4.6.4/centos7.2_gnu5.3.0/bin

flist=`ls -1 ISAM_S0*.nc`
for i in ${flist}; do
  # ${NCO_PATH}/ncrename -h -d lon,longitude -v lon,longitude ${i}
  # ${NCO_PATH}/ncrename -h -d lat,latitude -v lat,latitude ${i}
  # ${NCO_PATH}/ncatted -h -O -a axis,longitude,c,c,'X' ${i}
  # ${NCO_PATH}/ncatted -h -O -a axis,latitude,c,c,'Y' ${i}
  # ${NCO_PATH}/ncatted -h -O -a calendar,time,c,c,'noleap' ${i}
  # ${NCO_PATH}/ncatted -h -O -a title,global,o,c,"Output from ISAM for Trendy_v7/GCP2018" ${i}
  # ${NCO_PATH}/ncatted -h -O -a institution,global,o,c,"Department of Atmospheric Sciences, University of Illinois" ${i}
  ${NCO_PATH}/ncatted -h -O -a pfttype,global,c,c,"1: Tropical evergreen forest, 2: Tropical deciduous forest, 3: Temperate evergreen forest, 4: Temperate deciduous forest, 5: Boreal evergreen forest, 6: Savanna, 7: C3 Grassland, 8: Shrubland, 9: Tundra, 10: Desert, 11: Polar desert, 12: C3 crop, 13: C3 pasture, 14: Secondary tropical evergreen forest, 15: Secondary tropical deciduous forest, 16: Secondary temperate evergreen forest, 17: Secondary temperate deciduous forest, 18: Secondary boreal evergreen forest, 19: Bare ground, 20: Boreal deciduous forest, 21: C4 grassland, 22: C4 crop, 23: C4 pasture, 24 Secondary boreal deciduous forest" ${i}
  # ${NCO_PATH}/ncatted -h -O -a contact,global,o,c,"Atul Jain, jain1@illinois.edu; Shijie Shu, sshu3@illinois.edu" ${i}
  # ${NCO_PATH}/ncatted -h -O -a Conventions,global,c,c,"CF-1.0" ${i}
  # ${NCO_PATH}/ncatted -h -O -a version,,d,, ${i}
  # ${NCO_PATH}/ncatted -h -O -a NCO,,d,, ${i}
  # ${NCO_PATH}/ncatted -h -O -a source,global,d,, ${i}
  # ${NCO_PATH}/ncatted -h -O -a history_of_appended_files,,d,, ${i}
done
