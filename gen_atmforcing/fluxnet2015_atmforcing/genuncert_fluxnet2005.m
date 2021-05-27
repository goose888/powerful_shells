clear;clc

%% Generate the netcdf climate forcing for isam model input
%% Input needed in this code
%inputfile = {'/data/jain1/c/sshu3/SBGC/runs/n2o/fluxnet/AT-Neu/FLX_AT-Neu_FLUXNET2015_FULLSET_DD_2002-2012_1-4.csv'};
%sitename = 'Neustift';
%lat = [47.1167];
%lon = [11.3175];
%tstep_sec = '1800';
%site_timezone = '-8:00';
%uncertfile = 'AT-Neu_UC.txt';
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
%uncertfile = 'AU-Fog_UC.txt';
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
%uncertfile = 'AU-How_UC.txt';
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
%uncertfile = 'BE-Bra_UC.txt';
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
%uncertfile = 'BR-Sa1_UC.txt';
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
%uncertfile = 'BR-Sa3_UC.txt';
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
%uncertfile = 'CA-Oas_UC.txt';
%height = 30;
%nyr = 15;
%year_tot = [1996, 1997, 1998, 1999, 2000, 2001, 2002, 2003, 2004, 2005, 2006, 2007, 2008, 2009, 2010];
%noleap = false;

inputfile = {'/data/jain1/c/sshu3/SBGC/runs/n2o/fluxnet/CA-Obs/FLX_CA-Obs_FLUXNET2015_FULLSET_DD_1997-2010_1-4.csv'};
sitename = 'Saskatchewan - Western Boreal, Mature Black Spruce';
lat = [53.9872];
lon = [-105.1178];
tstep_sec = '1800';
site_timezone = '-7:00';
uncertfile = 'CA-Obs_UC.txt';
height = 30;
nyr = 14;
year_tot = [1997, 1998, 1999, 2000, 2001, 2002, 2003, 2004, 2005, 2006, 2007, 2008, 2009, 2010];
noleap = false;

%inputfile = {'/data/jain1/c/sshu3/SBGC/runs/n2o/fluxnet/CA-TP1/FLX_CA-TP1_FLUXNET2015_FULLSET_DD_2002-2014_2-4.csv'};
%sitename = 'Ontario - Turkey Point 2002 Plantation White Pine';
%lat = [42.6609];
%lon = [-80.5595];
%tstep_sec = '1800';
%site_timezone = '-7:00';
%uncertfile = 'CA-TP1_UC.txt';
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
%uncertfile = 'CA-TP2_UC.txt';
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
%uncertfile = 'CA-TP3_UC.txt';
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
%uncertfile = 'CA-TP4_UC.txt';
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
%uncertfile = 'CH-Cha_UC.txt';
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
%uncertfile = 'CH-Dav_UC.txt';
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
%uncertfile = 'CH-Fru_UC.txt';
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
%uncertfile = 'CH-Lae_UC.txt';
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
%uncertfile = 'DK-Sor_UC.txt';
%height = 30;
%nyr = 19;
%year_tot = [1996, 1997, 1998, 1999, 2000, 2001, 2002, 2003, 2004, 2005, 2006, 2007, 2008, 2009, 2010, 2011, 2012, 2013, 2014];
%noleap = false;

%inputfile = {'/data/jain1/c/sshu3/SBGC/runs/n2o/fluxnet/FI-Hyy/FLX_FI-Hyy_FLUXNET2015_FULLSET_DD_1996-2014_1-4.csv'};
%sitename = 'Hyytiala';
%lat = [61.8474];
%lon = [24.2948];
%tstep_sec = '1800';
%site_timezone = '-6:00';
%uncertfile = 'FI-Hyy_UC.txt';
%height = 30;
%nyr = 19;
%year_tot = [1996, 1997, 1998, 1999, 2000, 2001, 2002, 2003, 2004, 2005, 2006, 2007, 2008, 2009, 2010, 2011, 2012, 2013, 2014];
%noleap = false;

