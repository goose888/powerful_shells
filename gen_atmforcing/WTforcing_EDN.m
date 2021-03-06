%% Author: Shu Shijie
% Date: Jul 19 2012
% Building water table forcing file

clear;clc

% Define metadata
mdata = cell(2, 11);
mdata{1, 1} = 'DTIME';
mdata{2, 1} = 'DTIME';
mdata{1, 2} = 'DOY';
mdata{2, 2} = 'DOY';
mdata{1, 3} = 'HRMIN';
mdata{2, 3} = 'HRMIN';
mdata{1, 4} = 'TA';
mdata{2, 4} = 'degC';
mdata{1, 5} = 'WD';
mdata{2, 5} = 'deg';
mdata{1, 6} = 'WS';
mdata{2, 6} = 'm/s';
mdata{1, 7} = 'PREC';
mdata{2, 7} = 'mm';
mdata{1, 8} = 'RH';
mdata{2, 8} = '%';
mdata{1, 9} = 'PRESS';
mdata{2, 9} = 'kPa';
mdata{1, 10} = 'Rg';
mdata{2, 10} = 'W/m2';
mdata{1, 11} = 'Rgl';
mdata{2, 11} = 'W/m2';

%% User should modify Site information and rawdata path before use
% Site information
fname = 'US-EDN_WT.nc';   % 2018
casename = 'Eden Landing Ecological Reserve';
edgen = 38.5;
edges = 38.0;
edgee = -121.75;
edgew = -122.25;
longitude = -122.0264;
latitude = 	38.2006;

%% Read in data values
rawdata = csvread('Coastal_Sites\AMF_US-EDN_BASE-BADM_1-5\AMF_US-EDN_BASE_HH_1-5.csv', 3, 0);
tstep_per_day = 48;
day = 365;
nyr = 1;
len = tstep_per_day * day * nyr;

%% assign the data to different array
year = rawdata(:, 1);
time = 1:length(rawdata(:,1));
wt = rawdata(:, 35);   % US-Srr
fch4 = rawdata(:, 7);
ch4 = rawdata(:, 5);

wt(wt>1000) = nan;
wt(wt<-1000) = nan;

%% Gap filling for water table depth
% 1. Lin's gap filling method
for i = 1:(nyr*17520)
    if (isnan(wt(i)))
        a1 = nan;
        a2 = nan;
        for c = i:(i-2)
            if (~isnan(wt(c)))
                a1=wt(c);
                break
            end
        end
        for g = (c+1):(c+2160)
            if (~isnan(wt(g)))
                a2=wt(g);
                break
            end
        end
        if (isnan(a2) || isnan(a1))
            wt(i)=wt(i);
        else
            delt=(a2-a1)/(g-c);
            wt(x)=wt(c)+delt;
        end
    end
end

% 2. No multiple year data available. So not doing the copyfill.

% 3. If not able to fill the gap, force it at the mean water table depth level
% This site has a relatively deeper water table depth
meanwt = nanmean(wt);
for i=1:(nyr*17520)
    if (isnan(wt(i)))
        wt(i) = meanwt;
    end
end
wt_filled = wt;

wt_filled = -wt_filled;
wt_filled(wt_filled<=0) = 0.001;

%% 3. QA
% wt_lin = wt_filled(1:2300);
% x = [1, 50, 70, 2000, 2100, 2200, 2250, 2300];
% y = [wt_lin(x(1)), wt_lin(x(2)), wt_lin(x(3)), wt_lin(x(4)), wt_lin(x(5)), ...
%     wt_lin(x(6)), wt_lin(x(7)), wt_lin(x(8))];
% xx = 1:2300;
% wt_new = interp1(x, y, xx);
% wt_filled(1:2300) = wt_new;

