clear;clc

%% Generate the netcdf climate forcing for isam model input
%% Input needed in this code
inputfile = {'Coastal_Sites\AMF_US-StJ_BASE-BADM_1-5\AMF_US-StJ_BASE_HH_1-5.csv'};
sitename = 'St Jones Reserve';
lat = [39.0882];
lon = [-75.4372];
tstep_sec = '3600';
site_timezone = '-5:00';
metfile = 'US-StJforcing.nc';
fname = 'US-StJ-CRUNCEP.nc';
height = 30;
nyr = 1;
year_tot = [2016];

%% For this site, SW and LW radiations are not available
%% We need to fill the data using CRUNCEP data.
%% Do not modify below
%% Open old NC file
%% Tair, rh, wind, q, press, prec, LW, SW
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
    fulldata = csvread(inputfile{i}, 4, 0);
    steps = length(fulldata);
    steps_mx = [steps_mx; (1:steps)'+steps_tot];
    steps_tot = steps_tot + steps;
    %swdown_tot = fulldata(:, 32);
    %lwdown_tot = fulldata(:, 34);
    tair_tot = fulldata(:, 25);
    vpd_tot = fulldata(:, 26);
    psurf_tot = fulldata(:, 22);
    rainf_tot = fulldata(:, 27);
    wind_tot = fulldata(:, 54);
    rh_tot = fulldata(:, 23);
    aco2_tot = fulldata(:, 10);   
end


%% Gap-filling following Ukkola et al., 2017
%% https://www.geosci-model-dev.net/10/3379/2017/gmd-10-3379-2017.pdf
% 1. Diagnose if value is missing or problematic
tair_tot(tair_tot<-100) = nan;
%swdown_tot(swdown_tot<-10) = nan;
%lwdown_tot(lwdown_tot<-10) = nan;
rh_tot(rh_tot<0) = nan;
wind_tot(wind_tot<0) = nan;
aco2_tot(aco2_tot<0) = nan;
aco2_tot(aco2_tot>700) = nan;
psurf_tot(psurf_tot<0) = nan;
vpd_tot(vpd_tot<0) = nan;
rainf_tot(rainf_tot<0) = nan;
%par_tot(par_tot<-10) = nan;

% 2. Examine small gaps (less and equal 4hrs, 8 steps) and perform linear
% interpolation, i.e., linfill method
for i=0:(nyr-1)
    % Tair
    loc = 2;
    while (loc >= 17513)
        if(isnan(tair_tot(i*17520+loc)) && ...
                ~isnan(nanmean(tair_tot((i*17520+loc):(i*17520+loc+7)))))
            % A window here (size = 8) to consider the linear interpolation
            p = tair_tot((i*17520+loc-1):(i*17520+loc+7));
            res = linfill(p);
            tair_tot((i*17520+loc-1):(i*17520+loc+7)) = res;
            loc = loc + 8;
        else
            loc = loc + 1;
        end
    end
    % Psurf
    loc = 2;
    while (loc >= 17513)
        if(isnan(psurf_tot(i*17520+loc)) && ...
                ~isnan(nanmean(psurf_tot((i*17520+loc):(i*17520+loc+7)))))
            % A window here (size = 8) to consider the linear interpolation
            p = psurf_tot((i*17520+loc-1):(i*17520+loc+7));
            res = linfill(p);
            psurf_tot((i*17520+loc-1):(i*17520+loc+7)) = res;
            loc = loc + 8;
        else
            loc = loc + 1;
        end
    end
    % Wind speed
    loc = 2;
    while (loc >= 17513)
        if(isnan(wind_tot(i*17520+loc)) && ...
                ~isnan(nanmean(wind_tot((i*17520+loc):(i*17520+loc+7)))))
            % A window here (size = 8) to consider the linear interpolation
            p = wind_tot((i*17520+loc-1):(i*17520+loc+7));
            res = linfill(p);
            wind_tot((i*17520+loc-1):(i*17520+loc+7)) = res;
            loc = loc + 8;
        else
            loc = loc + 1;
        end
    end
    % Relative humidity
    loc = 2;
    while (loc >= 17513)
        if(isnan(rh_tot(i*17520+loc)) && ...
                ~isnan(nanmean(rh_tot((i*17520+loc):(i*17520+loc+7)))))
            % A window here (size = 8) to consider the linear interpolation
            p = rh_tot((i*17520+loc-1):(i*17520+loc+7));
            res = linfill(p);
            rh_tot((i*17520+loc-1):(i*17520+loc+7)) = res;
            loc = loc + 8;
        else
            loc = loc + 1;
        end
    end
    % Vapor Pressure Deficit (VPD)
    loc = 2;
    while (loc >= 17513)
        if(isnan(vpd_tot(i*17520+loc)) && ...
                ~isnan(nanmean(vpd_tot((i*17520+loc):(i*17520+loc+7)))))
            % A window here (size = 8) to consider the linear interpolation
            p = vpd_tot((i*17520+loc-1):(i*17520+loc+7));
            res = linfill(p);
            vpd_tot((i*17520+loc-1):(i*17520+loc+7)) = res;
            loc = loc + 8;
        else
            loc = loc + 1;
        end
    end
    % Atmosphric CO2
    loc = 2;
    while (loc >= 17513)
        if(isnan(aco2_tot(i*17520+loc)) && ...
                ~isnan(nanmean(aco2_tot((i*17520+loc):(i*17520+loc+7)))))
            % A window here (size = 8) to consider the linear interpolation
            p = aco2_tot((i*17520+loc-1):(i*17520+loc+7));
            res = linfill(p);
            aco2_tot((i*17520+loc-1):(i*17520+loc+7)) = res;
            loc = loc + 8;
        else
            loc = loc + 1;
        end
    end
    % Rain Fall (rainf)
    loc = 2;
    while (loc >= 17513)
        if(isnan(rainf_tot(i*17520+loc)) && ...
                ~isnan(nanmean(rainf_tot((i*17520+loc):(i*17520+loc+7)))))
            % A window here (size = 8) to consider the linear interpolation
            p = rainf_tot((i*17520+loc-1):(i*17520+loc+7));
            res = linfill(p);
            rainf_tot((i*17520+loc-1):(i*17520+loc+7)) = res;
            loc = loc + 8;
        else
            loc = loc + 1;
        end
    end
end

% 4. Examine large gaps (longer than 10 days, > 480 steps) and use 
% the following regression models to fill the gap:
% 1) regress variable against incoming short-wave radiation, air 
% temperature and humidity (rh) if all 3 exist
% 2) regress variable against short-wave radiation if only SW is available
% Use SW = 5W/m2 as threshold for detecting day and night
% Here we first use CRUNCEP dataset to fill SW
% Then apply SW only to regress Tair and rh
% Finally use these three to regress all other variables except LWdown and
% Air pressure

