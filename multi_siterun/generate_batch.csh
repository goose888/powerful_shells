#!/bin/csh

# Tempelate for creating batch scripts
if ( "$2" == "" ) then  
 
  cat > ${1}.sh << EOF1
#!/bin/bash -l
#SBATCH --account=m2707
#SBATCH --job-name=site_${1}
#SBATCH --constraint=haswell
#SBATCH --partition=shared
#SBATCH -n 1
#SBATCH --time=21:00:00
#SBATCH -o slurm.%N.%j.out
#SBATCH -e slurm.%N.%j.err
#SBATCH --mail-type=ALL
#SBATCH --mail-user=sshu3@illinois.edu

cd `pwd`

##------------------------------------
## NORMAL RUN
##------------------------------------
./isam < namelist.${1}

##------------------------------------
## DEBUG RUN
##------------------------------------
##valgrind --tool=memcheck --leak-check=no --num-callers=20 --undef-value-errors=yes --track-origins=yes --read-var-info=yes --smc-check=all ./isam < namelist 2>&1 >isam.log

EOF1

else

  cat > ${1}_${2}.sh << EOF1
#!/bin/bash -l
#SBATCH --account=m2707
#SBATCH --job-name=site_${1}
#SBATCH --constraint=haswell
#SBATCH --partition=shared
#SBATCH -n 1
#SBATCH --time=21:00:00
#SBATCH -o slurm.%N.%j.out
#SBATCH -e slurm.%N.%j.err
#SBATCH --mail-type=ALL
#SBATCH --mail-user=sshu3@illinois.edu

cd `pwd`

##------------------------------------
## NORMAL RUN
##------------------------------------
./isam < namelist.${1}

##------------------------------------
## DEBUG RUN
##------------------------------------
##valgrind --tool=memcheck --leak-check=no --num-callers=20 --undef-value-errors=yes --track-origins=yes --read-var-info=yes --smc-check=all ./isam < namelist 2>&1 >isam.log

EOF1

endif
