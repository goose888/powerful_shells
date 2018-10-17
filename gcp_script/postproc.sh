#!/bin/bash
# Post processing ISAM output for GCP 2018
# Note: This script needs NCL and NCO

# load path to nco
NCO_PATH=/software/dev_tools/swtree/cs400_centos7.2_pe2016-08/nco/4.6.4/centos7.2_gnu5.3.0/bin

# # I. Basic variables
# # First 2-D variables
# mv ../Global_dveg_SG0.ISAM_*.nc .
# ncl transform_files_2D.ncl 'varName=(/"cVeg"/)' 'globeAtt=1' 'globeAtt@description="ISAM Trendy SG0 output"' 'ncFil="ISAM_S0_"+varName(0)+".nc"'
# cd Processed/
# ${NCO_PATH}/ncks -C -O -x -v time ISAM_S0_cVeg.nc ISAM_S0_cVeg.nc
# ${NCO_PATH}/ncks -A TYR.nc ISAM_S0_cVeg.nc
# cd ..
# ncl transform_files_2D.ncl 'varName=(/"cLeaf"/)' 'globeAtt=1' 'globeAtt@description="ISAM Trendy SG0 output"' 'ncFil="ISAM_S0_"+varName(0)+".nc"'
# cd Processed/
# ${NCO_PATH}/ncks -C -O -x -v time ISAM_S0_cLeaf.nc ISAM_S0_cLeaf.nc
# ${NCO_PATH}/ncks -A TYR.nc ISAM_S0_cLeaf.nc
# cd ..
# ncl transform_files_2D.ncl 'varName=(/"cWood"/)' 'globeAtt=1' 'globeAtt@description="ISAM Trendy SG0 output"' 'ncFil="ISAM_S0_"+varName(0)+".nc"'
# cd Processed/
# ${NCO_PATH}/ncks -C -O -x -v time ISAM_S0_cWood.nc ISAM_S0_cWood.nc
# ${NCO_PATH}/ncks -A TYR.nc ISAM_S0_cWood.nc
# cd ..
# ncl transform_files_2D.ncl 'varName=(/"cRoot"/)' 'globeAtt=1' 'globeAtt@description="ISAM Trendy SG0 output"' 'ncFil="ISAM_S0_"+varName(0)+".nc"'
# cd Processed/
# ${NCO_PATH}/ncks -C -O -x -v time ISAM_S0_cRoot.nc ISAM_S0_cRoot.nc
# ${NCO_PATH}/ncks -A TYR.nc ISAM_S0_cRoot.nc
# cd ..
# ncl transform_files_2D.ncl 'varName=(/"cSoil"/)' 'globeAtt=1' 'globeAtt@description="ISAM Trendy SG0 output"' 'ncFil="ISAM_S0_"+varName(0)+".nc"'
# cd Processed/
# ${NCO_PATH}/ncks -C -O -x -v time ISAM_S0_cSoil.nc ISAM_S0_cSoil.nc
# ${NCO_PATH}/ncks -A TYR.nc ISAM_S0_cSoil.nc
# cd ..
# ncl transform_files_2D.ncl 'varName=(/"nVeg"/)' 'globeAtt=1' 'globeAtt@description="ISAM Trendy SG0 output"' 'ncFil="ISAM_S0_"+varName(0)+".nc"'
# cd Processed/
# ${NCO_PATH}/ncks -C -O -x -v time ISAM_S0_nVeg.nc ISAM_S0_nVeg.nc
# ${NCO_PATH}/ncks -A TYR.nc ISAM_S0_nVeg.nc
# cd ..
# ncl transform_files_2D.ncl 'varName=(/"nLitter"/)' 'globeAtt=1' 'globeAtt@description="ISAM Trendy SG0 output"' 'ncFil="ISAM_S0_"+varName(0)+".nc"'
# cd Processed/
# ${NCO_PATH}/ncks -C -O -x -v time ISAM_S0_nLitter.nc ISAM_S0_nLitter.nc
# ${NCO_PATH}/ncks -A TYR.nc ISAM_S0_nLitter.nc
# cd ..
# ncl transform_files_2D.ncl 'varName=(/"nSoil"/)' 'globeAtt=1' 'globeAtt@description="ISAM Trendy SG0 output"' 'ncFil="ISAM_S0_"+varName(0)+".nc"'
# cd Processed/
# ${NCO_PATH}/ncks -C -O -x -v time ISAM_S0_nSoil.nc ISAM_S0_nSoil.nc
# ${NCO_PATH}/ncks -A TYR.nc ISAM_S0_nSoil.nc
# cd ..