% Open CRUNCEP netcdf file
ncid = netcdf.open(fname, 'NC_NOCLOBBER');
swid = netcdf.inqVarID(ncid, 'SWdown');
swdown_cruncep = netcdf.getVar(ncid, swid);
lwid = netcdf.inqVarID(ncid, 'LWdown');
lwdown_cruncep = netcdf.getVar(ncid, lwid);
tairid = netcdf.inqVarID(ncid, 'Tair');
tair_cruncep = netcdf.getVar(ncid, tairid);
tair_cruncep = tair_cruncep - 273.16;
rhid = netcdf.inqVarID(ncid, 'Qair');
rh_cruncep = netcdf.getVar(ncid, rhid);
psurfid = netcdf.inqVarID(ncid, 'PSurf');
psurf_cruncep = netcdf.getVar(ncid, psurfid);
netcdf.close(ncid);

% Transfer q to rh
for i = 1:(nyr*17520)
  [es, esdT, qs, qsdT] = qsadv(tair_cruncep(i),psurf_cruncep(i));
  % rh = 100.*(q/qs)
  rh_cruncep(i) = 100.*(rh_cruncep(i)/qs);
end

% Directly assign SW using CRUNCEP data
swdown_tot = swdown_cruncep;
% No need to double check swdown in this case

% Examine SWdown to determine if daytime or nighttime
daytime_idx = find(swdown_tot>=5);
nighttime_idx = find(swdown_tot<5);