%inputfile = {'/data/jain1/c/sshu3/SBGC/runs/n2o/fluxnet/FI-Jok/FLX_FI-Jok_FLUXNET2015_FULLSET_DD_2000-2003_1-4.csv'};
%sitename = 'Jokioinen';
%lat = [60.8986];
%lon = [23.5135];
%tstep_sec = '1800';
%site_timezone = '-6:00';
%uncertfile = 'FI-Jok_UC.txt';
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
%uncertfile = 'FI-Let_UC.txt';
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
%uncertfile = 'FI-Lom_UC.txt';
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
%uncertfile = 'FR-Gri_UC.txt';
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
%uncertfile = 'IT-BCi_UC.txt';
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
%uncertfile = 'IT-CA1_UC.txt';
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
%uncertfile = 'IT-CA2_UC.txt';
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
%uncertfile = 'IT-CA3_UC.txt';
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
%uncertfile = 'IT-Ro1_UC.txt';
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
%uncertfile = 'IT-Ro2_UC.txt';
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
%uncertfile = 'NL-Hor_UC.txt';
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
%uncertfile = 'RU-Fyo_UC.txt';
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
%uncertfile = 'US-Ne1_UC.txt';
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
%uncertfile = 'US-Ne2_UC.txt';
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
%uncertfile = 'US-Ne3_UC.txt';
%height = 30;
%nyr = 13;
%year_tot = [2001, 2002, 2003, 2004, 2005, 2006, 2007, 2008, 2009, 2010, 2011, 2012, 2013];
%noleap = false;

%% Do not modify below
%% Open old NC file
%% Total uncertainty is aggregated from NEE random uncertainty, Ustar filtering uncertainty, gap-filling method uncertainty
%% and partitioning uncertainty, following Schaefer et al., 2012
%% (1) Random + ustar filtering uncertainty can be found from the data product
%% (2) GPP gap filling uncertainty was the fraction of filled GPP values for each day times the standard deviation of
%% multiple algorithms, but here we ignore it based on Barman et al., 2014.
%% (3) Partitioning uncertainty was based on the standard deviation of multiple partitioning algorithms [Desai et al., 2008].
%% So here we read into the random+ustar uncertainty, read into the GPP from all partitioning algorithms and calculate the
%% STD for the multiple algorithms. The final uncertainty is the sum
joint_single = [];
joint_tot = [];
par_tot = [];
par_single = [];

% Loop over multiple files
% Read into the gap-filled atmospheric data
for i=1:length(inputfile)
    fulldata = readtable(inputfile{i});
    % Read in data
    % Random + Ustar filtering uncertainty
    joint_single = fulldata.NEE_VUT_USTAR50_JOINTUNC;
    joint_tot = [joint_tot, joint_single];

%    joint_single = fulldata.NEE_CUT_USTAR50_JOINTUNC;
%    joint_tot = [joint_tot, joint_single];

    joint_single = fulldata.NEE_VUT_REF_JOINTUNC;
    joint_tot = [joint_tot, joint_single];

%    joint_single = fulldata.NEE_CUT_REF_JOINTUNC;
%    joint_tot = [joint_tot, joint_single];

    joint_tot(joint_tot<-1000) = nan;
    joint_uncert = nanmean(joint_tot, 2);

    %% Transfer unit (umol m-2 s-1 to gC m-2 day-1)
    %joint_uncert = joint_uncert * (10e-6*12*3600*24);

    % Calculate STD from 40 different partitioning methods
    par_single = fulldata.GPP_NT_VUT_REF;
    par_tot = [par_tot, par_single];

    par_single = fulldata.GPP_NT_VUT_USTAR50;
    par_tot = [par_tot, par_single];

    par_single = fulldata.GPP_NT_VUT_MEAN;
    par_tot = [par_tot, par_single];

    par_single = fulldata.GPP_NT_VUT_05;
    par_tot = [par_tot, par_single];

    par_single = fulldata.GPP_NT_VUT_16;
    par_tot = [par_tot, par_single];

    par_single = fulldata.GPP_NT_VUT_25;
    par_tot = [par_tot, par_single];

    par_single = fulldata.GPP_NT_VUT_50;
    par_tot = [par_tot, par_single];

    par_single = fulldata.GPP_NT_VUT_75;
    par_tot = [par_tot, par_single];

    par_single = fulldata.GPP_NT_VUT_84;
    par_tot = [par_tot, par_single];

    par_single = fulldata.GPP_NT_VUT_95;
    par_tot = [par_tot, par_single];