# # 3-D varibales (Lat*Lon*Month)
# ncl transform_files_3D_month.ncl 'varName=(/"tas"/)' 'globeAtt=1' 'globeAtt@description="ISAM Trendy SG0 output"' 'ncFil="ISAM_SG0_"'
# ncl transform_files_3D_month.ncl 'varName=(/"pr"/)' 'globeAtt=1' 'globeAtt@description="ISAM Trendy SG0 output"' 'ncFil="ISAM_SG0_"'
# ncl transform_files_3D_month.ncl 'varName=(/"rsds"/)' 'globeAtt=1' 'globeAtt@description="ISAM Trendy SG0 output"' 'ncFil="ISAM_SG0_"'
# ncl transform_files_3D_month.ncl 'varName=(/"mrso"/)' 'globeAtt=1' 'globeAtt@description="ISAM Trendy SG0 output"' 'ncFil="ISAM_SG0_"'
# ncl transform_files_3D_month.ncl 'varName=(/"mrro"/)' 'globeAtt=1' 'globeAtt@description="ISAM Trendy SG0 output"' 'ncFil="ISAM_SG0_"'
# ncl transform_files_3D_month.ncl 'varName=(/"evapotrans"/)' 'globeAtt=1' 'globeAtt@description="ISAM Trendy SG0 output"' 'ncFil="ISAM_SG0_"'
# ncl transform_files_3D_month.ncl 'varName=(/"gpp"/)' 'globeAtt=1' 'globeAtt@description="ISAM Trendy SG0 output"' 'ncFil="ISAM_SG0_"'
# ncl transform_files_3D_month.ncl 'varName=(/"npp"/)' 'globeAtt=1' 'globeAtt@description="ISAM Trendy SG0 output"' 'ncFil="ISAM_SG0_"'
# ncl transform_files_3D_month.ncl 'varName=(/"ra"/)' 'globeAtt=1' 'globeAtt@description="ISAM Trendy SG0 output"' 'ncFil="ISAM_SG0_"'
# ncl transform_files_3D_month.ncl 'varName=(/"evspsblveg"/)' 'globeAtt=1' 'globeAtt@description="ISAM Trendy SG0 output"' 'ncFil="ISAM_SG0_"'
# ncl transform_files_3D_month.ncl 'varName=(/"evspsblsoi"/)' 'globeAtt=1' 'globeAtt@description="ISAM Trendy SG0 output"' 'ncFil="ISAM_SG0_"'
# ncl transform_files_3D_month.ncl 'varName=(/"tran"/)' 'globeAtt=1' 'globeAtt@description="ISAM Trendy SG0 output"' 'ncFil="ISAM_SG0_"'
# ncl transform_files_3D_month.ncl 'varName=(/"lai"/)' 'globeAtt=1' 'globeAtt@description="ISAM Trendy SG0 output"' 'ncFil="ISAM_SG0_"'
# ncl transform_files_3D_month.ncl 'varName=(/"cLeafm"/)' 'globeAtt=1' 'globeAtt@description="ISAM Trendy SG0 output"' 'ncFil="ISAM_SG0_"'
# ncl transform_files_3D_month.ncl 'varName=(/"cWoodm"/)' 'globeAtt=1' 'globeAtt@description="ISAM Trendy SG0 output"' 'ncFil="ISAM_SG0_"'
# ncl transform_files_3D_month.ncl 'varName=(/"cFRootm"/)' 'globeAtt=1' 'globeAtt@description="ISAM Trendy SG0 output"' 'ncFil="ISAM_SG0_"'
# ncl transform_files_3D_month.ncl 'varName=(/"cCRootm"/)' 'globeAtt=1' 'globeAtt@description="ISAM Trendy SG0 output"' 'ncFil="ISAM_SG0_"'
# ncl transform_files_3D_month.ncl 'varName=(/"cAllo_lf"/)' 'globeAtt=1' 'globeAtt@description="ISAM Trendy SG0 output"' 'ncFil="ISAM_SG0_"'
# ncl transform_files_3D_month.ncl 'varName=(/"cAllo_wd"/)' 'globeAtt=1' 'globeAtt@description="ISAM Trendy SG0 output"' 'ncFil="ISAM_SG0_"'
# ncl transform_files_3D_month.ncl 'varName=(/"cAllo_fr"/)' 'globeAtt=1' 'globeAtt@description="ISAM Trendy SG0 output"' 'ncFil="ISAM_SG0_"'
# ncl transform_files_3D_month.ncl 'varName=(/"cAllo_cr"/)' 'globeAtt=1' 'globeAtt@description="ISAM Trendy SG0 output"' 'ncFil="ISAM_SG0_"'
# ncl transform_files_3D_month.ncl 'varName=(/"rh"/)' 'globeAtt=1' 'globeAtt@description="ISAM Trendy SG0 output"' 'ncFil="ISAM_SG0_"'
# ncl transform_files_3D_month.ncl 'varName=(/"nbp"/)' 'globeAtt=1' 'globeAtt@description="ISAM Trendy SG0 output"' 'ncFil="ISAM_SG0_"'
# ncl transform_files_3D_month.ncl 'varName=(/"fNdep"/)' 'globeAtt=1' 'globeAtt@description="ISAM Trendy SG0 output"' 'ncFil="ISAM_SG0_"'
# ncl transform_files_3D_month.ncl 'varName=(/"fBNF"/)' 'globeAtt=1' 'globeAtt@description="ISAM Trendy SG0 output"' 'ncFil="ISAM_SG0_"'
# ncl transform_files_3D_month.ncl 'varName=(/"fNup"/)' 'globeAtt=1' 'globeAtt@description="ISAM Trendy SG0 output"' 'ncFil="ISAM_SG0_"'
# ncl transform_files_3D_month.ncl 'varName=(/"fNlit"/)' 'globeAtt=1' 'globeAtt@description="ISAM Trendy SG0 output"' 'ncFil="ISAM_SG0_"'
# ncl transform_files_3D_month.ncl 'varName=(/"fNnetmin"/)' 'globeAtt=1' 'globeAtt@description="ISAM Trendy SG0 output"' 'ncFil="ISAM_SG0_"'
# ncl transform_files_3D_month.ncl 'varName=(/"fNloss"/)' 'globeAtt=1' 'globeAtt@description="ISAM Trendy SG0 output"' 'ncFil="ISAM_SG0_"'
## 3-D variables (Lat*Lon*PFT)
#ncl transform_files_3D_PFT.ncl 'varName=(/"cVegpft"/)' 'globeAtt=1' 'globeAtt@description="ISAM Trendy SG0 output"' 'ncFil="ISAM_SG0_"'
#ncl transform_files_3D_PFT.ncl 'varName=(/"cSoilpft"/)' 'globeAtt=1' 'globeAtt@description="ISAM Trendy SG0 output"' 'ncFil="ISAM_SG0_"'
## 4-D variables (Lat*Lon*Month*Nlev)
#ncl transform_files_4D.ncl 'varName=(/"tsl"/)' 'globeAtt=1' 'globeAtt@description="ISAM Trendy SG0 output"' 'ncFil="ISAM_SG0_"'
#ncl transform_files_4D.ncl 'varName=(/"msl"/)' 'globeAtt=1' 'globeAtt@description="ISAM Trendy SG0 output"' 'ncFil="ISAM_SG0_"'

