clear;clc

% Code for reading radiocarbon atmospheric D14C data
% Open NC file
% Path of the output directory
atmd14c_path = 'E:\matwork\del_c14_annual_50000bp_2015.nc';

% The var name in the netcdf file
varname = 'del_c14';

%%%%%%%%%%%% Do not edit below this row %%%%%%%%%%%%%%%%%%
% Read in SG3 data
ncid = netcdf.open(atmd14c_path, 'NOWRITE');
varid = netcdf.inqVarID(ncid, varname);
atmd14c_ori = netcdf.getVar(ncid, varid);
    
% Close the file
netcdf.close(ncid);

% read in data and assign to 2-D variable called atmD14C
year = -48049:2016;
year=year';
com = [year, atmd14c_ori];

% trancate to only save 50kBP-2012
atmD14C = com(1:50062,:);

% clear other temporary variables
clearvars -except atmD14C 
save atnD14C_50kBP-2012.mat