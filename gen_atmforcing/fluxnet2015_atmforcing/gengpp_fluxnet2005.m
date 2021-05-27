clear;clc

%% Generate the netcdf climate forcing for isam model input
%% Input needed in this code
%inputfile = {'/data/jain1/c/sshu3/SBGC/runs/n2o/fluxnet/AT-Neu/FLX_AT-Neu_FLUXNET2015_FULLSET_DD_2002-2012_1-4.csv'};
%sitename = 'Neustift';
%lat = [47.1167];
%lon = [11.3175];
%tstep_sec = '1800';
%site_timezone = '-8:00';
%gppfile = 'AT-Neu_GPP.txt';
%sefile = 'AT-Neu_SE.txt';
%height = 30;
%nyr = 11;
%year_tot = [2002, 2003, 2004, 2005, 2006, 2007, 2008, 2009, 2010, 2011, 2012];
%noleap = false;

%inputfile = {'/data/jain1/c/sshu3/SBGC/runs/n2o/fluxnet/AU-Fog/FLX_AU-Fog_FLUXNET2015_FULLSET_DD_2006-2008_1-4.csv'};
%sitename = 'Fogg Dam';
%lat = [-12.5452];
%lon = [131.3072];
%tstep_sec = '1800';
%site_timezone = '-5:00';
%gppfile = 'AU-Fog_GPP.txt';
%sefile = 'AU-Fog_SE.txt';
%height = 30;
%nyr = 3;
%year_tot = [2006, 2007, 2008];
%noleap = false;

%inputfile = {'/data/jain1/c/sshu3/SBGC/runs/n2o/fluxnet/AU-How/FLX_AU-How_FLUXNET2015_FULLSET_DD_2001-2014_1-4.csv'};
%sitename = 'Howard Springs';
%lat = [-12.4943];
%lon = [131.1523];
%tstep_sec = '1800';
%site_timezone = '-5:00';
%gppfile = 'AU-How_GPP.txt';
%sefile = 'AU-How_SE.txt';
%height = 30;
%nyr = 14;
%year_tot = [2001, 2002, 2003, 2004, 2005, 2006, 2007, 2008, 2009, 2010, 2011, 2012, 2013, 2014];
%noleap = false;

%inputfile = {'/data/jain1/c/sshu3/SBGC/runs/n2o/fluxnet/BE-Bra/FLX_BE-Bra_FLUXNET2015_FULLSET_DD_1996-2014_2-4.csv'};
%sitename = 'Brasschaat';
%lat = [51.3076];
%lon = [4.5198];
%tstep_sec = '1800';
%site_timezone = '-5:00';
%gppfile = 'BE-Bra_GPP.txt';
%sefile = 'BE-Bra_SE.txt';
%height = 30;
%nyr = 19;
%year_tot = [1996, 1997, 1998, 1999, 2000, 2001, 2002, 2003, 2004, 2005, 2006, 2007, 2008, 2009, 2010, 2011, 2012, 2013, 2014];
%noleap = false;

%inputfile = {'/data/jain1/c/sshu3/SBGC/runs/n2o/fluxnet/BR-Sa1/FLX_BR-Sa1_FLUXNET2015_FULLSET_DD_2002-2011_1-4.csv'};
%sitename = 'Santarem-Km67-Primary Forest';
%lat = [-2.8567];
%lon = [-54.9589];
%tstep_sec = '3600';
%site_timezone = '-7:00';
%gppfile = 'BR-Sa1_GPP.txt';
%sefile = 'BR-Sa1_SE.txt';
%height = 30;
%nyr = 10;
%year_tot = [2002, 2003, 2004, 2005, 2006, 2007, 2008, 2009, 2010, 2011];
%noleap = false;

%inputfile = {'/data/jain1/c/sshu3/SBGC/runs/n2o/fluxnet/BR-Sa3/FLX_BR-Sa3_FLUXNET2015_FULLSET_DD_2000-2004_1-4.csv'};
%sitename = 'Santarem-Km83-Logged Forest';
%lat = [-3.018];
%lon = [-54.9714];
%tstep_sec = '1800';
%site_timezone = '-7:00';
%gppfile = 'BR-Sa3_GPP.txt';
%sefile = 'BR-Sa3_SE.txt';
%height = 30;
%nyr = 5;
%year_tot = [2000, 2001, 2002, 2003, 2004];
%noleap = false;

