#!/bin/csh -f

set FLIST = (`find . -maxdepth 2 -type f`)
set lines = `echo $#FLIST`

foreach t (${FLIST})
   set s = `echo $t | sed "s/S2/S2clim/g"`
   echo $s
   mv $t $s
end