%% Write data into the nc file
ncid = netcdf.create(fname, 'NC_NOCLOBBER');
% Define dimensions
scalarid = netcdf.defDim(ncid, 'scalar', 1);
lonid = netcdf.defDim(ncid, 'lon', 1);
latid = netcdf.defDim(ncid, 'lat', 1);
timeid = netcdf.defDim(ncid, 'time', length(rawdata(:,1)));
% Define variables and corresponding attributes
edgewid = netcdf.defVar(ncid, 'EDGEW', 'float', scalarid);
netcdf.putAtt(ncid, edgewid, 'long_name', 'western edge in atmospheric data');
netcdf.putAtt(ncid, edgewid, 'units', 'degrees E');
netcdf.putAtt(ncid, edgewid, 'mode', 'time-invariant');
edgeeid = netcdf.defVar(ncid, 'EDGEE', 'float', scalarid);
netcdf.putAtt(ncid, edgeeid, 'long_name', 'eastern edge in atmospheric data');
netcdf.putAtt(ncid, edgeeid, 'units', 'degrees E');
netcdf.putAtt(ncid, edgeeid, 'mode', 'time-invariant');
edgesid = netcdf.defVar(ncid, 'EDGES', 'float', scalarid);
netcdf.putAtt(ncid, edgesid, 'long_name', 'southern edge in atmospheric data');
netcdf.putAtt(ncid, edgesid, 'units', 'degrees N');
netcdf.putAtt(ncid, edgesid, 'mode', 'time-invariant');
edgenid = netcdf.defVar(ncid, 'EDGEN', 'float', scalarid);
netcdf.putAtt(ncid, edgenid, 'long_name', 'northern edge in atmospheric data');
netcdf.putAtt(ncid, edgenid, 'units', 'degrees N');
netcdf.putAtt(ncid, edgenid, 'mode', 'time-invariant');
longxyid = netcdf.defVar(ncid, 'LONGXY', 'float', [lonid, latid]);
netcdf.putAtt(ncid, longxyid, 'long_name', 'longitude');
netcdf.putAtt(ncid, longxyid, 'units', 'degrees E');
netcdf.putAtt(ncid, longxyid, 'mode', 'time-invariant');
latixyid = netcdf.defVar(ncid, 'LATIXY', 'float', [lonid, latid]);
netcdf.putAtt(ncid, latixyid, 'long_name', 'latitude');
netcdf.putAtt(ncid, latixyid, 'units', 'degrees N');
netcdf.putAtt(ncid, latixyid, 'mode', 'time-invariant');
% Variables
wtid = netcdf.defVar(ncid, 'WT', 'float', [lonid, latid, timeid]);
netcdf.putAtt(ncid, wtid, 'long_name', 'Water table depth');
netcdf.putAtt(ncid, wtid, 'units', 'm');
netcdf.putAtt(ncid, wtid, 'mode', 'time-dependent');
ch4id = netcdf.defVar(ncid, 'CH4', 'float', [lonid, latid, timeid]);
netcdf.putAtt(ncid, ch4id, 'long_name', 'Soil methane concentration');
netcdf.putAtt(ncid, ch4id, 'units', 'nmol C mol-1');
netcdf.putAtt(ncid, ch4id, 'mode', 'time-dependent');
fch4id = netcdf.defVar(ncid, 'FCH4', 'float', [lonid, latid, timeid]);
netcdf.putAtt(ncid, fch4id, 'long_name', 'Methane fluxes');
netcdf.putAtt(ncid, fch4id, 'units', 'nmol C m-2 s-1');
netcdf.putAtt(ncid, fch4id, 'mode', 'time-dependent');

% Set Global Attributes
globalid = netcdf.getConstant('GLOBAL');
netcdf.putAtt(ncid, globalid, 'case', casename);
netcdf.putAtt(ncid, globalid, 'data_source', ...
    'Ameriflux US-Twt site, gap filled using multi-year mean and cubic spline interpolation method');
% End of the define mode of netcdf
netcdf.endDef(ncid);

% Store data into variables
netcdf.putVar(ncid, edgewid, edgew);
netcdf.putVar(ncid, edgeeid, edgee);
netcdf.putVar(ncid, edgesid, edges);
netcdf.putVar(ncid, edgenid, edgen);
netcdf.putVar(ncid, longxyid, longitude);
netcdf.putVar(ncid, latixyid, latitude);
netcdf.putVar(ncid, wtid, wt_filled);
netcdf.putVar(ncid, fch4id, fch4);
netcdf.putVar(ncid, ch4id, ch4);

% Close the netcdf file
netcdf.close(ncid);