%inputfile = {'/data/jain1/c/sshu3/SBGC/runs/n2o/fluxnet/CA-Oas/FLX_CA-Oas_FLUXNET2015_FULLSET_DD_1996-2010_1-4.csv'};
%sitename = 'Saskatchewan - Western Boreal, Mature Aspen';
%lat = [53.6289];
%lon = [-106.1978];
%tstep_sec = '1800';
%site_timezone = '-7:00';
%gppfile = 'CA-Oas_GPP.txt';
%sefile = 'CA-Oas_SE.txt';
%height = 30;
%nyr = 15;
%year_tot = [1996, 1997, 1998, 1999, 2000, 2001, 2002, 2003, 2004, 2005, 2006, 2007, 2008, 2009, 2010];
%noleap = false;

%inputfile = {'/data/jain1/c/sshu3/SBGC/runs/n2o/fluxnet/CA-Obs/FLX_CA-Obs_FLUXNET2015_FULLSET_DD_1997-2010_1-4.csv'};
%sitename = 'Saskatchewan - Western Boreal, Mature Black Spruce';
%lat = [53.9872];
%lon = [-105.1178];
%tstep_sec = '1800';
%site_timezone = '-7:00';
%gppfile = 'CA-Obs_GPP.txt';
%sefile = 'CA-Obs_SE.txt';
%height = 30;
%nyr = 14;
%year_tot = [1997, 1998, 1999, 2000, 2001, 2002, 2003, 2004, 2005, 2006, 2007, 2008, 2009, 2010];
%noleap = false;

%inputfile = {'/data/jain1/c/sshu3/SBGC/runs/n2o/fluxnet/CA-TP1/FLX_CA-TP1_FLUXNET2015_FULLSET_DD_2002-2014_2-4.csv'};
%sitename = 'Ontario - Turkey Point 2002 Plantation White Pine';
%lat = [42.6609];
%lon = [-80.5595];
%tstep_sec = '1800';
%site_timezone = '-7:00';
%gppfile = 'CA-TP1_GPP.txt';
%sefile = 'CA-TP1_SE.txt';
%height = 30;
%nyr = 13;
%year_tot = [2002, 2003, 2004, 2005, 2006, 2007, 2008, 2009, 2010, 2011, 2012, 2013, 2014];
%noleap = false;

%inputfile = {'/data/jain1/c/sshu3/SBGC/runs/n2o/fluxnet/CA-TP2/FLX_CA-TP2_FLUXNET2015_FULLSET_DD_2002-2007_1-4.csv'};
%sitename = 'Ontario - Turkey Point 1989 Plantation White Pine';
%lat = [42.7744];
%lon = [-80.4588];
%tstep_sec = '1800';
%site_timezone = '-7:00';
%gppfile = 'CA-TP2_GPP.txt';
%sefile = 'CA-TP2_SE.txt';
%height = 30;
%nyr = 6;
%year_tot = [2002, 2003, 2004, 2005, 2006, 2007];
%noleap = false;

%inputfile = {'/data/jain1/c/sshu3/SBGC/runs/n2o/fluxnet/CA-TP3/FLX_CA-TP3_FLUXNET2015_FULLSET_DD_2002-2014_1-4.csv'};
%sitename = 'Ontario - Turkey Point 1974 Plantation White Pine';
%lat = [42.7068];
%lon = [-80.3483];
%tstep_sec = '1800';
%site_timezone = '-8:00';
%gppfile = 'CA-TP3_GPP.txt';
%sefile = 'CA-TP3_SE.txt';
%height = 30;
%nyr = 13;
%year_tot = [2002, 2003, 2004, 2005, 2006, 2007, 2008, 2009, 2010, 2011, 2012, 2013, 2014];
%noleap = false;

