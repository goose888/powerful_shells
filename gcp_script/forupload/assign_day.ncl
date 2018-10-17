;
f=addfile("TTT_new.nc", "w")
yr=ispan(1701,2017,1)
mo=ispan(1,12,1)
dd=(/0, 31, 59, 90, 120, 151, 181, 212, 243, 273, 304, 334/)
year = new(3804,"integer")
month = new(3804,"integer")
day = new(3804,"integer")
doy = new(3804,"integer")
i=0
j=0
idx=0
do i=0,316
  do j=0,11

    idx=i*12+j
    year(idx)=yr(i)
    month(idx)=mo(j)
    day(idx)=dd(j)
    doy(idx)=(year(idx)-1701)*365 + day(idx)

  end do
end do
f->time=doy