# # Move into temporary directories
# cd Processed/
# mkdir tas
# mkdir pr
# mkdir rsds
# mkdir mrso
# mkdir mrro
# mkdir evapotrans
# mkdir gpp
# mkdir npp
# mkdir ra
# mkdir evspsblveg
# mkdir evspsblsoi
# mkdir tran
# mkdir lai 
# mkdir cLeafm
# mkdir cWoodm
# mkdir cFRootm
# mkdir cCRootm
# mkdir cAllo_lf
# mkdir cAllo_wd
# mkdir cAllo_fr
# mkdir cAllo_cr
# mkdir rh
# mkdir nbp
# mkdir fNdep
# mkdir fBNF
# mkdir fNup
# mkdir fNlit
# mkdir fNnetmin
# mkdir fNloss
# mkdir cVegpft
# mkdir cSoilpft
# mkdir tsl
# mkdir msl

# mv *_pr* pr
# mv *_tas* tas
# mv *_rsds* rsds
# mv *_mrso* mrso
# mv *_mrro* mrro
# mv *_evapotrans* evapotrans
# mv *_gpp* gpp
# mv *_npp* npp
# mv *_ra* ra
# mv *_evspsblveg* evspsblveg
# mv *_evspsblsoi* evspsblsoi
# mv *_tran* tran
# mv *_lai* lai 
# mv *_cLeafm* cLeafm
# mv *_cWoodm* cWoodm
# mv *_cFRootm* cFRootm
# mv *_cCRootm* cCRootm
# mv *_cAllo_lf* cAllo_lf
# mv *_cAllo_wd* cAllo_wd
# mv *_cAllo_fr* cAllo_fr
# mv *_cAllo_cr* cAllo_cr
# mv *_rh* rh
# mv *_nbp* nbp
# mv *_fNdep* fNdep
# mv *_fBNF* fBNF
# mv *_fNup* fNup
# mv *_fNlit* fNlit
# mv *_fNnetmin* fNnetmin
# mv *_fNloss* fNloss
# mv *_cVegpft* cVegpft
# mv *_cSoilpft* cSoilpft
# mv *_tsl* tsl
# mv *_msl* msl

