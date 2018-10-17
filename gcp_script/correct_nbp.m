clear;clc

% Correct_nbp.m
% This code correct the NBP Outptut for SG3 case
% CAUTION: Since this code will overwrite files, please backup the original outputs before running the code
% author: Shijie Shu

%%% Please provide correct information below
% Please specify the start year and the end year
styear = 1860;
edyear = 2016;

% Path of the output directory
sg_path = '/global/cscratch1/sd/sshu3/trendy_SG3/output/ISAM_S3/';

% The case name of your run
casename = 'Global_dveg_SG3';

%%%%%%%%%%%% Do not edit below this row %%%%%%%%%%%%%%%%%%

% Calculate area of each grid
eartharea = 5.095E+14;
latarea = zeros(720,360);
for i=1:360
   lat1 = -90.0+0.5*(i-1);
   lat2 = lat1 + 0.5;
   phe1 = lat1*pi/180;
   phe2 = lat2*pi/180;
   fra = abs(sin(phe2)-sin(phe1))/2;
   latarea(:,i) = eartharea*fra;
   latarea(:,i) = latarea(:,i)/720;
end

% Read in NBP data
for y = styear:edyear

    disp('Correcting Year:');
    disp(y);

    sg_fname = strcat(sg_path, casename, '.ISAM_', num2str(y), '.nc');

    % Read in SG3 data
    ncid = netcdf.open(sg_fname, 'WRITE');
    varid = netcdf.inqVarID(ncid, 'lat');
    lat = netcdf.getVar(ncid, varid);
    varid = netcdf.inqVarID(ncid, 'lon');
    lon = netcdf.getVar(ncid, varid);
    varid = netcdf.inqVarID(ncid, 'npp');
    npp  = netcdf.getVar(ncid, varid);
    varid = netcdf.inqVarID(ncid, 'ld');
    ld = netcdf.getVar(ncid, varid);
    varid = netcdf.inqVarID(ncid, 'rh');
    rh = netcdf.getVar(ncid, varid);

    % Calculate NBP based on mass balance equation
    nbp = npp-rh+ld;
    for i = 1:720
       for j = 1:360
          for k = 1:12
             if(nbp(i,j,k) > 5000)
                nbp(i,j,k) = -9999.;
             end
          end
       end
    end

    % Write NBP back into the file 
    varid = netcdf.inqVarID(ncid, 'nbp');
    netcdf.putVar(ncid, varid, nbp);
    
    % Close the file
    netcdf.close(ncid);

end
