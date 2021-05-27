clear;clc

%% Generate the netcdf climate forcing for isam model input
%% Input needed in this code
%inputfile = {'/data/jain1/c/sshu3/SBGC/runs/n2o/fluxnet/AT-Neu/FLX_AT-Neu_FLUXNET2015_FULLSET_HH_2002-2012_1-4.csv'};
%sitename = 'Neustift';
%lat = [47.1167];
%lon = [11.3175];
%tstep_sec = '1800';
%site_timezone = '-8:00';
%metfile = 'AT-Neuforcing.nc';
%height = 30;
%nyr = 11;
%year_tot = [2002, 2003, 2004, 2005, 2006, 2007, 2008, 2009, 2010, 2011, 2012];
%noleap = false;

%inputfile = {'/data/jain1/c/sshu3/SBGC/runs/n2o/fluxnet/AU-Fog/FLX_AU-Fog_FLUXNET2015_FULLSET_HH_2006-2008_1-4.csv'};
%sitename = 'Fogg Dam';
%lat = [-12.5452];
%lon = [131.3072];
%tstep_sec = '1800';
%site_timezone = '-5:00';
%metfile = 'AU-Fogforcing.nc';
%height = 30;
%nyr = 3;
%year_tot = [2006, 2007, 2008];
%noleap = false;

%inputfile = {'/data/jain1/c/sshu3/SBGC/runs/n2o/fluxnet/AU-How/FLX_AU-How_FLUXNET2015_FULLSET_HH_2001-2014_1-4.csv'};
%sitename = 'Howard Springs';
%lat = [-12.4943];
%lon = [131.1523];
%tstep_sec = '1800';
%site_timezone = '-5:00';
%metfile = 'AU-Howforcing.nc';
%height = 30;
%nyr = 14;
%year_tot = [2001, 2002, 2003, 2004, 2005, 2006, 2007, 2008, 2009, 2010, 2011, 2012, 2013, 2014];
%noleap = false;

%inputfile = {'/data/jain1/c/sshu3/SBGC/runs/n2o/fluxnet/BE-Bra/FLX_BE-Bra_FLUXNET2015_FULLSET_HH_1996-2014_2-4.csv'};
%sitename = 'Brasschaat';
%lat = [51.3076];
%lon = [4.5198];
%tstep_sec = '1800';
%site_timezone = '-5:00';
%metfile = 'BE-Braforcing.nc';
%height = 30;
%nyr = 19;
%year_tot = [1996, 1997, 1998, 1999, 2000, 2001, 2002, 2003, 2004, 2005, 2006, 2007, 2008, 2009, 2010, 2011, 2012, 2013, 2014];
%noleap = false;

%inputfile = {'/data/jain1/c/sshu3/SBGC/runs/n2o/fluxnet/BR-Sa1/FLX_BR-Sa1_FLUXNET2015_FULLSET_HR_2002-2011_1-4.csv'};
%sitename = 'Santarem-Km67-Primary Forest';
%lat = [-2.8567];
%lon = [-54.9589];
%tstep_sec = '3600';
%site_timezone = '-7:00';
%metfile = 'BR-Sa1forcing.nc';
%height = 30;
%nyr = 10;
%year_tot = [2002, 2003, 2004, 2005, 2006, 2007, 2008, 2009, 2010, 2011];
%noleap = false;

%inputfile = {'/data/jain1/c/sshu3/SBGC/runs/n2o/fluxnet/BR-Sa3/FLX_BR-Sa3_FLUXNET2015_FULLSET_HH_2000-2004_1-4.csv'};
%sitename = 'Santarem-Km83-Logged Forest';
%lat = [-3.018];
%lon = [-54.9714];
%tstep_sec = '1800';
%site_timezone = '-7:00';
%metfile = 'BR-Sa3forcing.nc';
%height = 30;
%nyr = 5;
%year_tot = [2000, 2001, 2002, 2003, 2004];
%noleap = false;

