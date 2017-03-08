#!/bin/csh -f
#+sshu3
#SBATCH  --account=m1602
#SBATCH  --job-name=ISAM_trendyS3
#SBATCH  --partition=debug
#SBATCH  --nodes=86
#SBATCH  --time=00:30:00
#SBATCH -o slurm.%N.%j.out
#SBATCH -e slurm.%N.%j.err

cd /global/cscratch1/sd/sshu3/trendy_SG3

# -------------------------------------------------------------------------
# Check if reach the limit, if so exit the script
# -------------------------------------------------------------------------
set lim = `cat run_times`
 
if(${lim} < 33) then
   # -------------------------------------------------------------------------
   # Run the model
   # -------------------------------------------------------------------------
   set sdate = `date +"%Y-%m-%d %H:%M:%S"`
   echo "srun started $sdate"
   echo "`date` -- MODEL EXECUTION BEGINS HERE" 

   set sfx = `date +"%m%d%y_%H_%M_%S"`   # Suffix for notify outputs from resubmission

   srun -n 2064 ./isam < namelist.batch

   echo "=====================================================" 
   echo "`date` -- CSM EXECUTION HAS FINISHED" 
   
   set sdate = `date +"%Y-%m-%d %H:%M:%S"`
   echo "srun ended $sdate"
 
   # -------------------------------------------------------------------------
   # Make directory and store all DAT files here
   # -------------------------------------------------------------------------
   cd output
   mkdir $sfx
   set string = `ls *.dat`
   mv $string $sfx
   cd ..
   echo "Successfully transferred output data"
 
   # -------------------------------------------------------------------------
   # Update initial fils for the model simulation
   # -------------------------------------------------------------------------
   cd data/initial_bgp
   mv bgp.isam_initial.dveg.gcp.nc bgp.isam_initial.dveg.gcp.nc.$sfx
   set dlist = `ls -1t`
   mv "$dlist[1]" bgp.isam_initial.dveg.gcp.nc
   echo "Successfully updated BGP initial file for the next submission!"
 
   cd ../initial_bgc
   mv bgc.isam_initial.dveg.gcp.nc bgc.isam_initial.dveg.gcp.nc.$sfx
   set dlist = `ls -1t`
   mv "$dlist[1]" bgc.isam_initial.dveg.gcp.nc
   echo "Successfully updated BGC initial file for the next submission!"
   cd ../..
 
   # -------------------------------------------------------------------------
   # Update options in the namelist
   # -------------------------------------------------------------------------
 
   echo "-------------------------------------------------------------------------"
   echo "                        Setting the namelist"
   echo "-------------------------------------------------------------------------"
 
   set start_time = `cat text_year`
 #  if($start_time == 1901) then
     @ start_time = ${start_time} + 5
 #  else
 #    @ start_time = ${start_time} - 10
 #  endif
cat > text_year << EOF
$start_time
EOF
   
   # Setup the namelist
   mv namelist.batch namelist.abandoned   # remove old namelist
cat > namelist.batch << EOF1
&isamcfg

        runname = 'Global_dveg_SG3'

        bgp_bgc_mode = 3
        restart = .true.
        run_type = 2
        CN_RATIO = 0
        initial_bgp_in_datadir = 'initial_bgp/bgp.isam_initial.dveg.gcp.nc'
        initial_bgc_in_datadir = 'initial_bgc/bgc.isam_initial.dveg.gcp.nc'

        repeat_cycles = 1
        start_time = $start_time
        run_time = 5

        offline_clim_data = 'CRU_NCEP'
        luc_data = 1

        clim_disturb= .true.
        clim_random= .false.
        co2_disturb= .true.
        luc_disturb= .true.
        n_disturb= .true.
        fna_func = .true.

        region_mask = 1,1,1,1,1,1,1,1,1,0,0

        datadir   = 'data'
        outputdir = 'output'

        single_point = .false.
        single_x = 431
        single_y = 308
        generate_site_met_nc_from_global = .false.

        single_pft = .false.
        single_pft_num = -999
        use_site_met = .false.
        sitename   = 'S03AK-240-015'
        site_ref_ht = 30
        site_met_option = 'CRU_NCEP'
        site_met_timezone = 'local'

        dyn_veg         = .true.
        dyn_soc         = .false.
        fixed_harvest   = .false.
        fixed_planttime = .false.
        crop_mode       = 'generic'

        hist_freq_yr = 1
        save_hist_yr = .true.
        output_trendy = .true.
        save_hist_mon = .false.
        save_hist_bgp_to_bgc = .false.

        restart_freq_yr = 5

        isam_deltim = 3600
/
EOF1

   # -------------------------------------------------------------------------
   # End of the resubmission code
   # -------------------------------------------------------------------------
   set edate = `date +"%Y-%m-%d %H:%M:%S"`
   echo "END THE RUN SUCCESSFULLY $edate"
   echo "NOW resubmit the run!"
   
   # -------------------------------------------------------------------------
   # Resubmit another run script
   # -------------------------------------------------------------------------
   sbatch trendy_ISAM.S3
   @ lim = ${lim} + 1

else

   @ lim = ${lim} + 1

endif

cat > run_times << EOF
$lim
EOF
