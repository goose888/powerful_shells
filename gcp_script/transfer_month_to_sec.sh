#!/bin/bash
prefix=$1
suffix='.nc'
var=$2
fname="${prefix}${var}${suffix}"
sed -i "18s/.*/${var}=${var}*div;/" mo2s.nco
ncap2 -O -S mo2s.nco ${fname} ${fname}
ncatted -O -a units,${var},m,c,'kg C m-2 s-1' ${fname}