%inputfile = {'/data/jain1/c/sshu3/SBGC/runs/n2o/fluxnet/CA-Oas/FLX_CA-Oas_FLUXNET2015_FULLSET_HH_1996-2010_1-4.csv'};
%sitename = 'Saskatchewan - Western Boreal, Mature Aspen';
%lat = [53.6289];
%lon = [-106.1978];
%tstep_sec = '1800';
%site_timezone = '-7:00';
%metfile = 'CA-Oasforcing.nc';
%height = 30;
%nyr = 15;
%year_tot = [1996, 1997, 1998, 1999, 2000, 2001, 2002, 2003, 2004, 2005, 2006, 2007, 2008, 2009, 2010];
%noleap = false;

%inputfile = {'/data/jain1/c/sshu3/SBGC/runs/n2o/fluxnet/CA-Obs/FLX_CA-Obs_FLUXNET2015_FULLSET_HH_1997-2010_1-4.csv'};
%sitename = 'Saskatchewan - Western Boreal, Mature Black Spruce';
%lat = [53.9872];
%lon = [-105.1178];
%tstep_sec = '1800';
%site_timezone = '-7:00';
%metfile = 'CA-Obsforcing.nc';
%height = 30;
%nyr = 14;
%year_tot = [1997, 1998, 1999, 2000, 2001, 2002, 2003, 2004, 2005, 2006, 2007, 2008, 2009, 2010];
%noleap = false;

%inputfile = {'/data/jain1/c/sshu3/SBGC/runs/n2o/fluxnet/CA-TP1/FLX_CA-TP1_FLUXNET2015_FULLSET_HH_2002-2014_2-4.csv'};
%sitename = 'Ontario - Turkey Point 2002 Plantation White Pine';
%lat = [42.6609];
%lon = [-80.5595];
%tstep_sec = '1800';
%site_timezone = '-7:00';
%metfile = 'CA-TP1forcing.nc';
%height = 30;
%nyr = 13;
%year_tot = [2002, 2003, 2004, 2005, 2006, 2007, 2008, 2009, 2010, 2011, 2012, 2013, 2014];
%noleap = false;

%inputfile = {'/data/jain1/c/sshu3/SBGC/runs/n2o/fluxnet/CA-TP2/FLX_CA-TP2_FLUXNET2015_FULLSET_HH_2002-2007_1-4.csv'};
%sitename = 'Ontario - Turkey Point 1989 Plantation White Pine';
%lat = [42.7744];
%lon = [-80.4588];
%tstep_sec = '1800';
%site_timezone = '-7:00';
%metfile = 'CA-TP2forcing.nc';
%height = 30;
%nyr = 6;
%year_tot = [2002, 2003, 2004, 2005, 2006, 2007];
%noleap = false;

%inputfile = {'/data/jain1/c/sshu3/SBGC/runs/n2o/fluxnet/CA-TP3/FLX_CA-TP3_FLUXNET2015_FULLSET_HH_2002-2014_1-4.csv'};
%sitename = 'Ontario - Turkey Point 1974 Plantation White Pine';
%lat = [42.7068];
%lon = [-80.3483];
%tstep_sec = '1800';
%site_timezone = '-8:00';
%metfile = 'CA-TP3forcing.nc';
%height = 30;
%nyr = 13;
%year_tot = [2002, 2003, 2004, 2005, 2006, 2007, 2008, 2009, 2010, 2011, 2012, 2013, 2014];
%noleap = false;

%inputfile = {'/data/jain1/c/sshu3/SBGC/runs/n2o/fluxnet/CA-TP4/FLX_CA-TP4_FLUXNET2015_FULLSET_HH_2002-2014_1-4.csv'};
%sitename = 'Ontario - Turkey Point 1939 Plantation White Pine';
%lat = [42.7102];
%lon = [-80.3574];
%tstep_sec = '1800';
%site_timezone = '-7:00';
%metfile = 'CA-TP4forcing.nc';
%height = 30;
%nyr = 13;
%year_tot = [2002, 2003, 2004, 2005, 2006, 2007, 2008, 2009, 2010, 2011, 2012, 2013, 2014];
%noleap = false;

