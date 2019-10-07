clear;clc

%% Input needed in this code
inputfile = {'Ridgefield_2016_L3.nc'};
auxfile = 'rfi.nc';
sitename = 'Ridgefield';
lat = [-32.5061]; 
lon = [116.9668];
tstep_sec = '1800';
site_timezone = '8:00';
metfile = 'AU-RFiforcing.nc';
height = 20;

%% Do not modify below
%% Open old NC file
year_tot = [];
doy_tot = [];
hrmin_tot = [];
dtime_tot = [];
rainf_tot = [];
tair_tot = [];
rh_tot = [];
vpd_tot = [];
wind_tot = [];
par_tot = [];
psurf_tot = [];
aco2_tot = [];
swdown_tot = [];
lwdown_tot = [];
steps_tot = 0;
steps_mx = [];
for i=1:length(inputfile)
    ncid = netcdf.open(inputfile{i}, 'NOWRITE');
    % Get dimensions
    tstpid = netcdf.inqDimID(ncid, 'time');
    [~, steps] = netcdf.inqDim(ncid, tstpid);
    steps = 17568;
    steps_mx = [steps_mx; (1:steps)'+steps_tot];
    steps_tot = steps_tot + steps;
    
    % Get variables
    yearid = netcdf.inqVarID(ncid, 'Year');
    year = netcdf.getVar(ncid, yearid);
    reallen = length(year);
    year_tot = round(2016 * ones(17568 - reallen, 1));
    year_tot = [year_tot; squeeze(year)];
    
    doyid = netcdf.inqVarID(ncid, 'Ddd');
    doy = netcdf.getVar(ncid, doyid);
    doy_tot = [doy_tot; doy];
    hrminid = netcdf.inqVarID(ncid, 'Hour');
    hrmin = netcdf.getVar(ncid, hrminid);
    hrmin_tot = [hrmin_tot; hrmin];
    dtimeid = netcdf.inqVarID(ncid, 'Minute');
    dtime = netcdf.getVar(ncid, dtimeid);
    dtime_tot = [dtime_tot; dtime];

    rainfid = netcdf.inqVarID(ncid, 'Precip');
    rainf_tot = -9999.0 * ones(17568 - reallen, 1);
    rainf = netcdf.getVar(ncid, rainfid);
    rainf_tot = [rainf_tot; squeeze(rainf)];
    
    tairid = netcdf.inqVarID(ncid, 'Ta');
    tair_tot = -9999.0 * ones(17568 - reallen, 1);
    tair = netcdf.getVar(ncid, tairid);
    tair_tot = [tair_tot; squeeze(tair)];
    
    qid = netcdf.inqVarID(ncid, 'q');
    q_tot = -9999.0 * ones(17568 - reallen, 1);
    q = netcdf.getVar(ncid, qid);
    q_tot = [q_tot; squeeze(q)];
    
    vpdid = netcdf.inqVarID(ncid, 'VPD');
    vpd_tot = -9999.0 * ones(17568 - reallen, 1);
    vpd = netcdf.getVar(ncid, vpdid);
    vpd_tot = [vpd_tot; squeeze(vpd)];
    
%     qairid = netcdf.inqVarID(ncid, 'Qair');
%     qair = netcdf.getVar(ncid, qairid);
%     qair = squeeze(qair);

    windid = netcdf.inqVarID(ncid, 'Ws');
    wind_tot = -9999.0 * ones(17568 - reallen, 1);
    wind = netcdf.getVar(ncid, windid);
    wind_tot = [wind_tot; squeeze(wind)];
    
    swdownid = netcdf.inqVarID(ncid, 'Fsd');
    swdown_tot = -9999.0 * ones(17568 - reallen, 1);
    swdown = netcdf.getVar(ncid, swdownid);
    swdown_tot = [swdown_tot; squeeze(swdown)];
    
    %parid = netcdf.inqVarID(ncid, 'PAR');
    %par = netcdf.getVar(ncid, parid);
    %par_tot = [par_tot; squeeze(par)];
    
    lwdownid = netcdf.inqVarID(ncid, 'Fld');
    lwdown_tot = -9999.0 * ones(17568 - reallen, 1);
    lwdown = netcdf.getVar(ncid, lwdownid);
    lwdown_tot = [lwdown_tot; squeeze(lwdown)];
    
    psurfid = netcdf.inqVarID(ncid, 'ps');
    psurf_tot = -9999.0 * ones(17568 - reallen, 1);
    psurf = netcdf.getVar(ncid, psurfid);
    psurf_tot = [psurf_tot; squeeze(psurf)];
    
    aco2id = netcdf.inqVarID(ncid, 'CO2_IRGA_Av');
    aco2_tot = -9999.0 * ones(17568 - reallen, 1);
    aco2 = netcdf.getVar(ncid, aco2id);
    aco2_tot = [aco2_tot; squeeze(aco2)];

    netcdf.close(ncid);
end

%% Obtain missing data from CRUNCEP forcing
% Read the csv data
% Extend one day data for year 2016
ncid = netcdf.open(auxfile, 'NOWRITE');
tairid = netcdf.inqVarID(ncid, 'Tair');
tair_cru = squeeze(netcdf.getVar(ncid, tairid)) - 273.16;
tair_cru = [tair_cru; tair_cru(17473:17520)];
windid = netcdf.inqVarID(ncid, 'Wind');
wind_cru = squeeze(netcdf.getVar(ncid, windid));
wind_cru = [wind_cru; wind_cru(17473:17520)];
qid = netcdf.inqVarID(ncid, 'Qair');
q_cru = squeeze(netcdf.getVar(ncid, qid));
q_cru = [q_cru; q_cru(17473:17520)];
rainfid = netcdf.inqVarID(ncid, 'Rainf');
rainf_cru = squeeze(netcdf.getVar(ncid, rainfid))*1800.;
rainf_cru = [rainf_cru; rainf_cru(17473:17520)];
psurfid = netcdf.inqVarID(ncid, 'PSurf');
psurf_cru = squeeze(netcdf.getVar(ncid, psurfid))/1000.;
psurf_cru = [psurf_cru; psurf_cru(17473:17520)];
swdownid = netcdf.inqVarID(ncid, 'SWdown');
swdown_cru = squeeze(netcdf.getVar(ncid, swdownid));
swdown_cru = [swdown_cru; swdown_cru(17473:17520)];
lwdownid = netcdf.inqVarID(ncid, 'LWdown');
lwdown_cru = squeeze(netcdf.getVar(ncid, lwdownid));
lwdown_cru = [lwdown_cru; lwdown_cru(17473:17520)];
netcdf.close(ncid);

%% Processing data
%% Directly using CRUNCEP data to fill the gap
for i=1:40
    tair_tot(find(tair_tot<-100)) = tair_cru(find(tair_tot<-100));
    swdown_tot(find(swdown_tot<-10)) = swdown_cru(find(swdown_tot<-10));
    lwdown_tot(find(lwdown_tot<-10)) = lwdown_cru(find(lwdown_tot<-10));
    q_tot(find(q_tot<0)) = q_cru(find(q_tot<0));
    wind_tot(find(wind_tot<0)) = wind_cru(find(wind_tot<0));
    rainf_tot(find(rainf_tot<0)) = rainf_cru(find(rainf_tot<0));
    aco2_tot(find(aco2_tot<0)) = 0.;
    aco2_tot(find(aco2_tot>700)) = 0.;
    psurf_tot(find(psurf_tot<0)) = psurf_cru(find(psurf_tot<0));
    % vpd_tot(find(vpd_tot<0)) = vpd_tot(find(vpd_tot<0) - 48);
    % par_tot(find(par_tot<-10)) = par_tot(find(par_tot<-10) + 48);
end
tair_tot = tair_tot + 273.16;  % Transfer to K
rainf_tot = rainf_tot / 1800;  % From mm to kg/m2/s
psurf_tot = psurf_tot * 1000;  % From kPa to Pa
swdown_tot(swdown_tot<0) = 0.;    % Force to positive values
lwdown_tot(lwdown_tot<0) = 0.;    % Force to positive values
% par_tot(par_tot<0) = 0.;    % Force to positive values


%% Create meteorology data
% Save Preprocessed data into a new netcdf file
ncid = netcdf.create(metfile, 'CLOBBER');
% Define dimensions
tid = netcdf.defDim(ncid, 't', steps_tot);
xid = netcdf.defDim(ncid, 'x', 1);
yid = netcdf.defDim(ncid, 'y', 1);
zid = netcdf.defDim(ncid, 'z', 1);

% Some information needed from inputfile
startyear = num2str(year_tot(1));
starttime = strcat(startyear, '-01-01 00:00:00 ', site_timezone);
createdate = strcat('File created from Ameriflux L2 gap filled data on ', date);
sitelocation = strcat('Latitude:', num2str(lat(1)), ', Longitude:', num2str(lon(1)));

% year_tot = [];
% doy_tot = [];
% hrmin_tot = [];

% Define variables
timeid = netcdf.defVar(ncid, 't', 'int', tid);
netcdf.putAtt(ncid, timeid, 't:long_name', 'Time axis');
netcdf.putAtt(ncid, timeid, 't:units', 'seconds since original timestamp');
netcdf.putAtt(ncid, timeid, 't:calendar', 'gregorian');
netcdf.putAtt(ncid, timeid, 't:time_origin', starttime);

tstpid = netcdf.defVar(ncid, 'timestp', 'int', tid);
netcdf.putAtt(ncid, tstpid, 'timestp:long_name', 'Time step axis');
netcdf.putAtt(ncid, tstpid, 'timestp:units', 'timesteps since original timestamp');
netcdf.putAtt(ncid, tstpid, 'timestp:tstep_sec', tstep_sec);
netcdf.putAtt(ncid, tstpid, 'timestp:time_origin', starttime);

lonid = netcdf.defVar(ncid, 'lon', 'double', xid);
netcdf.putAtt(ncid, lonid, 'lon:long_name', 'Longitude');
netcdf.putAtt(ncid, lonid, 'lon:units', 'degrees_east');

latid = netcdf.defVar(ncid, 'lat', 'double', yid);
netcdf.putAtt(ncid, latid, 'lat:long_name', 'Latitude');
netcdf.putAtt(ncid, latid, 'lat:units', 'degrees_north');

levelid = netcdf.defVar(ncid, 'level', 'double', zid);
netcdf.putAtt(ncid, levelid, 'level:long_name', 'Vertical levels');
netcdf.putAtt(ncid, levelid, 'level:units', 'm');

tairid = netcdf.defVar(ncid, 'Tair', 'double', [tid, zid, yid, xid]);
netcdf.putAtt(ncid, tairid, 'Tair:long_name', 'Near surface air temperature');
netcdf.putAtt(ncid, tairid, 'Tair:units', 'K');
netcdf.putAtt(ncid, tairid, 'Tair:_FillValue', -9999.);

% tairflagid = netcdf.defVar(ncid, 'Tair_flag', 'int', [xid, yid, zid, tid]);
% netcdf.putAtt(ncid, tairflagid, 'Tair_flag:long_name', 'Near surface air temperature');
% netcdf.putAtt(ncid, tairflagid, 'Tair_flag:flag_values', '0,1,2,3,4,6,7,8');
% netcdf.putAtt(ncid, tairflagid, 'Tair_flag:flag_meanings', strcat('0_Original, ', ...
%                          '1_Diurnal_mean_fill, 2_Daymet, 3_Daymet_and_dailyNCDC, ', ...
%                          '4_dailyNCDC, 6_hourlyNCDC, 7_nearby_tower, 8_multiple_var'));

qairid = netcdf.defVar(ncid, 'Qair', 'double', [tid, zid, yid, xid]);
netcdf.putAtt(ncid, qairid, 'Qair:long_name', 'Near surface specific humidity');
netcdf.putAtt(ncid, qairid, 'Qair:units', '%');
netcdf.putAtt(ncid, qairid, 'Qair:_FillValue', -9999.);

% qairflagid = netcdf.defVar(ncid, 'Qair_flag', 'int', [xid, yid, zid, tid]);
% netcdf.putAtt(ncid, qairflagid, 'Qair_flag:long_name', 'Near surface specific humidity');
% netcdf.putAtt(ncid, qairflagid, 'Qair_flag:flag_values', '0,1,2,3,4,6,7,8');
% netcdf.putAtt(ncid, qairflagid, 'Qair_flag:flag_meanings', strcat('0_Original, ', ...
%                          '1_Diurnal_mean_fill, 2_Daymet, 3_Daymet_and_dailyNCDC, ', ...
%                          '4_dailyNCDC, 6_hourlyNCDC, 7_nearby_tower, 8_multiple_var'));

windid = netcdf.defVar(ncid, 'Wind', 'double', [tid, zid, yid, xid]);
netcdf.putAtt(ncid, windid, 'Wind:long_name', 'Near surface module of the wind');
netcdf.putAtt(ncid, windid, 'Wind:units', 'm/s');
netcdf.putAtt(ncid, windid, 'Wind:_FillValue', -9999.);

% windflagid = netcdf.defVar(ncid, 'Wind_flag', 'int', [xid, yid, zid, tid]);
% netcdf.putAtt(ncid, windflagid, 'Wind_flag:long_name', 'Near surface module of the wind');
% netcdf.putAtt(ncid, windflagid, 'Wind_flag:flag_values', '0,1,2,3,4,6,7,8');
% netcdf.putAtt(ncid, windflagid, 'Wind_flag:flag_meanings', strcat('0_Original, ', ...
%                          '1_Diurnal_mean_fill, 2_Daymet, 3_Daymet_and_dailyNCDC, ', ...
%                          '4_dailyNCDC, 6_hourlyNCDC, 7_nearby_tower, 8_multiple_var'));

rainfid = netcdf.defVar(ncid, 'Rainf', 'double', [tid, zid, yid, xid]);
netcdf.putAtt(ncid, rainfid, 'Rainf:long_name', 'Rainfall rate');
netcdf.putAtt(ncid, rainfid, 'Rainf:units', 'kg/m2/s');
netcdf.putAtt(ncid, rainfid, 'Rainf:_FillValue', -9999.);

% rainfflagid = netcdf.defVar(ncid, 'Rainf_flag', 'int', [xid, yid, zid, tid]);
% netcdf.putAtt(ncid, rainfflagid, 'Rainf_flag:long_name', 'Rainfall rate');
% netcdf.putAtt(ncid, rainfflagid, 'Rainf_flag:flag_values', '0,1,2,3,4,6,7,8');
% netcdf.putAtt(ncid, rainfflagid, 'Rainf_flag:flag_meanings', strcat('0_Original, ', ...
%                          '1_Diurnal_mean_fill, 2_Daymet, 3_Daymet_and_dailyNCDC, ', ...
%                          '4_dailyNCDC, 6_hourlyNCDC, 7_nearby_tower, 8_multiple_var'));

psurfid = netcdf.defVar(ncid, 'Psurf', 'double', [tid, zid, yid, xid]);
netcdf.putAtt(ncid, psurfid, 'Psurf:long_name', 'Surface pressure');
netcdf.putAtt(ncid, psurfid, 'Psurf:units', 'Pa');
netcdf.putAtt(ncid, psurfid, 'Psurf:_FillValue', -9999.);

% psurfflagid = netcdf.defVar(ncid, 'Psurf_flag', 'int', [xid, yid, zid, tid]);
% netcdf.putAtt(ncid, psurfflagid, 'Psurf_flag:long_name', 'Surface pressure');
% netcdf.putAtt(ncid, psurfflagid, 'Psurf_flag:flag_values', '0,1,2,3,4,6,7,8');
% netcdf.putAtt(ncid, psurfflagid, 'Psurf_flag:flag_meanings', strcat('0_Original, ', ...
%                          '1_Diurnal_mean_fill, 2_Daymet, 3_Daymet_and_dailyNCDC, ', ...
%                          '4_dailyNCDC, 6_hourlyNCDC, 7_nearby_tower, 8_multiple_var'));

swdownid = netcdf.defVar(ncid, 'SWdown', 'double', [tid, zid, yid, xid]);
netcdf.putAtt(ncid, swdownid, 'SWdown:long_name', 'Surface incident shortwave radiation');
netcdf.putAtt(ncid, swdownid, 'SWdown:units', 'W/m2');
netcdf.putAtt(ncid, swdownid, 'SWdown:_FillValue', -9999.);

% swdownflagid = netcdf.defVar(ncid, 'SWdown_flag', 'int', [xid, yid, zid, tid]);
% netcdf.putAtt(ncid, swdownflagid, 'SWdown_flag:long_name', 'Surface incident shortwave radiation');
% netcdf.putAtt(ncid, swdownflagid, 'SWdown_flag:flag_values', '0,1,2,3,4,6,7,8');
% netcdf.putAtt(ncid, swdownflagid, 'SWdown_flag:flag_meanings', strcat('0_Original, ', ...
%                          '1_Diurnal_mean_fill, 2_Daymet, 3_Daymet_and_dailyNCDC, ', ...
%                          '4_dailyNCDC, 6_hourlyNCDC, 7_nearby_tower, 8_multiple_var'));
  
lwdownid = netcdf.defVar(ncid, 'LWdown', 'double', [tid, zid, yid, xid]);
netcdf.putAtt(ncid, lwdownid, 'LWdown:long_name', 'Surface incident longwave radiation');
netcdf.putAtt(ncid, lwdownid, 'LWdown:units', 'W/m2');
netcdf.putAtt(ncid, lwdownid, 'LWdown:_FillValue', -9999.);

% lwdownflagid = netcdf.defVar(ncid, 'LWdown_flag', 'int', [xid, yid, zid, tid]);
% netcdf.putAtt(ncid, lwdownflagid, 'LWdown_flag:long_name', 'Surface incident longwave radiation');
% netcdf.putAtt(ncid, lwdownflagid, 'LWdown_flag:flag_values', '0,1,2,3,4,6,7,8');
% netcdf.putAtt(ncid, lwdownflagid, 'LWdown_flag:flag_meanings', strcat('0_Original, ', ...
%                          '1_Diurnal_mean_fill, 2_Daymet, 3_Daymet_and_dailyNCDC, ', ...
%                          '4_dailyNCDC, 6_hourlyNCDC, 7_nearby_tower, 8_multiple_var'));

vpdid = netcdf.defVar(ncid, 'VPD', 'double', [tid, zid, yid, xid]);
netcdf.putAtt(ncid, vpdid, 'VPD:long_name', 'Vapor Pressure Deficit');
netcdf.putAtt(ncid, vpdid, 'VPD:units', 'Pa');
netcdf.putAtt(ncid, vpdid, 'VPD:_FillValue', -9999.);

%parid = netcdf.defVar(ncid, 'PAR', 'double', [tid, zid, yid, xid]);
%netcdf.putAtt(ncid, parid, 'PAR:long_name', 'Incident or downward photosynthetically active radiation');
%netcdf.putAtt(ncid, parid, 'PAR:units', 'umol/m2/s');
%netcdf.putAtt(ncid, parid, 'PAR:_FillValue', -9999.);

co2airid = netcdf.defVar(ncid, 'CO2air', 'double', [tid, zid, yid, xid]);
netcdf.putAtt(ncid, co2airid, 'CO2air:long_name', 'Near surface CO2 concentration');
netcdf.putAtt(ncid, co2airid, 'CO2air:flask_site', sitename);
netcdf.putAtt(ncid, co2airid, 'CO2air:units', 'ppmv');
netcdf.putAtt(ncid, co2airid, 'CO2air:_FillValue', -9999.);

% Global attributes
gid = netcdf.getConstant('Global');
netcdf.putAtt(ncid, gid, 'institution', 'University of Illinois at Urbana Champaign');
netcdf.putAtt(ncid, gid, 'history', createdate);
netcdf.putAtt(ncid, gid, 'site_name', sitename);
netcdf.putAtt(ncid, gid, 'nearby_site', sitename);
netcdf.putAtt(ncid, gid, 'site_location', sitelocation);

% End definition
netcdf.endDef(ncid);
% Put values into file
netcdf.putVar(ncid, timeid, 1800*(steps_mx - 1));
netcdf.putVar(ncid, tstpid, steps_mx - 1);
netcdf.putVar(ncid, lonid, lon);
netcdf.putVar(ncid, latid, lat);
netcdf.putVar(ncid, tairid, tair_tot);
netcdf.putVar(ncid, qairid, q_tot);
netcdf.putVar(ncid, windid, wind_tot);
netcdf.putVar(ncid, rainfid, rainf_tot);
netcdf.putVar(ncid, psurfid, psurf_tot);
netcdf.putVar(ncid, swdownid, swdown_tot);
netcdf.putVar(ncid, lwdownid, lwdown_tot);
netcdf.putVar(ncid, vpdid, vpd_tot);
%netcdf.putVar(ncid, parid, par_tot);
netcdf.putVar(ncid, co2airid, aco2_tot);


% Close the file
netcdf.close(ncid);