% Regression model for tair_tot against swdown_tot
% Found a problem during night time, since swdown is cutted 
% below 0, so we have to think about it twice doing the regression
% solely depend on regression for night time.
% Here we borrow the CRU_NCEP dataset to fix the gap using the same 
% strategy as SWdown.
res = regfill_1(daytime_idx, swdown_tot, tair_tot);
tair_tot = res;
nt_f = nanmean(tair_tot(nighttime_idx)) / ...
    nanmean(tair_cruncep(nighttime_idx));
for i = 1:(nyr*17520)
    if(isnan(tair_tot(i)) && ismember(i, nighttime_idx))
        tair_tot(i) = tair_cruncep(i)*nt_f;
    end
end

% Regression model for rh against swdown_tot
% The same problem cause by cutted swdown for night time and we apply 
% the same solution
res = regfill_1(daytime_idx, swdown_tot, rh_tot);
rh_tot = res;
nt_f = nanmean(rh_tot(nighttime_idx)) / ...
    nanmean(rh_cruncep(nighttime_idx));
for i = 1:(nyr*17520)
    if(isnan(rh_tot(i)) && ismember(i, nighttime_idx))
        rh_tot(i) = rh_cruncep(i)*nt_f;
    end
end
rh_tot(rh_tot>100.) = 100.0;

% Regression model for wind, using swdown_tot, tair_tot and rh_tot
res = regfill_3(daytime_idx, swdown_tot, tair_tot, rh_tot, wind_tot);
wind_tot = res;
res = regfill_3(nighttime_idx, swdown_tot, tair_tot, rh_tot, wind_tot);
wind_tot = res;
wind_tot(wind_tot<0.) = 0.1;

% Regression model for aco2, using swdown_tot, tair_tot and rh_tot
res = regfill_3(daytime_idx, swdown_tot, tair_tot, rh_tot, aco2_tot);
aco2_tot = res;
res = regfill_3(nighttime_idx, swdown_tot, tair_tot, rh_tot, aco2_tot);
aco2_tot = res;

% 5. For both LWdown and Psurf will be calculated based on synthesis 
% method described in paper Supplemental material
% Atmospheric pressure
% Some constants
p0 = 101.325;   % sea level pressure, kPa
lap = 0.0065;    % lapse rate, K m-1
rgas = 287.04;   % Specific gas constant, kg-1 K-1
g0 = 9.80665;    % grav acce constant, m s-2
for i=1:(nyr*17520)
    if(isnan(psurf_tot(i)))
        psurf_tot(i) = p0*((tair_tot(i)+273.16)/(tair_tot(i)+273.16+lap*height))^(g0/rgas/lap);
    end
end
% LWdown, following Abramowitz et al. (2012)
lwdown_tot = zeros(nyr*17520,1);
for i=1:(nyr*17520)
    e_sat = 611.2*exp(17.67*((tair_tot(i))/(tair_tot(i)+273.16-29.65)));
    e_surf = e_sat*max(5.,rh_tot(i))/100.;
    lwdown_tot(i) = 2.648*(tair_tot(i)+273.16)+0.0346*e_surf-474;
end

%% Transfer units for land model
tair_tot = tair_tot + 273.16;  % Transfer to K
rainf_tot = rainf_tot / 1800;  % From mm to kg/m2/s
psurf_tot = psurf_tot * 1000;  % From kPa to Pa
swdown_tot(swdown_tot<0) = 0.;    % Force to positive values
lwdown_tot(lwdown_tot<0) = 0.;    % Force to positive values
par_tot(par_tot<0) = 0.;    % Force to positive values

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
createdate = strcat('File created from Ameriflux BASR products on ', date);
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
netcdf.putVar(ncid, timeid, 1800*(steps_mx - 1));
netcdf.putVar(ncid, tstpid, steps_mx - 1);
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