%inputfile = {'/data/jain1/c/sshu3/SBGC/runs/n2o/fluxnet/CH-Cha/FLX_CH-Cha_FLUXNET2015_FULLSET_HH_2005-2014_2-4.csv'};
%sitename = 'Chamau';
%lat = [47.2102];
%lon = [8.4104];
%tstep_sec = '1800';
%site_timezone = '-8:00';
%metfile = 'CH-Chaforcing.nc';
%height = 30;
%nyr = 10;
%year_tot = [2005, 2006, 2007, 2008, 2009, 2010, 2011, 2012, 2013, 2014];
%noleap = false;

%inputfile = {'/data/jain1/c/sshu3/SBGC/runs/n2o/fluxnet/CH-Dav/FLX_CH-Dav_FLUXNET2015_FULLSET_HH_1997-2014_1-4.csv'};
%sitename = 'Davos';
%lat = [46.8153];
%lon = [9.8559];
%tstep_sec = '1800';
%site_timezone = '-6:00';
%metfile = 'CH-Davforcing.nc';
%height = 30;
%nyr = 18;
%year_tot = [1997, 1998, 1999, 2000, 2001, 2002, 2003, 2004, 2005, 2006, 2007, 2008, 2009, 2010, 2011, 2012, 2013, 2014, 2015, 2016, 2017];
%noleap = false;

%inputfile = {'/data/jain1/c/sshu3/SBGC/runs/n2o/fluxnet/CH-Fru/FLX_CH-Fru_FLUXNET2015_FULLSET_HH_2005-2014_2-4.csv'};
%sitename = 'Früebüel';
%lat = [47.1158];
%lon = [8.5378];
%tstep_sec = '1800';
%site_timezone = '-6:00';
%metfile = 'CH-Fruforcing.nc';
%height = 30;
%nyr = 10;
%year_tot = [2005, 2006, 2007, 2008, 2009, 2010, 2011, 2012, 2013, 2014];
%noleap = false;

%inputfile = {'/data/jain1/c/sshu3/SBGC/runs/n2o/fluxnet/CH-Lae/FLX_CH-Lae_FLUXNET2015_FULLSET_HH_2004-2014_1-4.csv'};
%sitename = 'Laegern';
%lat = [47.4783];
%lon = [8.3644];
%tstep_sec = '1800';
%site_timezone = '-6:00';
%metfile = 'CH-Laeforcing.nc';
%height = 30;
%nyr = 11;
%year_tot = [2004, 2005, 2006, 2007, 2008, 2009, 2010, 2011, 2012, 2013, 2014];
%noleap = false;

%inputfile = {'/data/jain1/c/sshu3/SBGC/runs/n2o/fluxnet/DK-Sor/FLX_DK-Sor_FLUXNET2015_FULLSET_HH_1996-2014_2-4.csv'};
%sitename = 'Soroe';
%lat = [55.4859];
%lon = [11.6446];
%tstep_sec = '1800';
%site_timezone = '-6:00';
%metfile = 'DK-Sorforcing.nc';
%height = 30;
%nyr = 19;
%year_tot = [1996, 1997, 1998, 1999, 2000, 2001, 2002, 2003, 2004, 2005, 2006, 2007, 2008, 2009, 2010, 2011, 2012, 2013, 2014];
%noleap = false;

%inputfile = {'/data/jain1/c/sshu3/SBGC/runs/n2o/fluxnet/FI-Hyy/FLX_FI-Hyy_FLUXNET2015_FULLSET_HH_1996-2014_1-4.csv'};
%sitename = 'Hyytiala';
%lat = [61.8474];
%lon = [24.2948];
%tstep_sec = '1800';
%site_timezone = '-6:00';
%metfile = 'FI-Hyyforcing.nc';
%height = 30;
%nyr = 19;
%year_tot = [1996, 1997, 1998, 1999, 2000, 2001, 2002, 2003, 2004, 2005, 2006, 2007, 2008, 2009, 2010, 2011, 2012, 2013, 2014];
%noleap = false;

