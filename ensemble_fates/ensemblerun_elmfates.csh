#!/bin/tcsh

#----------------------------------------------------------------------------------
# Author: Shijie Shu
# Created on: Nov 2 2015
# History:
# 10/06/2022 -- Revised for ELM-FATES ensemble simulation
#----------------------------------------------------------------------------------
# User defined options and variables
# setup: compile each case and submit job. good for multiple sites simulations.
# runcases: skip compilation by copying pre-compiled e3sm case. good for single
# site sensitivity test
# Currently only support Cori and Lawrencium
#----------------------------------------------------------------------------------

set setup=true
set cori=false
set runcases=false
set postprocessing=false

if($cori == 'true') then
   set model_dir='/global/homes/s/sshu3/E3SM/cime/scripts'
   set case_dir='/global/cscratch1/sd/sshu3/Runs/FATES_ensemble'
else
   set model_dir='/global/home/users/shijie/E3SM/cime/scripts'
   set case_dir='/global/scratch/users/shijie/Runs/FATES_ensemble'
endif
set siteinfo='site_info.csv'

#----------------------------------------------------------------------------------
# DO NOT EDIT BELOW
#----------------------------------------------------------------------------------
set workdir=`pwd`

if($setup == 'true') then

   echo '#################################################'
   echo '#               FATES Cases Setup               #' 
   echo '#################################################'
 
   #----------------------------------------------------------------------------------
   # Loop for each site
   #----------------------------------------------------------------------------------
   set lines=`cat list_site`
   set j=1
   while ( $j <= $#lines)
      echo 'Site ID/NAME:' $lines[$j]
      if ( -d ${case_dir}/$lines[$j]) then
        echo 'Found, no need to create directory.'
      else
        echo 'Create new directory for sites.'
        mkdir ${case_dir}/$lines[$j]
      endif

      #----------------------------------------------------------------------------------
      # Set specific options for building E3SM case and namelist options
      # Right now I shall avoid the land surface data generation and put it as one 
      # default template
      #----------------------------------------------------------------------------------
      if($cori == 'true') then
        set starttime='1850-01-01'
        set runtime=110
        set CASENAME=$lines[$j]
        set surf_dir='/global/homes/s/sshu3/E3SM/cime/scripts'
        set surf_fname='surfdata_4x5_simyr2000_SA-PFT4.c221012.nc'
        set dom_dir='/global/homes/s/sshu3/E3SM/cime/scripts'
        set dom_fname='domain.lnd.fv4x5_gx3v7_SA-PFT4.c221012.nc'
        set lucdata='/global/homes/s/sshu3/E3SM/cime/scripts/landuse.timeseries_4x5_hist_simyr1850-2015.testluc_biomass_harvest.nc'
      else
        set starttime='1850-01-01'
        set runtime=110
        set CASENAME=$lines[$j]
        set surf_dir='/global/home/users/shijie/E3SM/cime/scripts'
        set surf_fname='surfdata_4x5_simyr2000_SA-PFT4.c221012.nc'
        set dom_dir='/global/home/users/shijie/E3SM/cime/scripts'
        set dom_fname='domain.lnd.fv4x5_gx3v7_SA-PFT4.c221012.nc'
        set lucdata='/global/home/users/shijie/E3SM/cime/scripts/landuse.timeseries_4x5_hist_simyr1850-2015.testluc_biomass_harvest.nc'
      endif
      #set fates_param='/global/homes/s/sshu3/fates_params_default_12pft_api15.c211117.nc'
      echo $CASENAME
      set lat=`awk -F , -v casename=$CASENAME '$1==casename { print $3}' $siteinfo`
      echo $lat
      set lon=`awk -F , -v casename=$CASENAME '$1==casename { print $2}' $siteinfo`
      echo $lon
      set fates_param=`awk -F , -v casename=$CASENAME '$1==casename { print $4}' $siteinfo`
      #----------------------------------------------------------------------------------
 
      #----------------------------------------------------------------------------------
      # Compile E3SM executable program for each ensemble member
      #----------------------------------------------------------------------------------
      if($cori == 'true') then
         ./create_site_elm-fates.sh ${model_dir} ${case_dir} ${CASENAME} ${surf_dir} ${surf_fname} ${dom_dir} ${dom_fname} ${lucdata} ${fates_param} ${starttime} ${runtime}
         sbatch --time 24:00:00 -q premium --account m2467 ${case_dir}/${CASENAME}/.case.run --resubmit
      else
         ./create_site_elm-fates_lrc.sh ${model_dir} ${case_dir} ${CASENAME} ${surf_dir} ${surf_fname} ${dom_dir} ${dom_fname} ${lucdata} ${fates_param} ${starttime} ${runtime}
         sbatch --time 12:00:00 -p lr3 --account ac_acme ${case_dir}/${CASENAME}/.case.run --resubmit
      endif

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

           cd ../..

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