%% Necessary functions in this code
function yi = linfill(p)
    y = p(~isnan(p));
    x = find(~isnan(p));
    xi = linspace(1,9,9);
    yi = interp1q(x',y',xi');
end

function y = get_multyear_mean(s, nyr)
    y = zeros(48*365,1);
    for i=1:(48*365)
        p = [];
        for j=0:(nyr-1)
            p = [p, s(j*17520+i)]; 
        end
        y(i) = nanmean(p); 
    end
end

function [y, window] = copyfill(p, loc, multyear_mean)
    % Decide the window size      
    idx = find(~isnan(p));
    window = idx(1)-1;
    % Assign
    y = multyear_mean(loc:(loc+window-1));
end

function  y = regfill_1(idx, s, t)
    % Decide the window size      
    si = s(idx);
    ti = t(idx);
    idx_noval = find(~isnan(ti));
    s_reg = si(idx_noval);
    t_reg = ti(idx_noval);
    [r, a ,b] = regression(s_reg',t_reg');
    y = t;
    for i = 1:length(y)
        if(ismember(i, idx))
            if(isnan(y(i)))
                y(i) = a*s(i) + b;
            end
        end
    end
end

function  y = regfill_3(idx, s1, s2, s3, t)
    % Decide the window size      
    s1i = s1(idx);
    s2i = s2(idx);
    s3i = s3(idx);
    ti = t(idx);
    idx_noval = find(~isnan(ti));
    s1_reg = s1i(idx_noval);
    s2_reg = s2i(idx_noval);
    s3_reg = s3i(idx_noval);
    sa_reg = [ones(size(s1_reg)), s1_reg, s2_reg, s3_reg];
    t_reg = ti(idx_noval);
    b = regress(t_reg, sa_reg);
    y = t;
    for i = 1:length(y)
        if(ismember(i, idx))
            if(isnan(y(i)))
                y(i) = b(2)*s1(i) + b(3)*s2(i) + b(4)*s3(i) + b(1);
            end
        end
    end
end

function [es,esdT,qs,qsdT] = qsadv(T,p)
    %% This function is copied from CoLM. Polynomial fitting to qsat from Temperature and Pressure
    % for water vapor (temperature range 0C-100C)
    a = [6.11213476, 0.444007856, 0.143064234e-01, 0.264461437e-03, ...
        0.305903558e-05, 0.196237241e-07, 0.892344772e-10, ...
        -0.373208410e-12, 0.209339997e-15];

    % for derivative:water vapor
    b = [0.444017302, 0.286064092e-01, 0.794683137e-03, ...
        0.121211669e-04, 0.103354611e-06, 0.404125005e-09, ...
        -0.788037859e-12, -0.114596802e-13, 0.381294516e-16];

    % for ice (temperature range -75C-0C)
    c = [6.11123516, 0.503109514, 0.188369801e-01, ...
        0.420547422e-03, 0.614396778e-05, 0.602780717e-07, ...
        0.387940929e-09, 0.149436277e-11, 0.262655803e-14];

    % for derivative:ice
    d = [0.503277922, 0.377289173e-01, 0.126801703e-02, ...
        0.249468427e-04, 0.313703411e-06, 0.257180651e-08, ...
        0.133268878e-10, 0.394116744e-13, 0.498070196e-16];
    
    T_limit  = T;

    % For numerical Stability
    if (T_limit > 100.0) 
        T_limit=100.0;
    end
    if (T_limit < -75.0) 
        T_limit=-75.0;
    end

    td = T_limit;

    if (td >= 0.0)
        es   = a(1) + td*(a(2) + td*(a(3) + td*(a(4) + td*(a(5) ...
                  + td*(a(6) + td*(a(7) + td*(a(8) + td*a(9))))))));
        esdT = b(1) + td*(b(2) + td*(b(3) + td*(b(4) + td*(b(5) ...
                  + td*(b(6) + td*(b(7) + td*(b(8) + td*b(9))))))));
    else
        es   = c(1) + td*(c(2) + td*(c(3) + td*(c(4) + td*(c(5) ...
                  + td*(c(6) + td*(c(7) + td*(c(8) + td*c(9))))))));
        esdT = d(1) + td*(d(2) + td*(d(3) + td*(d(4) + td*(d(5) ...
                  + td*(d(6) + td*(d(7) + td*(d(8) + td*d(9))))))));
    end

    es    = es    * 100.;            % pa
    esdT  = esdT  * 100.;            % pa/K

    vp    = 1.0   / (p - 0.378*es);
    vp1   = 0.622 * vp;
    vp2   = vp1   * vp;

    qs    = es    * vp1;             % kg/kg
    qsdT  = esdT  * vp2 * p;         % 1 / K

end
