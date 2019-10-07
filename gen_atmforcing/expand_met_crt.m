clear;clc

%% Input needed in this code
inputfile = {'US-CRTforcing_3year.nc'};
sitename = 'Curtice Walter Berger Cropland';
lat = [41.6285];
lon = [-83.3471];
tstep_sec = '1800';
site_timezone = '-8:00';
metfile = 'US-CRTforcing.nc';
height = 20;
cycle = 5;

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
year_tot = [1981, 1982, 1983, ...
    1984, 1985, 1986, 1987, 1988, 1989, ...
    1990, 1991, 1992, 1993, 1994, 1995, ...
    1996, 1997, 1998, 1999, 2000, 2001, ...
    2002, 2003, 2004, 2005, 2006, 2007, ...
    2008, 2009, 2010, 2011, 2012, 2013];


%% Read in all fields
for i=1:length(inputfile)
    ncid = netcdf.open(inputfile{i}, 'NOWRITE');
    % Get dimensions
%     tstpid = netcdf.inqDimID(ncid, 'DTIME');
%     [~, steps] = netcdf.inqDim(ncid, tstpid);
%     steps_mx = [steps_mx; (1:steps)'+steps_tot];
%     steps_tot = steps_tot + steps;
    % Get variables
%     yearid = netcdf.inqVarID(ncid, 'YEAR');
%     year = netcdf.getVar(ncid, yearid);
%     year_tot = [year_tot; year];
%     doyid = netcdf.inqVarID(ncid, 'DOY');
%     doy = netcdf.getVar(ncid, doyid);
%     doy_tot = [doy_tot; doy];
%     hrminid = netcdf.inqVarID(ncid, 'HRMIN');
%     hrmin = netcdf.getVar(ncid, hrminid);
%     hrmin_tot = [hrmin_tot; hrmin];
%     dtimeid = netcdf.inqVarID(ncid, 'DTIME');
%     dtime = netcdf.getVar(ncid, dtimeid);
%     dtime_tot = [dtime_tot; dtime];
    rainfid = netcdf.inqVarID(ncid, 'Rainf');
    rainf = netcdf.getVar(ncid, rainfid);
    rainf_tot = [rainf_tot; squeeze(rainf)];
    tairid = netcdf.inqVarID(ncid, 'Tair');
    tair = netcdf.getVar(ncid, tairid);
    tair_tot = [tair_tot; squeeze(tair)];
    rhid = netcdf.inqVarID(ncid, 'RH');
    rh = netcdf.getVar(ncid, rhid);
    rh_tot = [rh_tot; squeeze(rh)];
    vpdid = netcdf.inqVarID(ncid, 'VPD');
    vpd = netcdf.getVar(ncid, vpdid);
    vpd_tot = [vpd_tot; squeeze(vpd)];
%     qairid = netcdf.inqVarID(ncid, 'Qair');
%     qair = netcdf.getVar(ncid, qairid);
%     qair = squeeze(qair);
    windid = netcdf.inqVarID(ncid, 'Wind');
    wind = netcdf.getVar(ncid, windid);
    wind_tot = [wind_tot; squeeze(wind)];
    swdownid = netcdf.inqVarID(ncid, 'SWdown');
    swdown = netcdf.getVar(ncid, swdownid);
    swdown_tot = [swdown_tot; squeeze(swdown)];
%     parid = netcdf.inqVarID(ncid, 'PAR');
%     par = netcdf.getVar(ncid, parid);
%     par_tot = [par_tot; squeeze(par)];
    lwdownid = netcdf.inqVarID(ncid, 'LWdown');
    lwdown = netcdf.getVar(ncid, lwdownid);
    lwdown_tot = [lwdown_tot; squeeze(lwdown)];
    psurfid = netcdf.inqVarID(ncid, 'Psurf');
    psurf = netcdf.getVar(ncid, psurfid);
    psurf_tot = [psurf_tot; squeeze(psurf)];
    aco2id = netcdf.inqVarID(ncid, 'CO2air');
    aco2 = netcdf.getVar(ncid, aco2id);
    aco2_tot = [aco2_tot; squeeze(aco2)];

    netcdf.close(ncid);
end

%% No need to process data...

%% Expand the data by recycling it.
tair_temp = tair_tot;
rh_temp = rh_tot;
wind_temp = wind_tot;
rainf_temp = rainf_tot;
psurf_temp = psurf_tot;
swdown_temp = swdown_tot;
lwdown_temp = lwdown_tot;
vpd_temp = vpd_tot;
aco2_temp = aco2_tot;

for i = 1:10
%     if(i==1)
%         tair_tot = [tair_temp(35089:length(tair_temp)); tair_temp];
%         rh_tot = [rh_temp(35089:length(rh_temp)); rh_temp];
%         wind_tot = [wind_temp(35089:length(wind_temp)); wind_temp];
%         rainf_tot = [rainf_temp(35089:length(rainf_temp)); rainf_temp];
%         psurf_tot = [psurf_temp(35089:length(psurf_temp)); psurf_temp];
%         swdown_tot = [swdown_temp(35089:length(swdown_temp)); swdown_temp];
%         lwdown_tot = [lwdown_temp(35089:length(lwdown_temp)); lwdown_temp];
%         vpd_tot = [vpd_temp(35089:length(vpd_temp)); vpd_temp];
%         aco2_tot = [aco2_temp(35089:length(aco2_temp)); aco2_temp];
%     else
        tair_tot = [tair_tot; tair_temp];
        rh_tot = [rh_tot; rh_temp];
        wind_tot = [wind_tot; wind_temp];
        rainf_tot = [rainf_tot; rainf_temp];
        psurf_tot = [psurf_tot; psurf_temp];
        swdown_tot = [swdown_tot; swdown_temp];
        lwdown_tot = [lwdown_tot; lwdown_temp];
        vpd_tot = [vpd_tot; vpd_temp];
        aco2_tot = [aco2_tot; aco2_temp];
%     end
end

steps_tot = length(tair_tot);


%% Create new meteorology nc file
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
% timeid = netcdf.defVar(ncid, 't', 'int', tid);
% netcdf.putAtt(ncid, timeid, 't:long_name', 'Time axis');
% netcdf.putAtt(ncid, timeid, 't:units', 'seconds since original timestamp');
% netcdf.putAtt(ncid, timeid, 't:calendar', 'gregorian');
% netcdf.putAtt(ncid, timeid, 't:time_origin', starttime);
% 
% tstpid = netcdf.defVar(ncid, 'timestp', 'int', tid);
% netcdf.putAtt(ncid, tstpid, 'timestp:long_name', 'Time step axis');
% netcdf.putAtt(ncid, tstpid, 'timestp:units', 'timesteps since original timestamp');
% netcdf.putAtt(ncid, tstpid, 'timestp:tstep_sec', tstep_sec);
% netcdf.putAtt(ncid, tstpid, 'timestp:time_origin', starttime);

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

qairid = netcdf.defVar(ncid, 'RH', 'double', [tid, zid, yid, xid]);
netcdf.putAtt(ncid, qairid, 'RH:long_name', 'Near surface relative humidity');
netcdf.putAtt(ncid, qairid, 'RH:units', '%');
netcdf.putAtt(ncid, qairid, 'RH:_FillValue', -9999.);

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

% parid = netcdf.defVar(ncid, 'PAR', 'double', [tid, zid, yid, xid]);
% netcdf.putAtt(ncid, parid, 'PAR:long_name', 'Incident or downward photosynthetically active radiation');
% netcdf.putAtt(ncid, parid, 'PAR:units', 'umol/m2/s');
% netcdf.putAtt(ncid, parid, 'PAR:_FillValue', -9999.);

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
% netcdf.putVar(ncid, timeid, 1800*(steps_mx - 1));
% netcdf.putVar(ncid, tstpid, steps_mx - 1);
netcdf.putVar(ncid, lonid, lon);
netcdf.putVar(ncid, latid, lat);
netcdf.putVar(ncid, tairid, tair_tot);
netcdf.putVar(ncid, qairid, rh_tot);
netcdf.putVar(ncid, windid, wind_tot);
netcdf.putVar(ncid, rainfid, rainf_tot);
netcdf.putVar(ncid, psurfid, psurf_tot);
netcdf.putVar(ncid, swdownid, swdown_tot);
netcdf.putVar(ncid, lwdownid, lwdown_tot);
netcdf.putVar(ncid, vpdid, vpd_tot);
% netcdf.putVar(ncid, parid, par_tot);
netcdf.putVar(ncid, co2airid, aco2_tot);


% Close the file
netcdf.close(ncid);