# # Enter each directory and combine files into one file
# ../merge_files.sh 'ISAM_S0_' 'pr'
# ../merge_files.sh 'ISAM_S0_' 'tas'
# ../merge_files.sh 'ISAM_S0_' 'rsds'
# ../merge_files.sh 'ISAM_S0_' 'mrso'
# ../merge_files.sh 'ISAM_S0_' 'mrro'
# ../merge_files.sh 'ISAM_S0_' 'evapotrans'
# ../merge_files.sh 'ISAM_S0_' 'gpp'
# ../merge_files.sh 'ISAM_S0_' 'npp'
# ../merge_files.sh 'ISAM_S0_' 'ra'
# ../merge_files.sh 'ISAM_S0_' 'evspsblveg'
# ../merge_files.sh 'ISAM_S0_' 'evspsblsoi'
# ../merge_files.sh 'ISAM_S0_' 'tran'
# ../merge_files.sh 'ISAM_S0_' 'lai'
# ../merge_files.sh 'ISAM_S0_' 'cLeafm'
# ../merge_files.sh 'ISAM_S0_' 'cWoodm'
# ../merge_files.sh 'ISAM_S0_' 'cFRootm'
# ../merge_files.sh 'ISAM_S0_' 'cCRootm'
# ../merge_files.sh 'ISAM_S0_' 'cAllo_lf'
# ../merge_files.sh 'ISAM_S0_' 'cAllo_wd'
# ../merge_files.sh 'ISAM_S0_' 'cAllo_fr'
# ../merge_files.sh 'ISAM_S0_' 'cAllo_cr'
# ../merge_files.sh 'ISAM_S0_' 'rh'
# ../merge_files.sh 'ISAM_S0_' 'nbp'
# ../merge_files.sh 'ISAM_S0_' 'fNdep'
# ../merge_files.sh 'ISAM_S0_' 'fBNF'
# ../merge_files.sh 'ISAM_S0_' 'fNup'
# ../merge_files.sh 'ISAM_S0_' 'fNlit'
# ../merge_files.sh 'ISAM_S0_' 'fNnetmin'
# ../merge_files.sh 'ISAM_S0_' 'fNloss'
# ../merge_files_pft.sh 'ISAM_S0_' 'cVegpft'
# ../merge_files_pft.sh 'ISAM_S0_' 'cSoilpft'
## TSL
#cd tsl/
#flist=`ls -1 *_tsl*`
#for i in ${flist}
#do
#   # Added new dimension
#   ${NCO_PATH}/ncrename -d month,time -O ${i} ${i}
#   ${NCO_PATH}/ncks -C -O -x -v month ${i} ${i}
#   ${NCO_PATH}/ncks --mk_rec_dmn time -O ${i} ${i}
#done
#fname="../ISAM_S0_tsl.nc"
#${NCO_PATH}/ncrcat ${flist} ${fname}
#${NCO_PATH}/ncks -A ../TTT.nc ${fname}
## Rename coord variables lon and lat
#${NCO_PATH}/ncrename -d lon,longitude -v lon,longitude ${fname}
#${NCO_PATH}/ncrename -d lat,latitude -v lat,latitude ${fname}
## Add axes for coord variables lon and lat
#${NCO_PATH}/ncatted -O -a axis,longitude,c,c,'X' ${fname}
#${NCO_PATH}/ncatted -O -a axis,latitude,c,c,'Y' ${fname}
#cd ..
## MSL
#cd msl/
#flist=`ls -1 *_msl*`
#for i in ${flist}
#do
#   # Added new dimension
#  # ncap2 -s 'defdim("time",1);' -O ${i} ${i}
#   ${NCO_PATH}/ncrename -d month,time -O ${i} ${i}
#   ${NCO_PATH}/ncks -C -O -x -v month ${i} ${i}
#   ${NCO_PATH}/ncks --mk_rec_dmn time -O ${i} ${i}
#done
#fname="../ISAM_S0_msl.nc"
#${NCO_PATH}/ncrcat ${flist} ${fname}
#${NCO_PATH}/ncks -A ../TTT.nc ${fname}
## Rename coord variables lon and lat
#${NCO_PATH}/ncrename -d lon,longitude -v lon,longitude ${fname}
#${NCO_PATH}/ncrename -d lat,latitude -v lat,latitude ${fname}
## Add axes for coord variables lon and lat
#${NCO_PATH}/ncatted -O -a axis,longitude,c,c,'X' ${fname}
#${NCO_PATH}/ncatted -O -a axis,latitude,c,c,'Y' ${fname}
#cd ..