%inputfile = {'/data/jain1/c/sshu3/SBGC/runs/n2o/fluxnet/FI-Jok/FLX_FI-Jok_FLUXNET2015_FULLSET_HH_2000-2003_1-4.csv'};
%sitename = 'Jokioinen';
%lat = [60.8986];
%lon = [23.5135];
%tstep_sec = '1800';
%site_timezone = '-6:00';
%metfile = 'FI-Jokforcing.nc';
%height = 30;
%nyr = 4;
%year_tot = [2000, 2001, 2002, 2003];
%noleap = false;

%inputfile = {'/data/jain1/c/sshu3/SBGC/runs/n2o/fluxnet/FI-Let/FLX_FI-Let_FLUXNET2015_FULLSET_HH_2009-2012_1-4.csv'};
%sitename = 'Lettosuo';
%lat = [60.6418];
%lon = [23.9595];
%tstep_sec = '1800';
%site_timezone = '-6:00';
%metfile = 'FI-Letforcing.nc';
%height = 30;
%nyr = 4;
%year_tot = [2009, 2010, 2011, 2012];
%noleap = false;

%inputfile = {'/data/jain1/c/sshu3/SBGC/runs/n2o/fluxnet/FI-Lom/FLX_FI-Lom_FLUXNET2015_FULLSET_HH_2007-2009_1-4.csv'};
%sitename = 'Lompolojankka';
%lat = [67.9972];
%lon = [24.2092];
%tstep_sec = '1800';
%site_timezone = '-6:00';
%metfile = 'FI-Lomforcing.nc';
%height = 30;
%nyr = 3;
%year_tot = [2007, 2008, 2009];
%noleap = false;

%inputfile = {'/data/jain1/c/sshu3/SBGC/runs/n2o/fluxnet/FR-Gri/FLX_FR-Gri_FLUXNET2015_FULLSET_HH_2004-2014_1-4.csv'};
%sitename = 'Grignon';
%lat = [48.8442];
%lon = [1.9519];
%tstep_sec = '1800';
%site_timezone = '-6:00';
%metfile = 'FR-Griforcing.nc';
%height = 30;
%nyr = 11;
%year_tot = [2004, 2005, 2006, 2007, 2008, 2009, 2010, 2011, 2012, 2013, 2014];
%noleap = false;

%inputfile = {'/data/jain1/c/sshu3/SBGC/runs/n2o/fluxnet/IT-BCi/FLX_IT-BCi_FLUXNET2015_FULLSET_HH_2004-2014_2-4.csv'};
%sitename = 'Borgo Cioffi';
%lat = [40.5238];
%lon = [14.9574];
%tstep_sec = '1800';
%site_timezone = '-6:00';
%metfile = 'IT-BCiforcing.nc';
%height = 30;
%nyr = 11;
%year_tot = [2004, 2005, 2006, 2007, 2008, 2009, 2010, 2011, 2012, 2013, 2014];
%noleap = false;

%inputfile = {'/data/jain1/c/sshu3/SBGC/runs/n2o/fluxnet/IT-CA1/FLX_IT-CA1_FLUXNET2015_FULLSET_HH_2011-2014_2-4.csv'};
%sitename = 'Castel dAsso1';
%lat = [42.3804];
%lon = [12.0266];
%tstep_sec = '1800';
%site_timezone = '-6:00';
%metfile = 'IT-CA1forcing.nc';
%height = 30;
%nyr = 4;
%year_tot = [2011, 2012, 2013, 2014];
%noleap = false;

%inputfile = {'/data/jain1/c/sshu3/SBGC/runs/n2o/fluxnet/IT-CA2/FLX_IT-CA2_FLUXNET2015_FULLSET_HH_2011-2014_2-4.csv'};
%sitename = 'Castel dAsso2';
%lat = [42.3772];
%lon = [12.0260];
%tstep_sec = '1800';
%site_timezone = '-6:00';
%metfile = 'IT-CA2forcing.nc';
%height = 30;
%nyr = 4;
%year_tot = [2011, 2012, 2013, 2014];
%noleap = false;