%inputfile = {'/data/jain1/c/sshu3/SBGC/runs/n2o/fluxnet/CA-TP4/FLX_CA-TP4_FLUXNET2015_FULLSET_DD_2002-2014_1-4.csv'};
%sitename = 'Ontario - Turkey Point 1939 Plantation White Pine';
%lat = [42.7102];
%lon = [-80.3574];
%tstep_sec = '1800';
%site_timezone = '-7:00';
%gppfile = 'CA-TP4_GPP.txt';
%sefile = 'CA-TP4_SE.txt';
%height = 30;
%nyr = 13;
%year_tot = [2002, 2003, 2004, 2005, 2006, 2007, 2008, 2009, 2010, 2011, 2012, 2013, 2014];
%noleap = false;

%inputfile = {'/data/jain1/c/sshu3/SBGC/runs/n2o/fluxnet/CH-Cha/FLX_CH-Cha_FLUXNET2015_FULLSET_DD_2005-2014_2-4.csv'};
%sitename = 'Chamau';
%lat = [47.2102];
%lon = [8.4104];
%tstep_sec = '1800';
%site_timezone = '-8:00';
%gppfile = 'CH-Cha_GPP.txt';
%sefile = 'CH-Cha_SE.txt';
%height = 30;
%nyr = 10;
%year_tot = [2005, 2006, 2007, 2008, 2009, 2010, 2011, 2012, 2013, 2014];
%noleap = false;

%inputfile = {'/data/jain1/c/sshu3/SBGC/runs/n2o/fluxnet/CH-Dav/FLX_CH-Dav_FLUXNET2015_FULLSET_DD_1997-2014_1-4.csv'};
%sitename = 'Davos';
%lat = [46.8153];
%lon = [9.8559];
%tstep_sec = '1800';
%site_timezone = '-6:00';
%gppfile = 'CH-Dav_GPP.txt';
%sefile = 'CH-Dav_SE.txt';
%height = 30;
%nyr = 18;
%year_tot = [1997, 1998, 1999, 2000, 2001, 2002, 2003, 2004, 2005, 2006, 2007, 2008, 2009, 2010, 2011, 2012, 2013, 2014, 2015, 2016, 2017];
%noleap = false;

%inputfile = {'/data/jain1/c/sshu3/SBGC/runs/n2o/fluxnet/CH-Fru/FLX_CH-Fru_FLUXNET2015_FULLSET_DD_2005-2014_2-4.csv'};
%sitename = 'Früebüel';
%lat = [47.1158];
%lon = [8.5378];
%tstep_sec = '1800';
%site_timezone = '-6:00';
%gppfile = 'CH-Fru_GPP.txt';
%sefile = 'CH-Fru_SE.txt';
%height = 30;
%nyr = 10;
%year_tot = [2005, 2006, 2007, 2008, 2009, 2010, 2011, 2012, 2013, 2014];
%noleap = false;

%inputfile = {'/data/jain1/c/sshu3/SBGC/runs/n2o/fluxnet/CH-Lae/FLX_CH-Lae_FLUXNET2015_FULLSET_DD_2004-2014_1-4.csv'};
%sitename = 'Laegern';
%lat = [47.4783];
%lon = [8.3644];
%tstep_sec = '1800';
%site_timezone = '-6:00';
%gppfile = 'CH-Lae_GPP.txt';
%sefile = 'CH-Lae_SE.txt';
%height = 30;
%nyr = 11;
%year_tot = [2004, 2005, 2006, 2007, 2008, 2009, 2010, 2011, 2012, 2013, 2014];
%noleap = false;

%inputfile = {'/data/jain1/c/sshu3/SBGC/runs/n2o/fluxnet/DK-Sor/FLX_DK-Sor_FLUXNET2015_FULLSET_DD_1996-2014_2-4.csv'};
%sitename = 'Soroe';
%lat = [55.4859];
%lon = [11.6446];
%tstep_sec = '1800';
%site_timezone = '-6:00';
%gppfile = 'DK-Sor_GPP.txt';
%sefile = 'DK-Sor_SE.txt';
%height = 30;
%nyr = 19;
%year_tot = [1996, 1997, 1998, 1999, 2000, 2001, 2002, 2003, 2004, 2005, 2006, 2007, 2008, 2009, 2010, 2011, 2012, 2013, 2014];
%noleap = false;

