#!/bin/sh
# =======================================================================================
#
# This script will create, setup and build a single-site simulation at
# a specified domain
#
# A specialized domain and surface file was generated using Gautam Bisht's
# "matlab-script-for-clm-sparse-grid".
# Or see Jennifer holm's Matlab script for single-site domain and surface
# file generation.
#
#
# The base-version of this script, works off the assumption that driver data
# and surface/domain data have been unpacked in the cime/scripts directory
# and can all be found in a parent directory with alias $SITE_DIR
#
# Jennifer Holm (Mon Mov 13 2019)
# Based off of Ryan Knox (Mon Nov 13 13:53:03 PST 2017)
#
# Shijie Shu (10/06/2022)
# Revised version to accept input from parent script
# For Lawrencium only
# ${1} -- model script directory
# ${2} -- case directory
# ${3} -- site name
# ${4} -- surface data path
# ${5} -- surface file name
# ${6} -- domain data path
# ${7} -- domain file name
# ${8} -- luc data path + name
# ${9} -- fates parameter data path + name
# ${10} -- start year
# ${11} -- run years
# Atmospheric forcing is using GSWPv3
#
# USER SETTINGS
# USER MAY ALSO WANT TO ADJUST XML CHANGES, AND NAMELIST ARGUMENTS
# ==============================================================================

SITE_BASE_DIR=${1}
CASEROOT=${2}
MACH=lawrencium-lr3
PROJECT=ac_acme
COMPILER=intel
WALLTIME=12:00:00

# SETTINGS SPECIFIC TO THIS SCRIPT
CIME_MODEL=e3sm
SITE_NAME=${3}
ELM_USRDAT_DOMAIN=${7}
ELM_USRDAT_SURDAT=${5}
ELM_USRDAT_LUCDAT=${8}
RES=ELM_USRDAT

# SETTINGS AND PATHS THAT ARE DEPENDENT
ELM_SURFDAT_DIR=${4}
ELM_DOMAIN_DIR=${6}
DIN_LOC_ROOT=/global/scratch/users/jaholm/ccsm_inputdata
DIN_LOC_ROOT_CLMFORC=${DIN_LOC_ROOT}/atm/datm7

ELM_HASH=`git log -n 1 --pretty=%h`
FATES_HASH=`(cd ../../components/elm/src/external_models/fates;git log -n 1 --pretty=%h)`
GIT_HASH=E${ELM_HASH}-F${FATES_HASH}

# COMPSET AND CREATING THE CASE SETTINGS
# ==============================================================================

COMPSET=2000_DATM%QIA_ELM%BGC-FATES_SICE_SOCN_MOSART_SGLC_SWAV_SIAC_SESP
#COMPSET=IELMFATES #Short Name

NAMETAG=${SITE_NAME}

CASE_NAME=${CASEROOT}/${NAMETAG}


# REMOVE EXISTING CASE DIRECTORY IF PRESENT
# (I like using the next command, good for re-making cases
# that were originally created wrongly, but it could be dangerous
# if you forget it is there and can accidentally remove your stuff)
rm -r ${CASE_NAME}

# CREATE THE CASE
${1}/create_newcase --case=${CASE_NAME} --res=${RES} --compset=${COMPSET} --mach=${MACH} --compiler=${COMPILER} --project=${PROJECT} --walltime=${WALLTIME}

cd ${CASE_NAME}

# SET PATHS TO DOMAIN, MET AND INPUT DATA (USERS WILL PROB NOT CHANGE THESE)
# =================================================================================
./xmlchange ATM_DOMAIN_FILE=${ELM_USRDAT_DOMAIN}
./xmlchange ATM_DOMAIN_PATH=${ELM_DOMAIN_DIR}
./xmlchange LND_DOMAIN_FILE=${ELM_USRDAT_DOMAIN}
./xmlchange LND_DOMAIN_PATH=${ELM_DOMAIN_DIR}
./xmlchange DATM_MODE=CLMGSWP3v1
./xmlchange ELM_USRDAT_NAME=${SITE_NAME}
./xmlchange DIN_LOC_ROOT=${DIN_LOC_ROOT}
./xmlchange DIN_LOC_ROOT_CLMFORC=${DIN_LOC_ROOT_CLMFORC}
./xmlchange NTASKS=1


# TURN ON ECA, century and nitrif/denitrif
# ==============================================================================

#./xmlchange --append CLM_BLDNML_OPTS="-nutrient cnp -nutrient_comp_pathway eca -soil_decomp century -nitrif_denitrif"


# SPECIFY RUN TYPE PREFERENCES (USERS MIGHT CHANGE THESE)
# =================================================================================

./xmlchange DEBUG=FALSE
./xmlchange STOP_OPTION=nyears
./xmlchange STOP_N=${11}
./xmlchange REST_N=50
./xmlchange RUN_STARTDATE=${10}
./xmlchange DATM_CLMNCEP_YR_START=2000
./xmlchange DATM_CLMNCEP_YR_END=2010
./xmlchange DATM_MODE=CLMGSWP3v1


# MACHINE SPECIFIC, AND/OR USER PREFERENCE CHANGES (USERS MIGHT CHANGE THESE, JUST PREFERENCE)
# =================================================================================

./xmlchange DOUT_S_SAVE_INTERIM_RESTART_FILES=TRUE
#./xmlchange DOUT_S=FALSE
#./xmlchange DOUT_S_ROOT=${CASE_NAME}/run
#./xmlchange RUNDIR=${CASE_NAME}/run
#./xmlchange EXEROOT=${CASE_NAME}/bld


# MODIFY THE ELM NAMELIST (USERS MODIFY AS NEEDED)

cat >> user_nl_elm <<EOF
suplphos = 'ALL'
suplnitro = 'ALL'
finidat = ''
fates_paramfile='${9}'
flanduse_timeseries = '${8}'
do_harvest = .false.
use_fates_nocomp = .false.
use_fates_fixed_biogeog = .true.
fsurdat = '${ELM_SURFDAT_DIR}/${ELM_USRDAT_SURDAT}'
check_dynpft_consistency = .false.
check_finidat_fsurdat_consistency = .false.
check_finidat_year_consistency = .false.
!hist_empty_htapes = .true.
!hist_avgflag_pertape = 'I'
!hist_nhtfrq = -24
!hist_mfilt = 30
!hist_fincl1 = 'FATES_VEGC','FATES_PATCHAREA_AP','FATES_CANOPYAREA_AP','FATES_BASALAREA_SZ','FATES_NPLANT_CANOPY_SZ','FATES_DDBH_CANOPY_SZAP',              'FATES_DDBH_USTORY_SZAP','FATES_MORTALITY_CANOPY_SZAP','FATES_MORTALITY_USTORY_SZAP','FATES_VEGC_SZPF','FATES_SECONDARY_FOREST_FRACTION','FATES_SECONDARY_FOREST_VEGC','FATES_HARVEST_CARBON_FLUX','HRV_DEADSTEMC_TO_PROD10C','HRV_DEADSTEMC_TO_PROD100C','PROD10C','PROD100C','HARVEST_DEBT','HARVEST_DEBT_SEC'

EOF

./case.setup
./case.build