## Transfer unit from kgC/m2/month to kgC/m2/s (Only for carbon fluxes only)
## cd ..
#cp Processed/ISAM_S0_gpp.nc .
#./transfer_month_to_sec.sh 'ISAM_S0_' 'gpp'
#cp Processed/ISAM_S0_npp.nc .
#./transfer_month_to_sec.sh 'ISAM_S0_' 'npp'
#cp Processed/ISAM_S0_nbp.nc .
#./transfer_month_to_sec.sh 'ISAM_S0_' 'nbp'
#cp Processed/ISAM_S0_ra.nc .
#./transfer_month_to_sec.sh 'ISAM_S0_' 'ra'
#cp Processed/ISAM_S0_rh.nc .
#./transfer_month_to_sec.sh 'ISAM_S0_' 'rh'
#mv ISAM_S0_* Processed
#cp Processed/ISAM_S0_fBNF.nc .
#./transfer_month_to_sec2.sh 'ISAM_S0_' 'fBNF'
#cp Processed/ISAM_S0_fNup.nc .
#./transfer_month_to_sec2.sh 'ISAM_S0_' 'fNup'
#cp Processed/ISAM_S0_fNloss.nc .
#./transfer_month_to_sec2.sh 'ISAM_S0_' 'fNloss'
#cp Processed/ISAM_S0_fNlit.nc .
#./transfer_month_to_sec2.sh 'ISAM_S0_' 'fNlit'
#cp Processed/ISAM_S0_fNnetmin.nc .
#./transfer_month_to_sec2.sh 'ISAM_S0_' 'fNnetmin'
#cp Processed/ISAM_S0_fNdep.nc .
#./transfer_month_to_sec2.sh 'ISAM_S0_' 'fNdep'
#mv ISAM_S0_* Processed