%    par_single = fulldata.GPP_NT_CUT_REF;
%    par_tot = [par_tot, par_single];
%
%    par_single = fulldata.GPP_NT_CUT_USTAR50;
%    par_tot = [par_tot, par_single];
%
%    par_single = fulldata.GPP_NT_CUT_MEAN;
%    par_tot = [par_tot, par_single];
%
%    par_single = fulldata.GPP_NT_CUT_05;
%    par_tot = [par_tot, par_single];
%
%    par_single = fulldata.GPP_NT_CUT_16;
%    par_tot = [par_tot, par_single];
%
%    par_single = fulldata.GPP_NT_CUT_25;
%    par_tot = [par_tot, par_single];
%
%    par_single = fulldata.GPP_NT_CUT_50;
%    par_tot = [par_tot, par_single];
%
%    par_single = fulldata.GPP_NT_CUT_75;
%    par_tot = [par_tot, par_single];
%
%    par_single = fulldata.GPP_NT_CUT_84;
%    par_tot = [par_tot, par_single];
%
%    par_single = fulldata.GPP_NT_CUT_95;
%    par_tot = [par_tot, par_single];

    par_single = fulldata.GPP_DT_VUT_REF;
    par_tot = [par_tot, par_single];

    par_single = fulldata.GPP_DT_VUT_USTAR50;
    par_tot = [par_tot, par_single];

    par_single = fulldata.GPP_DT_VUT_MEAN;
    par_tot = [par_tot, par_single];

    par_single = fulldata.GPP_DT_VUT_05;
    par_tot = [par_tot, par_single];

    par_single = fulldata.GPP_DT_VUT_16;
    par_tot = [par_tot, par_single];

    par_single = fulldata.GPP_DT_VUT_25;
    par_tot = [par_tot, par_single];

    par_single = fulldata.GPP_DT_VUT_50;
    par_tot = [par_tot, par_single];

    par_single = fulldata.GPP_DT_VUT_75;
    par_tot = [par_tot, par_single];

    par_single = fulldata.GPP_DT_VUT_84;
    par_tot = [par_tot, par_single];

    par_single = fulldata.GPP_DT_VUT_95;
    par_tot = [par_tot, par_single];

%    par_single = fulldata.GPP_DT_CUT_REF;
%    par_tot = [par_tot, par_single];
%
%    par_single = fulldata.GPP_DT_CUT_USTAR50;
%    par_tot = [par_tot, par_single];
%
%    par_single = fulldata.GPP_DT_CUT_MEAN;
%    par_tot = [par_tot, par_single];
%
%    par_single = fulldata.GPP_DT_CUT_05;
%    par_tot = [par_tot, par_single];
%
%    par_single = fulldata.GPP_DT_CUT_16;
%    par_tot = [par_tot, par_single];
%
%    par_single = fulldata.GPP_DT_CUT_25;
%    par_tot = [par_tot, par_single];
%
%    par_single = fulldata.GPP_DT_CUT_50;
%    par_tot = [par_tot, par_single];
%
%    par_single = fulldata.GPP_DT_CUT_75;
%    par_tot = [par_tot, par_single];
%
%    par_single = fulldata.GPP_DT_CUT_84;
%    par_tot = [par_tot, par_single];
%
%    par_single = fulldata.GPP_DT_CUT_95;
%    par_tot = [par_tot, par_single];

    par_tot(par_tot<-1000) = nan;
    par_uncert = nanstd(par_tot, 0, 2);

    uncert = sqrt(joint_uncert.*joint_uncert + par_uncert.*par_uncert);
end

% Gap-filling is not necessary
% Write out obs
% Currently using day-time partitioning results
dlmwrite(uncertfile,uncert);

