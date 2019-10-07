%% Author: Shu Shijie
% Date: Jul 19 2012
% Building atomospheric forcing file

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
fname = '2008-08.nc';
casename = 'single point - Arou';
edgen = 38.54438889;
edges = 37.54438889;
edgee = 100.9646944;
edgew = 99.9646944;
longitude = 100.4646944;
latitude = 38.04438889;

% Read in data values
rawdata1 = csvread('F:\Building atomospheric forcing file\Arou\Arou_atm_2008_08-1.csv', 2, 0);
day = 31;
num = day * 8;
len1 = day * 48;
rawdata2 = csvread('F:\Building atomospheric forcing file\Arou\Arou_atm_2008_08-2.csv', 2, 0);
len2 = day * 24;

%%
% 对-9999和-6999值用MVD方法(falge,2001)做数据插补
data1 = mdv(rawdata1, 6, 3);
data2 = mdv(rawdata2, 6, 3);

% 计算3h气温均值
TA = zeros(num, 1);
for k = 1:num
    sum = 0;
    for i = [6*(k-1)+1]:[6*k]
        sum = sum + data1(i, 4);
    end
    TA(k) = 273.16 + sum/6;
end

% 计算3h相对湿度均值,气压,短波辐射与长波辐射
RH = zeros(num, 1);
for k = 1:num
    sum = 0;
    for i = 6*(k-1)+1:6*k
        sum = sum + data1(i, 7);
    end
    RH(k) = sum/6;
end

% 计算3h直射短波辐射均值
RG = zeros(num, 1);
for k = 1:num
    sum = 0;
    for i = 6*(k-1)+1:6*k
        sum = sum + data1(i, 8);
    end
    RG(k) = sum/6;
    if(RG(k) < 0)
        RG(k) = 0;
    end
end

% 计算3h长波辐射均值
RGL = zeros(num, 1);
for k = 1:num
    sum = 0;
    for i = 6*(k-1)+1:6*k
        sum = sum + data1(i, 9);
    end
    RGL(k) = sum/6;
end

% 计算3h平均风速(m/s),忽略风向
WS = zeros(num, 1);
for k = 1:num
    sum = 0;
    for i = 6*(k-1)+1:6*k
        sum = sum + data1(i, 6);
    end
    WS(k) = sum/6;
end

% 计算3h降雨速率(mm/s)均值
PREC = zeros(num, 1);
for k = 1:num
    count = 0;
    sum = 0;
    for i = 3*(k-1)+1:3*k
        sum = sum + data2(i, 4);
    end
    PREC(k) = sum/(3*1800);
end

% 计算3h气压均值,短波辐射与长波辐射
PRESS = zeros(num, 1);
for k = 1:num
    sum = 0;
    for i = 3*(k-1)+1:3*k
        sum = sum + data2(i, 5);
    end
    PRESS(k) = sum/3 * 1000;
end

% 新建Netcdf文件并保存结果
ncid = netcdf.create(fname, 'NC_NOCLOBBER');
% 定义dimensions
scalarid = netcdf.defDim(ncid, 'scalar', 1);
lonid = netcdf.defDim(ncid, 'lon', 1);
latid = netcdf.defdim(ncid, 'lat', 1);
timeid = netcdf.defdim(ncid, 'time', num);
% 定义variables和每一个下属的attributes
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
tbotid = netcdf.defVar(ncid, 'TBOT', 'float', [lonid, latid, timeid]);
netcdf.putAtt(ncid, tbotid, 'long_name', 'temperature at the lowest atm level (TBOT)');
netcdf.putAtt(ncid, tbotid, 'units', 'K');
netcdf.putAtt(ncid, tbotid, 'mode', 'time-dependent');
windid = netcdf.defVar(ncid, 'WIND', 'float', [lonid, latid, timeid]);
netcdf.putAtt(ncid, windid, 'long_name', 'wind at the lowest atm level (WIND)');
netcdf.putAtt(ncid, windid, 'units', 'm/s');
netcdf.putAtt(ncid, windid, 'mode', 'time-dependent');
rhid = netcdf.defVar(ncid, 'RH', 'float', [lonid, latid, timeid]);
netcdf.putAtt(ncid, rhid, 'long_name', 'relative humidity at the lowest atm level (QBOT)');
netcdf.putAtt(ncid, rhid, 'units', '%');
netcdf.putAtt(ncid, rhid, 'mode', 'time-dependent');
precid = netcdf.defVar(ncid, 'PRECTmms', 'float', [lonid, latid, timeid]);
netcdf.putAtt(ncid, precid, 'long_name', 'precipitation (PRECT)');
netcdf.putAtt(ncid, precid, 'units', 'mm/s');
netcdf.putAtt(ncid, precid, 'mode', 'time-dependent');
fsdsid = netcdf.defVar(ncid, 'FSDS', 'float', [lonid, latid, timeid]);
netcdf.putAtt(ncid, fsdsid, 'long_name', 'incident solar radiation (FSDS)');
netcdf.putAtt(ncid, fsdsid, 'units', 'W/m2');
netcdf.putAtt(ncid, fsdsid, 'mode', 'time-dependent');
psrfid = netcdf.defVar(ncid, 'PSRF', 'float', [lonid, latid, timeid]);
netcdf.putAtt(ncid, psrfid, 'long_name', 'surface pressure at the lowest atm level (PSRF)');
netcdf.putAtt(ncid, psrfid, 'units', 'Pa');
netcdf.putAtt(ncid, psrfid, 'mode', 'time-dependent');
% 定义Global Attributes
globalid = netcdf.getConstant('GLOBAL');
netcdf.putAtt(ncid, globalid, 'case', casename);
netcdf.putAtt(ncid, globalid, 'data_source', 'Watershed Allied Telemetry Experiment Research, gap filled using MDV method');
% 结束NC文件定义
netcdf.endDef(ncid);

% 将数据存入variable中
netcdf.putVar(ncid, edgewid, edgew);
netcdf.putVar(ncid, edgeeid, edgee);
netcdf.putVar(ncid, edgesid, edges);
netcdf.putVar(ncid, edgenid, edgen);
netcdf.putVar(ncid, longxyid, longitude);
netcdf.putVar(ncid, latixyid, latitude);
netcdf.putVar(ncid, tbotid, TA);
netcdf.putVar(ncid, windid, WS);
netcdf.putVar(ncid, rhid, RH);
netcdf.putVar(ncid, precid, PREC);
netcdf.putVar(ncid, psrfid, PRESS);
netcdf.putVar(ncid, fsdsid, RG);

% 关闭netcdf文件
netcdf.close(ncid);