inputfile = {'/data/jain1/c/sshu3/SBGC/runs/n2o/fluxnet/FI-Hyy/FLX_FI-Hyy_FLUXNET2015_FULLSET_DD_1996-2014_1-4.csv'};
sitename = 'Hyytiala';
lat = [61.8474];
lon = [24.2948];
tstep_sec = '1800';
site_timezone = '-6:00';
gppfile = 'FI-Hyy_GPP.txt';
sefile = 'FI-Hyy_SE.txt';
height = 30;
nyr = 19;
year_tot = [1996, 1997, 1998, 1999, 2000, 2001, 2002, 2003, 2004, 2005, 2006, 2007, 2008, 2009, 2010, 2011, 2012, 2013, 2014];
noleap = false;

%inputfile = {'/data/jain1/c/sshu3/SBGC/runs/n2o/fluxnet/FI-Jok/FLX_FI-Jok_FLUXNET2015_FULLSET_DD_2000-2003_1-4.csv'};
%sitename = 'Jokioinen';
%lat = [60.8986];
%lon = [23.5135];
%tstep_sec = '1800';
%site_timezone = '-6:00';
%gppfile = 'FI-Jok_GPP.txt';
%sefile = 'FI-Jok_SE.txt';
%height = 30;
%nyr = 4;
%year_tot = [2000, 2001, 2002, 2003];
%noleap = false;

%inputfile = {'/data/jain1/c/sshu3/SBGC/runs/n2o/fluxnet/FI-Let/FLX_FI-Let_FLUXNET2015_FULLSET_DD_2009-2012_1-4.csv'};
%sitename = 'Lettosuo';
%lat = [60.6418];
%lon = [23.9595];
%tstep_sec = '1800';
%site_timezone = '-6:00';
%gppfile = 'FI-Let_GPP.txt';
%sefile = 'FI-Let_SE.txt';
%height = 30;
%nyr = 4;
%year_tot = [2009, 2010, 2011, 2012];
%noleap = false;

%inputfile = {'/data/jain1/c/sshu3/SBGC/runs/n2o/fluxnet/FI-Lom/FLX_FI-Lom_FLUXNET2015_FULLSET_DD_2007-2009_1-4.csv'};
%sitename = 'Lompolojankka';
%lat = [67.9972];
%lon = [24.2092];
%tstep_sec = '1800';
%site_timezone = '-6:00';
%gppfile = 'FI-Lom_GPP.txt';
%sefile = 'FI-Lom_SE.txt';
%height = 30;
%nyr = 3;
%year_tot = [2007, 2008, 2009];
%noleap = false;

%inputfile = {'/data/jain1/c/sshu3/SBGC/runs/n2o/fluxnet/FR-Gri/FLX_FR-Gri_FLUXNET2015_FULLSET_DD_2004-2014_1-4.csv'};
%sitename = 'Grignon';
%lat = [48.8442];
%lon = [1.9519];
%tstep_sec = '1800';
%site_timezone = '-6:00';
%gppfile = 'FR-Gri_GPP.txt';
%sefile = 'FR-Gri_SE.txt';
%height = 30;
%nyr = 11;
%year_tot = [2004, 2005, 2006, 2007, 2008, 2009, 2010, 2011, 2012, 2013, 2014];
%noleap = false;

%inputfile = {'/data/jain1/c/sshu3/SBGC/runs/n2o/fluxnet/IT-BCi/FLX_IT-BCi_FLUXNET2015_FULLSET_DD_2004-2014_2-4.csv'};
%sitename = 'Borgo Cioffi';
%lat = [40.5238];
%lon = [14.9574];
%tstep_sec = '1800';
%site_timezone = '-6:00';
%gppfile = 'IT-BCi_GPP.txt';
%sefile = 'IT-BCi_SE.txt';
%height = 30;
%nyr = 11;
%year_tot = [2004, 2005, 2006, 2007, 2008, 2009, 2010, 2011, 2012, 2013, 2014];
%noleap = false;