%inputfile = {'/data/jain1/c/sshu3/SBGC/runs/n2o/fluxnet/IT-CA3/FLX_IT-CA3_FLUXNET2015_FULLSET_HH_2011-2014_2-4.csv'};
%sitename = 'Castel dAsso3';
%lat = [42.3800];
%lon = [12.0222];
%tstep_sec = '1800';
%site_timezone = '-6:00';
%metfile = 'IT-CA3forcing.nc';
%height = 30;
%nyr = 4;
%year_tot = [2011, 2012, 2013, 2014];
%noleap = false;

%inputfile = {'/data/jain1/c/sshu3/SBGC/runs/n2o/fluxnet/IT-Ro1/FLX_IT-Ro1_FLUXNET2015_FULLSET_HH_2000-2008_1-4.csv'};
%sitename = 'Roccarespampani 1';
%lat = [42.4081];
%lon = [11.9300];
%tstep_sec = '1800';
%site_timezone = '-6:00';
%metfile = 'IT-Ro1forcing.nc';
%height = 30;
%nyr = 9;
%year_tot = [2000, 2001, 2002, 2003, 2004, 2005, 2006, 2007, 2008];
%noleap = false;

%inputfile = {'/data/jain1/c/sshu3/SBGC/runs/n2o/fluxnet/IT-Ro2/FLX_IT-Ro2_FLUXNET2015_FULLSET_HH_2002-2012_1-4.csv'};
%sitename = 'Roccarespampani 2';
%lat = [42.3903];
%lon = [11.9209];
%tstep_sec = '1800';
%site_timezone = '-6:00';
%metfile = 'IT-Ro2forcing.nc';
%height = 30;
%nyr = 11;
%year_tot = [2002, 2003, 2004, 2005, 2006, 2007, 2008, 2009, 2010, 2011, 2012];
%noleap = false;

%inputfile = {'/data/jain1/c/sshu3/SBGC/runs/n2o/fluxnet/NL-Hor/FLX_NL-Hor_FLUXNET2015_FULLSET_HH_2004-2011_1-4.csv'};
%sitename = 'Horstermeer';
%lat = [52.2404];
%lon = [5.0713];
%tstep_sec = '1800';
%site_timezone = '-6:00';
%metfile = 'NL-Horforcing.nc';
%height = 30;
%nyr = 8;
%year_tot = [2004, 2005, 2006, 2007, 2008, 2009, 2010, 2011];
%noleap = false;

%inputfile = {'/data/jain1/c/sshu3/SBGC/runs/n2o/fluxnet/RU-Fyo/FLX_RU-Fyo_FLUXNET2015_FULLSET_HH_1998-2014_2-4.csv'};
%sitename = 'Fyodorovskoye';
%lat = [56.4615];
%lon = [32.9221];
%tstep_sec = '1800';
%site_timezone = '-6:00';
%metfile = 'RU-Fyoforcing.nc';
%height = 30;
%nyr = 17;
%year_tot = [1998, 1999, 2000, 2001, 2002, 2003, 2004, 2005, 2006, 2007, 2008, 2009, 2010, 2011, 2012, 2013, 2014];
%noleap = false;

%inputfile = {'/data/jain1/c/sshu3/SBGC/runs/n2o/fluxnet/US-Ne1/FLX_US-Ne1_FLUXNET2015_FULLSET_HR_2001-2013_1-4.csv'};
%sitename = 'Mead - irrigated continuous maize site';
%lat = [41.1651];
%lon = [-96.4766];
%tstep_sec = '3600';
%site_timezone = '-6:00';
%metfile = 'US-Ne1forcing.nc';
%height = 30;
%nyr = 13;
%year_tot = [2001, 2002, 2003, 2004, 2005, 2006, 2007, 2008, 2009, 2010, 2011, 2012, 2013];
%noleap = false;

%inputfile = {'/data/jain1/c/sshu3/SBGC/runs/n2o/fluxnet/US-Ne2/FLX_US-Ne2_FLUXNET2015_FULLSET_HR_2001-2013_1-4.csv'};
%sitename = 'Mead - irrigated maize-soybean rotation site'
%lat = [41.1649];
%lon = [-96.4701];
%tstep_sec = '3600';
%site_timezone = '-6:00';
%metfile = 'US-Ne2forcing.nc';
%height = 30;
%nyr = 13;
%year_tot = [2001, 2002, 2003, 2004, 2005, 2006, 2007, 2008, 2009, 2010, 2011, 2012, 2013];
%noleap = false;

