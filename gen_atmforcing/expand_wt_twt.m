clear;clc

%% Input needed in this code
inputfile = {'US-Twt_WT_6year.nc'};
sitename = 'Mayberry wetland';
lat = [38.0498];
lon = [-121.7651];
tstep_sec = '1800';
site_timezone = '-8:00';
metfile = 'US-Twt_WT.nc';
height = 20;
cycle = 5;

%% Do not modify below
%% Open old NC file
wt_tot = [];

year_tot = [1981, 1982, 1983, 1984, 1985, ...
    1986, 1987, 1988, 1989, 1990, 1991, ...
    1992, 1993, 1994, 1995, 1996, 1997, ...
    1998, 1999, 2000, 2001, 2002, 2003, ...
    2004, 2005, 2006, 2007, 2008, 2009, ...
    2010, 2011, 2012, 2013, 2014, 2015];


%% Read in all fields
for i=1:length(inputfile)
    ncid = netcdf.open(inputfile{i}, 'NOWRITE');
    wtid = netcdf.inqVarID(ncid, 'WT');
    wt = netcdf.getVar(ncid, wtid);
    wt_tot = [wt_tot; squeeze(wt)];

    netcdf.close(ncid);
end

%% No need to process data...

%% Expand the data by recycling it.
wt_temp = wt_tot;

wt_tot = [wt_temp(17521:length(wt_temp)); wt_temp];
for i = 1:4
    wt_tot = [wt_tot; wt_temp];
end

steps_tot = length(wt_tot);


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

wtid = netcdf.defVar(ncid, 'WT', 'double', [xid, yid, tid]);
netcdf.putAtt(ncid, wtid, 'WT:long_name', 'Water Table Depth');
netcdf.putAtt(ncid, wtid, 'WT:units', 'm');
netcdf.putAtt(ncid, wtid, 'WT:_FillValue', -9999.);

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
netcdf.putVar(ncid, wtid, wt_tot);

% Close the file
netcdf.close(ncid);