%inputfile = {'/data/jain1/c/sshu3/SBGC/runs/n2o/fluxnet/IT-CA1/FLX_IT-CA1_FLUXNET2015_FULLSET_DD_2011-2014_2-4.csv'};
%sitename = 'Castel dAsso1';
%lat = [42.3804];
%lon = [12.0266];
%tstep_sec = '1800';
%site_timezone = '-6:00';
%gppfile = 'IT-CA1_GPP.txt';
%sefile = 'IT-CA1_SE.txt';
%height = 30;
%nyr = 4;
%year_tot = [2011, 2012, 2013, 2014];
%noleap = false;

%inputfile = {'/data/jain1/c/sshu3/SBGC/runs/n2o/fluxnet/IT-CA2/FLX_IT-CA2_FLUXNET2015_FULLSET_DD_2011-2014_2-4.csv'};
%sitename = 'Castel dAsso2';
%lat = [42.3772];
%lon = [12.0260];
%tstep_sec = '1800';
%site_timezone = '-6:00';
%gppfile = 'IT-CA2_GPP.txt';
%sefile = 'IT-CA2_SE.txt';
%height = 30;
%nyr = 4;
%year_tot = [2011, 2012, 2013, 2014];
%noleap = false;

%inputfile = {'/data/jain1/c/sshu3/SBGC/runs/n2o/fluxnet/IT-CA3/FLX_IT-CA3_FLUXNET2015_FULLSET_DD_2011-2014_2-4.csv'};
%sitename = 'Castel dAsso3';
%lat = [42.3800];
%lon = [12.0222];
%tstep_sec = '1800';
%site_timezone = '-6:00';
%gppfile = 'IT-CA3_GPP.txt';
%sefile = 'IT-CA3_SE.txt';
%height = 30;
%nyr = 4;
%year_tot = [2011, 2012, 2013, 2014];
%noleap = false;

%inputfile = {'/data/jain1/c/sshu3/SBGC/runs/n2o/fluxnet/IT-Ro1/FLX_IT-Ro1_FLUXNET2015_FULLSET_DD_2000-2008_1-4.csv'};
%sitename = 'Roccarespampani 1';
%lat = [42.4081];
%lon = [11.9300];
%tstep_sec = '1800';
%site_timezone = '-6:00';
%gppfile = 'IT-Ro1_GPP.txt';
%sefile = 'IT-Ro1_SE.txt';
%height = 30;
%nyr = 9;
%year_tot = [2000, 2001, 2002, 2003, 2004, 2005, 2006, 2007, 2008];
%noleap = false;

%inputfile = {'/data/jain1/c/sshu3/SBGC/runs/n2o/fluxnet/IT-Ro2/FLX_IT-Ro2_FLUXNET2015_FULLSET_DD_2002-2012_1-4.csv'};
%sitename = 'Roccarespampani 2';
%lat = [42.3903];
%lon = [11.9209];
%tstep_sec = '1800';
%site_timezone = '-6:00';
%gppfile = 'IT-Ro2_GPP.txt';
%sefile = 'IT-Ro2_SE.txt';
%height = 30;
%nyr = 11;
%year_tot = [2002, 2003, 2004, 2005, 2006, 2007, 2008, 2009, 2010, 2011, 2012];
%noleap = false;

%inputfile = {'/data/jain1/c/sshu3/SBGC/runs/n2o/fluxnet/NL-Hor/FLX_NL-Hor_FLUXNET2015_FULLSET_DD_2004-2011_1-4.csv'};
%sitename = 'Horstermeer';
%lat = [52.2404];
%lon = [5.0713];
%tstep_sec = '1800';
%site_timezone = '-6:00';
%gppfile = 'NL-Hor_GPP.txt';
%sefile = 'NL-Hor_SE.txt';
%height = 30;
%nyr = 8;
%year_tot = [2004, 2005, 2006, 2007, 2008, 2009, 2010, 2011];
%noleap = false;