## Dump the processed outputs
#mkdir S0_std_output
#mv Global_dveg_SG0.ISAM_*.nc S0_std_output/

# II. Transfer 4D energy variables.
# mv ../Global_dveg_SG0_4D_energy.ISAM_*.nc .
# ncl transform_files_4D.ncl 'varName=(/"shflxpft"/)' 'globeAtt=1' 'globeAtt@description="ISAM Trendy SG0 output"' 'ncFil="ISAM_SG0_"'
# ncl transform_files_4D.ncl 'varName=(/"rnpft"/)' 'globeAtt=1' 'globeAtt@description="ISAM Trendy SG0 output"' 'ncFil="ISAM_SG0_"'
# cd Processed/
# mkdir shflxpft
# mkdir rnpft
# mv *_shflxpft* shflxpft/
# mv *_rnpft* rnpft/
# ../merge_files_4d.sh 'ISAM_S0_' 'shflxpft'
# ../merge_files_4d.sh 'ISAM_S0_' 'rnpft'
# cd ../
# mkdir S0_energy_output
# mv Global_dveg_SG0_4D_energy.ISAM_*.nc S0_energy_output/

## III. Transfer 4D biological variables.
#mv ../Global_dveg_SG0_4D_biological.ISAM_*.nc .
#ncl transform_files_4D.ncl 'varName=(/"gpppft"/)' 'globeAtt=1' 'globeAtt@description="ISAM Trendy SG0 output"' 'ncFil="ISAM_SG0_"'
#ncl transform_files_4D.ncl 'varName=(/"npppft"/)' 'globeAtt=1' 'globeAtt@description="ISAM Trendy SG0 output"' 'ncFil="ISAM_SG0_"'
#ncl transform_files_4D.ncl 'varName=(/"nbppft"/)' 'globeAtt=1' 'globeAtt@description="ISAM Trendy SG0 output"' 'ncFil="ISAM_SG0_"'
#cd Processed/
#mkdir gpppft
#mkdir npppft
#mkdir nbppft
#mv *_gpppft* gpppft/
#mv *_npppft* npppft/
#mv *_nbppft* nbppft/
#../merge_files_4d.sh 'ISAM_S0_' 'gpppft'
#../merge_files_4d.sh 'ISAM_S0_' 'npppft'
#../merge_files_4d.sh 'ISAM_S0_' 'nbppft'
#cd ../
#mkdir S0_biological_output
#mv Global_dveg_SG0_4D_biological.ISAM_*.nc S0_biological_output/

### IV. Transfer 4D hydrological variables.
#mv ../Global_dveg_SG0_4D_hydrological.ISAM_*.nc .
#ncl transform_files_4D.ncl 'varName=(/"evapotranspft"/)' 'globeAtt=1' 'globeAtt@description="ISAM Trendy SG0 output"' 'ncFil="ISAM_SG0_"'
#ncl transform_files_4D.ncl 'varName=(/"transpft"/)' 'globeAtt=1' 'globeAtt@description="ISAM Trendy SG0 output"' 'ncFil="ISAM_SG0_"'
#ncl transform_files_4D.ncl 'varName=(/"evapo"/)' 'globeAtt=1' 'globeAtt@description="ISAM Trendy SG0 output"' 'ncFil="ISAM_SG0_"'
#cd Processed/
#mkdir evapotranspft
#mkdir transpft
#mkdir evapo
#mv *_evapotranspft* evapotranspft/
#mv *_transpft* transpft/
#mv *_evapo* evapo/
#../merge_files_4d.sh 'ISAM_S0_' 'evapotranspft'
#../merge_files_4d.sh 'ISAM_S0_' 'transpft'
#../merge_files_4d.sh 'ISAM_S0_' 'evapo'
#cd ../
#mkdir S0_hydrological_output
#mv Global_dveg_SG0_4D_hydrological.ISAM_*.nc S0_hydrological_output/