%inputfile = {'/data/jain1/c/sshu3/SBGC/runs/n2o/fluxnet/US-Ne3/FLX_US-Ne3_FLUXNET2015_FULLSET_HR_2001-2013_1-4.csv'};
%sitename = 'Mead - rainfed maize-soybean rotation site'
%lat = [41.1796];
%lon = [-96.4397];
%tstep_sec = '3600';
%site_timezone = '-6:00';
%metfile = 'US-Ne3forcing.nc';
%height = 30;
%nyr = 13;
%year_tot = [2001, 2002, 2003, 2004, 2005, 2006, 2007, 2008, 2009, 2010, 2011, 2012, 2013];
%noleap = false;


%% We need to fill the data using ERA if possible.
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

% Loop over multiple files
% Read into the gap-filled atmospheric data
for i=1:length(inputfile)
    fulldata = readtable(inputfile{i});
    steps = length(fulldata.TIMESTAMP_START);
    % Record steps 
    steps_mx = [steps_mx; (1:steps)'+steps_tot];
    steps_tot = steps_tot + steps;
    % Read in data
    tair_tot = fulldata.TA_F;
    vpd_tot = fulldata.VPD_F;
    psurf_tot = fulldata.PA_F;
    rainf_tot = fulldata.P_F;
    wind_tot = fulldata.WS_F;
    rh_tot = fulldata.RH;    % RH is not gap-filled...
    swdown_tot = fulldata.SW_IN_F;
    lwdown_tot = fulldata.LW_IN_F;
    %par_tot = fulldata.PPFD_IN;
    aco2_tot = fulldata.CO2_F_MDS;
end

% Here no gap-filling is required since the fluxnet2015 data are already gap-filled by several different approaches.
rh_tot(rh_tot<0) = nan;

% 1. Interpolation
for i=0:(nyr-1)
    % Relative humidity
    loc = 2;
    while (loc >= 17513)
        if(isnan(rh_tot(i*17520+loc)) && ...
                ~isnan(nanmean(rh_tot((i*17520+loc):(i*17520+loc+8)))))
            % A window here (size = 8) to consider the linear interpolation
            p = rh_tot((i*17520+loc-1):(i*17520+loc+7));
            res = linfill(p);
            rh_tot((i*17520+loc-1):(i*17520+loc+7)) = res;
            loc = loc + 8;
        else
            loc = loc + 1;
        end
    end
end

% 2. Multiple-year mean gap-filling
multyear_mean_rh = get_multyear_mean(rh_tot, nyr);
for i=0:(nyr-1)
    % Relative Humidity
    loc = 1;
    while (loc >= 17513)
        if(isnan(rh_tot(i*17520+loc)) && ...
                ~isnan(nanmean(rh_tot((i*17520+loc):(i*17520+loc+480)))))
            p = rh_tot((i*17520+loc):(i*17520+loc+480));
            [res, window] = copyfill(p, loc, multyear_mean_rh);
            rh_tot((i*17520+loc):(i*17520+loc+window-1)) = res;
            loc = loc + (window - 1);
        else
            loc = loc + 1;
        end
    end
end

% 3. Regression
daytime_idx = find(swdown_tot>=5);
%nighttime_idx = find(swdown_tot<5);
res = regfill_1(daytime_idx, swdown_tot, rh_tot);
rh_tot = res;
%nt_f = nanmean(rh_tot(nighttime_idx)) / ...
%    nanmean(rh_cruncep(nighttime_idx));
%for i = 1:(nyr*17520)
%    if(isnan(rh_tot(i)) && ismember(i, nighttime_idx))
%        rh_tot(i) = rh_cruncep(i)*nt_f;
%    end
%end
rh_tot(rh_tot>100.) = 100.0;

% Transfer units to coordinate to the TEM.
tair_tot = tair_tot + 273.16;  % Transfer to K
rainf_tot = rainf_tot / 1800;  % From mm to kg/m2/s
psurf_tot = psurf_tot * 1000;  % From kPa to Pa
swdown_tot(swdown_tot<0) = 0.;    % Force to positive values
lwdown_tot(lwdown_tot<0) = 0.;    % Force to positive values
%par_tot(par_tot<0) = 0.;    % Force to positive values
rh_tot(isnan(rh_tot)) = 100.;     % Force to an acceptable value for nighttime
aco2_tot(aco2_tot<-1000.) = 390.;     % Force to an acceptable value for Missing CO2

%% No leap year need to remove the data of the additional days 
if(noleap)
   for i=1:nyr
      shift_day = 0;
      if (mod(year_tot(i), 4) == 0)
         % Mark the extra day from Feb
         pt_1 = (i-1)*17520 + shift_day*48 + 59*48 + 1;
         pt_2 = (i-1)*17520 + shift_day*48 + 60*48;
         tair_tot(pt_1:pt_2) = -9999.;
         vpd_tot(pt_1:pt_2) = -9999.;
         psurf_tot(pt_1:pt_2) = -9999.;
         rainf_tot(pt_1:pt_2) = -9999.;
         wind_tot(pt_1:pt_2) = -9999.;
         rh_tot(pt_1:pt_2) = -9999.;
         swdown_tot(pt_1:pt_2) = -9999.;
         lwdown_tot(pt_1:pt_2) = -9999.;
         %par_tot(pt_1:pt_2) = -9999.;
         aco2_tot(pt_1:pt_2) = -9999.;
         shift_day = shift_day+1;
      end
   end
   % Remove the marked data
   tair_tot = tair_tot(tair_tot>-1000.);
   vpd_tot = vpd_tot(vpd_tot>-1000.);
   psurf_tot = psurf_tot(psurf_tot>-1000.);
   rainf_tot = rainf_tot(rainf_tot>-1000.);
   wind_tot = wind_tot(wind_tot>-1000.);
   rh_tot = rh_tot(rh_tot>-1000.);
   swdown_tot = swdown_tot(swdown_tot>-1000.);
   lwdown_tot = lwdown_tot(lwdown_tot>-1000.);
   %par_tot = par_tot(par_tot>-1000.);
   aco2_tot = aco2_tot(aco2_tot>-1000.);
   % Update steps
   steps_tot = size(tair_tot,1);
   steps_mx = steps_mx(steps_mx<=steps_tot);
end

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
netcdf.putAtt(ncid, vpdid, 'VPD:units', 'hPa');
netcdf.putAtt(ncid, vpdid, 'VPD:_FillValue', -9999.);

%parid = netcdf.defVar(ncid, 'PPFD', 'double', [tid, zid, yid, xid]);
%netcdf.putAtt(ncid, parid, 'PPFD:long_name', 'Incoming photosynthetic photon flux density');
%netcdf.putAtt(ncid, parid, 'PPFD:units', 'umol/m2/s');
%netcdf.putAtt(ncid, parid, 'PPFD:_FillValue', -9999.);

co2airid = netcdf.defVar(ncid, 'CO2air', 'double', [tid, zid, yid, xid]);
netcdf.putAtt(ncid, co2airid, 'CO2air:long_name', 'Near surface CO2 concentration');
netcdf.putAtt(ncid, co2airid, 'CO2air:flask_site', sitename);
netcdf.putAtt(ncid, co2airid, 'CO2air:units', 'ppmv');
netcdf.putAtt(ncid, co2airid, 'CO2air:_FillValue', -9999.);

% Global attributes
gid = netcdf.getConstant('Global');
netcdf.putAtt(ncid, gid, 'institution', 'University of Illinois at Urbana Champaign');
if(noleap)
   netcdf.putAtt(ncid, gid, 'calendar', 'Noleap');
end
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
%netcdf.putVar(ncid, parid, par_tot);
netcdf.putVar(ncid, co2airid, aco2_tot);

% Close the file
netcdf.close(ncid);