%inputfile = {'/data/jain1/c/sshu3/SBGC/runs/n2o/fluxnet/RU-Fyo/FLX_RU-Fyo_FLUXNET2015_FULLSET_DD_1998-2014_2-4.csv'};
%sitename = 'Fyodorovskoye';
%lat = [56.4615];
%lon = [32.9221];
%tstep_sec = '1800';
%site_timezone = '-6:00';
%gppfile = 'RU-Fyo_GPP.txt';
%sefile = 'RU-Fyo_SE.txt';
%height = 30;
%nyr = 17;
%year_tot = [1998, 1999, 2000, 2001, 2002, 2003, 2004, 2005, 2006, 2007, 2008, 2009, 2010, 2011, 2012, 2013, 2014];
%noleap = false;

%inputfile = {'/data/jain1/c/sshu3/SBGC/runs/n2o/fluxnet/US-Ne1/FLX_US-Ne1_FLUXNET2015_FULLSET_DD_2001-2013_1-4.csv'};
%sitename = 'Mead - irrigated continuous maize site';
%lat = [41.1651];
%lon = [-96.4766];
%tstep_sec = '3600';
%site_timezone = '-6:00';
%gppfile = 'US-Ne1_GPP.txt';
%sefile = 'US-Ne1_SE.txt';
%height = 30;
%nyr = 13;
%year_tot = [2001, 2002, 2003, 2004, 2005, 2006, 2007, 2008, 2009, 2010, 2011, 2012, 2013];
%noleap = false;

%inputfile = {'/data/jain1/c/sshu3/SBGC/runs/n2o/fluxnet/US-Ne2/FLX_US-Ne2_FLUXNET2015_FULLSET_DD_2001-2013_1-4.csv'};
%sitename = 'Mead - irrigated maize-soybean rotation site';
%lat = [41.1649];
%lon = [-96.4701];
%tstep_sec = '3600';
%site_timezone = '-6:00';
%gppfile = 'US-Ne2_GPP.txt';
%sefile = 'US-Ne2_SE.txt';
%height = 30;
%nyr = 13;
%year_tot = [2001, 2002, 2003, 2004, 2005, 2006, 2007, 2008, 2009, 2010, 2011, 2012, 2013];
%noleap = false;

%inputfile = {'/data/jain1/c/sshu3/SBGC/runs/n2o/fluxnet/US-Ne3/FLX_US-Ne3_FLUXNET2015_FULLSET_DD_2001-2013_1-4.csv'};
%sitename = 'Mead - rainfed maize-soybean rotation site';
%lat = [41.1796];
%lon = [-96.4397];
%tstep_sec = '3600';
%site_timezone = '-6:00';
%gppfile = 'US-Ne3_GPP.txt';
%sefile = 'US-Ne3_SE.txt';
%height = 30;
%nyr = 13;
%year_tot = [2001, 2002, 2003, 2004, 2005, 2006, 2007, 2008, 2009, 2010, 2011, 2012, 2013];
%noleap = false;


%% We need to fill the data using ERA if possible.
%% Do not modify below
%% Open old NC file
%% Tair, rh, wind, q, press, prec, LW, SW
gpp_dt_tot = [];
gpp_nt_tot = [];
gpp_dt_se = [];
gpp_nt_se = [];
dtime_tot = [];
steps_tot = 0;
steps_mx = [];

% Loop over multiple files
% Read into the gap-filled atmospheric data
for i=1:length(inputfile)
    fulldata = readtable(inputfile{i});
    % Read in data
    gpp_dt_tot = fulldata.GPP_DT_VUT_MEAN;
    gpp_nt_tot = fulldata.GPP_NT_VUT_MEAN;
    gpp_dt_se = fulldata.GPP_DT_VUT_SE;
    gpp_nt_se = fulldata.GPP_NT_VUT_SE;
end

% Gap-filling is not necessary
% Write out obs
% Currently using day-time partitioning results
dlmwrite(gppfile,gpp_nt_tot);
dlmwrite(sefile,gpp_nt_se);