# V. Transfer 4D vis albedo variables.
#mv ../Global_dveg_SG0_4D_vis_albedo.ISAM_*.nc .
#ncl transform_files_4D.ncl 'varName=(/"albedopft_visdir"/)' 'globeAtt=1' 'globeAtt@description="ISAM Trendy SG0 output"' 'ncFil="ISAM_SG0_"'
#ncl transform_files_4D.ncl 'varName=(/"albedopft_visdif"/)' 'globeAtt=1' 'globeAtt@description="ISAM Trendy SG0 output"' 'ncFil="ISAM_SG0_"'
#cd Processed/
#mkdir albedopft_visdir
#mkdir albedopft_visdif
#mv *_albedopft_visdir* albedopft_visdir/
#mv *_albedopft_visdif* albedopft_visdif/
#../merge_files_4d.sh 'ISAM_S0_' 'albedopft_visdir'
#../merge_files_4d.sh 'ISAM_S0_' 'albedopft_visdif'
#cd ../
#mkdir S0_vis_albedo_output
#mv Global_dveg_SG0_4D_vis_albedo.ISAM_*.nc S0_vis_albedo_output/
#
### VI. Transfer 4D nir albedo variables.
#mv ../Global_dveg_SG0_4D_nir_albedo.ISAM_*.nc .
#ncl transform_files_4D.ncl 'varName=(/"albedopft_nirdir"/)' 'globeAtt=1' 'globeAtt@description="ISAM Trendy SG0 output"' 'ncFil="ISAM_SG0_"'
#ncl transform_files_4D.ncl 'varName=(/"albedopft_nirdif"/)' 'globeAtt=1' 'globeAtt@description="ISAM Trendy SG0 output"' 'ncFil="ISAM_SG0_"'
#cd Processed/
#mkdir albedopft_nirdir
#mkdir albedopft_nirdif
#mv *_albedopft_nirdir* albedopft_nirdir/
#mv *_albedopft_nirdif* albedopft_nirdif/
#../merge_files_4d.sh 'ISAM_S0_' 'albedopft_nirdir'
#../merge_files_4d.sh 'ISAM_S0_' 'albedopft_nirdif'
#cd ../
#mkdir S0_nir_albedo_output
#mv Global_dveg_SG0_4D_nir_albedo.ISAM_*.nc S0_nir_albedo_output/

# VII. postprocess LUC related variables
#mv ../Global_dveg_SG0_LUC.ISAM_*.nc .
#ncl transform_files_2D.ncl 'varName=(/"fLuc"/)' 'globeAtt=1' 'globeAtt@description="ISAM Trendy SG0 output"' 'ncFil="ISAM_S0_"+varName(0)+".nc"'
#cd Processed/
#ncks -C -O -x -v time ISAM_S0_fLuc.nc ISAM_S0_fLuc.nc
#ncks -A TYR.nc ISAM_S0_fLuc.nc
#cd ..
#ncl transform_files_2D.ncl 'varName=(/"cProduct"/)' 'globeAtt=1' 'globeAtt@description="ISAM Trendy SG0 output"' 'ncFil="ISAM_S0_"+varName(0)+".nc"'
#cd Processed/
#ncks -C -O -x -v time ISAM_S0_cProduct.nc ISAM_S0_cProduct.nc
#ncks -A TYR.nc ISAM_S0_cProduct.nc
#cd ..
#ncl transform_files_3D_PFT.ncl 'varName=(/"landCoverFrac"/)' 'globeAtt=1' 'globeAtt@description="ISAM Trendy SG0 output"' 'ncFil="ISAM_SG0_"'
#cd Processed/
#mkdir landCoverFrac
#mv *_landCoverFrac* landCoverFrac/
#../merge_files_pft.sh 'ISAM_S0_' 'landCoverFrac'
#cd ../
#mkdir S0_LUC_output
#mv Global_dveg_SG0_LUC.ISAM_*.nc S0_LUC_output
