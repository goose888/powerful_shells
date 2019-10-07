#!/bin/tcsh

#----------------------------------------------------------------------------------
# Author: Shijie Shu
# Created on: Nov 2 2015
#----------------------------------------------------------------------------------
# User defined options and variables
#----------------------------------------------------------------------------------

set atmforcing=false
set setup=true
set runcases=false
set postprocessing=false

set workdir='/global/cscratch1/sd/sshu3/SBGC/site/soc/all_sites'
set datarepo1='/global/project/projectdirs/m1602/datasets4.full'
set datarepo2='/global/project/projectdirs/m2707/datasets4.full'
set isamdir='/global/u2/s/sshu3/isam'

set siteinfo='site_info.csv'
set outfile='isamtexture.csv'
set proffile='socprofeq.dat'
set difffile='diffurate.dat'
set aldfile='ald.dat'
set c14file='deltac14.dat'

set starttime=1901
set runtime=110
set case_job='hist'
set prev_job='spinup'
 
#----------------------------------------------------------------------------------
# DO NOT EDIT BELOW
#----------------------------------------------------------------------------------
if($atmforcing == 'true') then

   echo '#################################################'
   echo '#                Copy Atm Forcing               #'
   echo '#################################################'

   #----------------------------------------------------------------------------------
   # get profile ID from file
   #----------------------------------------------------------------------------------
   # echo 'Extract profile lists:'
   # awk -F , 'NR>1 { print $1}' $workdir/$siteinfo > list_prof
   #set num=`wc -l < list_prof`
   #----------------------------------------------------------------------------------
   # Loop for each profile
   #----------------------------------------------------------------------------------
   set lines=`cat list_prof`
   set j=1
   while ( $j <= $#lines)
      echo 'Soil sample ID:' $lines[$j]
      if ( -d $lines[$j]) then
        echo 'Found, no need to create directory.'
      else
        echo 'Create new directory for soil profile.'
        mkdir $lines[$j]
      endif

      cp ${workdir}/atmforcing/${lines[$j]}forcing-CRU_NCEP.nc $lines[$j]/data/SITE_MET_OUTPUT_FROM_GLOBAL/
      @ j = $j + 1

   end  # End of Loop inside case directory

   echo '##################################################'
   echo '#                 Done Copying                   #'
   echo '##################################################'

endif

if($setup == 'true') then

   echo '#################################################'
   echo '#                ISAM Cases Setup               #' 
   echo '#################################################'
 
   echo ' '
   echo '(1) Check if directories missing and create new direcotories:'
   echo ' '
   #----------------------------------------------------------------------------------
   # get profile ID from file
   #----------------------------------------------------------------------------------
  # echo 'Extract profile lists:'
  # awk -F , 'NR>1 { print $1}' $workdir/$siteinfo > list_prof
   #set num=`wc -l < list_prof`
   #----------------------------------------------------------------------------------
   # Loop for each profile
   #----------------------------------------------------------------------------------
   set lines=`cat list_prof`
   set j=1
   while ( $j <= $#lines)
      echo 'Soil sample ID:' $lines[$j]
      if ( -d $lines[$j]) then
        echo 'Found, no need to create directory.'
      else
        echo 'Create new directory for soil profile.'
        mkdir $lines[$j]
      endif
      cd $lines[$j]
      #----------------------------------------------------------------------------------
      # Set specific options in namelist
      #----------------------------------------------------------------------------------
      set CASENAME=$lines[$j]
      set starttime=1901
      set runtime=110
      echo $CASENAME
      set lat=`awk -F , -v casename=$CASENAME '$1==casename { print $3}' $workdir/$siteinfo`
      echo $lat
      set lon=`awk -F , -v casename=$CASENAME '$1==casename { print $2}' $workdir/$siteinfo`
      echo $lon
      #----------------------------------------------------------------------------------
      # Calculate Lat/Lon idx based on lat/lon from site info file
      #----------------------------------------------------------------------------------
      set lonid = `echo ${lon} | awk '{lon = $1; if (lon < 0.) {lonid = (720. + lon*2. + 0.5); res = int(lonid); if(lonid-res > 0.5) lonid= res+1; else lonid = res;} else {lonid = (lon*2 + 0.5); res=int(lonid); if(lonid-res > 0.5) lonid= res+1; else lonid = res;} printf "%i", lonid;}'`
      set latid = `echo ${lat} | awk '{lat = $1; latid = (lat*2. + 0.5 + 180.); res=int(latid); if(latid-res > 0.5) latid= res+1; else latid = res; printf "%i", latid;}'`
      #----------------------------------------------------------------------------------
      # Store a copy of lat and lon ids
      #----------------------------------------------------------------------------------
      # printf "%-8s,%-8s,%-8s\n"  "$CASENAME" "$lonid" "$latid" >> $workdir/halfdeg_pos.csv
      #----------------------------------------------------------------------------------
      # Create ISAM NAMELIST 
      #----------------------------------------------------------------------------------
      echo 'Generate namelist for case ' ${CASENAME}
      ../setnamelist_genmet.csh ${CASENAME} ${starttime} ${runtime} ${lonid} ${latid}

      echo 'Generate namelist for spinup case ' ${CASENAME}
      ../setnamelist_spinup.csh ${CASENAME} ${starttime} ${runtime} ${lonid} ${latid}

      # Simulation stage
      echo 'Generate namelist for historical case ' ${CASENAME}
      ../setnamelist_hist.csh ${CASENAME} ${starttime} ${runtime} ${lonid} ${latid}
 
      # Projection stage
      echo 'Generate namelist for future RCP8.5 projection cases (till 2100) ' ${CASENAME}
      ../setnamelist_proj.csh ${CASENAME} ${starttime} ${runtime} ${lonid} ${latid}
      ../setnamelist_fixedproj.csh ${CASENAME} ${starttime} ${runtime} ${lonid} ${latid}
 
      # Ideal cases: BGC-BGP feedback through T vs. BGC-BGP feedback through W
      # T/W Seperation test for the Projection stage
      ../setnamelist_tproj.csh ${CASENAME} ${starttime} ${runtime} ${lonid} ${latid}
      ../setnamelist_wproj.csh ${CASENAME} ${starttime} ${runtime} ${lonid} ${latid}
 
      #----------------------------------------------------------------------------------
      # Create directory
      #----------------------------------------------------------------------------------
      if ( -d data) then
        echo 'Dir is found, no need to create directory: data.'
       # Shijie: Shall delete later!
       # ln -s ${datarepo1}/* data/
       # ln -s ${datarepo2}/* data/
       # rm data/initial_bgp
       # rm data/initial_bgc
       # mkdir data/initial_bgp
       # mkdir data/initial_bgc
       # mkdir data/SITE_MET_OUTPUT_FROM_GLOBAL
      else
        echo 'Create data directory for case:' ${CASENAME}
        mkdir data
        #----------------------------------------------------------------------------------
        # Link data from data repository and prepare input data
        #----------------------------------------------------------------------------------
        ln -s ${datarepo1}/* data/
        ln -s ${datarepo2}/* data/
        rm data/initial_bgp
        rm data/initial_bgc
        mkdir data/initial_bgp
        mkdir data/initial_bgc
        mkdir data/SITE_MET_OUTPUT_FROM_GLOBAL
      endif
 
      if ( -d output) then
        echo 'Dir is found, no need to create directory: output.'
      else
        echo 'Create output directory for case:' ${CASENAME}
        mkdir output
      endif
      #----------------------------------------------------------------------------------
      # Copy ISAM executable program
      #----------------------------------------------------------------------------------
      cp ${isamdir}/isam .
      chmod +x isam
      #cp /scratch2/scratchdirs/sshu3/soc_isam0d/all_sites/atmforcing/${CASENAME}forcing-CRU_NCEP.nc ./data/SITE_MET_OUTPUT_FROM_GLOBAL

      #----------------------------------------------------------------------------------
      # Create Job script and submit the case to let it run
      #----------------------------------------------------------------------------------
      echo 'Generate batch script for case ' ${CASENAME}
      set JOB = 'genmet'
      ../generate_batch.csh ${JOB} ${CASENAME}
      set JOB = 'spinup'
      ../generate_batch.csh ${JOB}

      #----------------------------------------------------------------------------------
      # Submit the job script to generate met forcing from CRUNCEP
      #----------------------------------------------------------------------------------
      sbatch genmet_${CASENAME}.sh
 
      #----------------------------------------------------------------------------------
      # Create a list of cases for further purpose
      #----------------------------------------------------------------------------------
##       cat >> ${workdir}/caselist << EOF1
##`pwd`
##EOF1

      #----------------------------------------------------------------------------------
      # Go back to upper level
      #----------------------------------------------------------------------------------
      echo 'Done ' ${CASENAME} '!'
      cd $workdir
      @ j = $j + 1

   end  # End of Loop inside case directory
   
   echo '##################################################'
   echo '#             ISAM Cases Setup Done              #'
   echo '##################################################'

else

   echo '##################################################'
   echo '#             Skip ISAM Cases Setup              #'
   echo '##################################################'

endif

if($runcases == 'true') then

   if( -f caselist ) then
      set cases=`cat caselist`
      set pft=`cat pftlist`
      set j=1
      while ( $j <= $#cases)
         echo '=============================================='
         echo 'Now run case:' $cases[$j]
         if ( -d $cases[$j]) then
           echo 'Found, submit the spinup job.'
           cd $cases[$j]

           # Create the batch script for job submission
           set JOB = ${case_job}
           ../generate_batch.csh ${JOB}
           #cp $isamdir/isam .
           #chmod +x isam

           # Move the new CRUNCEP data to the data directory
           # mv ./output/*forcing-CRU_NCEP.nc ./data/SITE_MET_OUTPUT_FROM_GLOBAL

           # ## Store residues from previous runs
           # mkdir ${prev_job}
           # mv *.txt ${prev_job}/
           # mv slurm* ${prev_job}/
           #rm *.txt
           #rm slurm*
           #rm -r first/
           rm first/site_daily*.txt
           rm first/site_hrly*.txt
           #rm -r hist/

           # # Purge residues from previous runs
           # echo ' '
           # echo 'Warning! Clean all txt files!'
           # echo ' '
           # rm *.txt 
           # rm isam.log

           # Manage the data folder
           #ln -s ${datarepo1}/* data/
           #ln -s ${datarepo2}/* data/

           # # Copy the file parameter files
           # cp ${workdir}/param_sbgc.in ./

           # # Rename the latest initial file
           # cd data/initial_bgp
           # mv bgp.isam_initial.nc bgp.isam_initial_${prev_job}.nc
           # mv `ls -t1 | head -n 1` bgp.isam_initial.nc
           # cd ../initial_bgc
           # mv bgc.isam_initial.nc bgc.isam_initial_${prev_job}.nc
           # mv `ls -t1 | head -n 1` bgc.isam_initial.nc

           # Back to the case directory
           cd ../..

           # ln -s ${workdir}/projected_climate/* data/SITE_MET_OUTPUT_FROM_GLOBAL/
           # ln -s ${datarepo1}/projected_co2/ data/
           # ln -s ${datarepo1}/projected_ndep/ data/

          # # Shijie: If want to change namelist options
          # # Shijie: Following commands are added for stage 1 of site spinup to obtain reasonable n_max_pt
          #  sed -i "s/repeat_cycles\ =\ 1500/repeat_cycles\ =\ 100/" namelist.spinup
          #  sed -i "s/run_time\ =\ 110/run_time\ =\ 20/" namelist.spinup
          #  sed -i "s/fna_func\ =\ .true./fna_func\ =\ .false./" namelist.spinup
          #  sed -i "s/single_pft_num\ =\ -9999/single_pft_num\ =\ $pft[$j]/" namelist.${case_job}
          #  sed -i "s/soil_data\ =\ Combined/soil_data\ =\ GSDE/" namelist.spinup
          #  sed -i "s/hist_freq_yr\ =\ 10000/hist_freq_yr\ =\ 2000/" namelist.spinup
          #  sed -i 's/restart_freq_yr\ =\ 10000/restart_freq_yr\ =\ 2000/' namelist.spinup
          #  # Shijie: Following commands are added for stage 2
          #   sed -i "s/run_type\ =\ 0/run_type\ =\ 2/" namelist.spinup
          #   sed -i "s/soil_data\ =\ Combined/soil_data\ =\ GSDE/" namelist.spinup
          #   sed -i "s/reset_soc\ =\ .false./reset_soc\ =\ .true./" namelist.spinup
          #   sed -i "s/single_pft_num\ =\ -9999/single_pft_num\ =\ $pft[$j]/" namelist.${case_job}

           # sed -i "s/c14_start_time\ =\ -30049/c14_start_time\ =\ -49/" namelist.hist
            sed -i "s/single_pft_num\ =\ -9999/single_pft_num\ =\ $pft[$j]/" namelist.${case_job}
            sed -i "s/run_time\ =\ 115/run_time\ =\ 110/" namelist.hist

           #sbatch ${case_job}.sh
           cd $workdir

         else
           echo ' '
           echo 'Failed to find the directory. Check if setup was successful.'
           echo ' '
         endif
         @ j = $j + 1
      end
   else
      exit 1
   endif

else

   echo '#####################################################'
   echo '#             Do not run cases this time            #'
   echo '#####################################################'

endif

if($postprocessing == 'true') then

   if( -f caselist ) then
      set cases=`cat caselist`
      set j=1
      while ( $j <= $#cases)
         echo 'Now processing case:' $cases[$j]
         if ( -d $cases[$j]) then
           echo 'Found, start post-processing.'
           cd $cases[$j]
           if ( -e socprof.txt) then
              tail -n 1 socprof.txt >> $workdir/$proffile
              tail -n 1 diffurate.txt >> $workdir/$difffile
              tail -n 1 ald.txt >> $workdir/$aldfile
              tail -n 1 deltac14.txt >> $workdir/$c14file

           #   tail -n 6 socprof.txt > tmp 
           #   head -n 1 tmp >> $workdir/$proffile
           #   tail -n 6 diffurate.txt > tmp
           #   head -n 1 tmp >> $workdir/$difffile
           #   tail -n 6 ald.txt > tmp 
           #   head -n 1 tmp >> $workdir/$aldfile
           #   tail -n 6 deltac14.txt > tmp
           #   head -n 1 tmp >> $workdir/$c14file
           else
              echo "-9999." >> $workdir/$proffile
              echo "-9999." >> $workdir/$difffile
              echo "-9999." >> $workdir/$aldfile
              echo "-9999." >> $workdir/$c14file
           endif
           # Purge the txts
           # rm *.txt
           cd $workdir
           ##awk '{ print $1","$2","$3","$4","$5}' texture_prof.txt >> $workdir/$outfile
         else
           echo ' '
           echo 'Failed to find the directory. Check if the setup was successful.'
           echo ' '
         endif
         @ j = $j + 1
      end
   else
      exit 1
   endif

else

   echo '##################################################'
   echo '#      No post-processing will be executed       #' 
   echo '##################################################'

endif

# Set the namelist for each variable
