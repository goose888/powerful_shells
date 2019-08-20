      program  webdata
    
     
      !implicit none

    
     ! subroutine readnetcdf    
!this is the name of the data file we will read
      use netcdf
      implicit none
      integer, parameter ::fn=8,mm=12
      integer, target ::m(mm)=(/31,28,31,30,31,30,31,31,30,31,30,31/)
      integer, pointer::pot(:)
      character ( len= 256) :: FILE_NAME(fn) !,parameter ::&
   !   FILE_NAME(fn)=(/'tair/cruncep2015_1_tair_'&
   !                 , 'uwind/cruncep2015_1_uwind_'&
   !                 , 'qairv5/cruncep2015_1_qair_'&
   !                 , 'rain/cruncep2015_1_rain_'&
   !                 , 'press/cruncep2015_1_press_'&
   !                 , 'swdown/cruncep2015_1_swdown_'&
   !                 , 'vwind/cruncep2015_1_vwind_'&
   !                 , 'lwdown/cruncep2015_1_lwdown_'/)
      character (len=*),parameter ::&
      mask_filename(2)=(/'ISAM_HH_LANDCOVER_1943.nc',&
                         'tair/cruncepv7_tair_2015.nc     '/)
      character ( len= *),parameter::&
       varname(fn)=(/'t1p5m_gb                  '&
                   , 'uwind             '&
                   , 'qw1        '&
                   , 'prec          '&
                   , 'pstar                     '&
                   , 'sw_down '&
                   , 'vwind             '&
                   , 'lw_down '/)       

!we are reading 3d data, a 730 *360 *1460 grid.
      integer, parameter :: NX=360,NY=720,NZ=1460
      real,dimension(:,:,:),allocatable::data_get,o_data1,c_trans
      real,dimension(:,:,:),allocatable,target::o_data
      real,dimension(:,:,:),pointer :: point=>NULL()
      real,dimension(:,:,:),allocatable::c_data,mask09
      real,dimension(:,:),allocatable:: latxy,lonxy
      integer,dimension(:,:),allocatable::mask_target
      REAL,DIMENSION(:),ALLOCATABLE::long,latt
      integer,dimension(:),allocatable::tnum
! REAL,DIMENSION(:,:),ALLOCATABLE ::o_data_mask!,feb,mar,apr,may,jun,jul,&
               !                           aug,sep, nov,oct,dec
!this will be the netCDF ID for the file and data variable
      integer::ncid,varid
!looop indexes, and error handling
      integer::i,j,k,month,MZ,dd1,dd2,fnn,ierr
      integer::counter,mask_sum,nn,n1,n2
      integer::cnt,inc,newi,newj
      real:: data_sum
!allocate memory for data
! Namelist to determine the year
      character(4) :: yr
      namelist /whichyear/ yr 

!---------valuable loop start--------------
print*,'valuable loop start'

      FILE_NAME  = (/'HadGEM2-ES/processed/t1p5m_gb_'&
                    , 'HadGEM2-ES/processed/uwind_'&
                    , 'HadGEM2-ES/processed/qw1_'&
                    , 'HadGEM2-ES/processed/prec_'&    ! Here rainfall is s-1 instead of 6h-1
                    , 'HadGEM2-ES/processed/pstar_'&
                    , 'HadGEM2-ES/processed/sw_down_'&
                    , 'HadGEM2-ES/processed/vwind_'&
                    , 'HadGEM2-ES/processed/lw_down_'/)

      read (*, whichyear, iostat=ierr)
      print *, 'Namelist status:', ierr

      do fnn=1,8
      
      FILE_NAME(fnn) = trim(FILE_NAME(fnn))//trim(yr)//".nc"
      print *, 'filename?', FILE_NAME(fnn)
      allocate (data_get(NY,NX,NZ))
      allocate (o_data(NY,NX,NZ))    
      allocate (c_data(NY,NX,NZ))
      allocate (lonxy(NY,NX))
      allocate (latxy(NY,NX))
      allocate (pot(mm))
      allocate (latt(NX))
      allocate (long(NY))      
      allocate (c_trans(NX,NX,NZ))
      allocate (mask_target(NY,NX))
      
      pot=>m(:)
!--------read mask of two files-------------------     
        call check( nf90_open(trim(mask_filename(1)),NF90_NOWRITE,ncid))
        call check( nf90_inq_varid(ncid,'Mask',varid))
        call check( nf90_get_var(ncid,varid,mask_target))
        call check( nf90_close(ncid))
     print *,"***SUCCESS reading mask file****",mask_filename(1),"**!"
     !   call check( nf90_open(trim(mask_filename(2)),NF90_NOWRITE,ncid))
     !   call check( nf90_inq_varid(ncid,'mask',varid))
     !   call check( nf90_get_var(ncid,varid,mask_point))
     !   call check( nf90_close(ncid))  
    ! print *,"***SUCCESS reading mask file****",mask_filename(2),"**!"
      !   call check( nf90_open(trim(data_mask(1)),NF90_NOWRITE,ncid))
      !   call check( nf90_inq_varid(ncid,'TBOT',varid))
      !   call check( nf90_get_var(ncid,varid,mask09))
      !   call check( nf90_close(ncid))
!--------read climate data-------------------
!open the file.NF90_NOWRITE tells netCDF we want read-only access to the fil
         call check( nf90_open(trim(FILE_NAME(fnn)),NF90_NOWRITE,ncid))
!get the varid of the data variable, based on its name
         call check( nf90_inq_varid(ncid,trim(varname(fnn)),varid))
!read the data
         call check( nf90_get_var(ncid,varid,data_get))
!close the file, freeing all resources.
      call check( nf90_close(ncid))
      print *,"***SUCCESS reading wedata file",FILE_NAME(fnn),"!" 

      WRITE(*,*) SHAPE(data_get)    ! 2
      
!----------calculate-------------------
!------assign undef value to -999.---------------
           if(fnn==4)then
             data_get(:,:,:)= data_get(:,:,:)*(6*3600)
           endif

          do i=1,360
           do j=1,720
              do k=1,NZ
           if (data_get(j,i,k).lt.-1000.)data_get(j,i,k)=-999.

              end do
          end do
          end do
           PRINT *,"ASSIGN DATA TO -999."
!---------change mask lon direction---------
          c_trans(:,:,:)=data_get(1:360,:,:)
          data_get(1:360,:,:)=data_get(361:720,:,:)
          data_get(361:720,:,:)=c_trans(:,:,:)
          print *," finishing change data lon direction *************!"
          !c_trans_mask(:,:)=mask_point(1:360,:)
          !mask_point(1:360,:)=mask_point(361:720,:)
          !mask_point(361:720,:)=c_trans_mask(:,:)
          !print *," finishing change mask lon direction *************!"

          c_data = data_get
          o_data=c_data
      print *," finishing change mask lat direction *************!"
!-------assign value to lon and lat---------------
         do j=1,360
           do i=1,720
               latxy(i,j)=-89.75+0.5*(j-1.)
               lonxy(i,j)=0.25+0.5*(i-1.)
           end do
         end do
     
        do i=1,NY
        long(i)=0.25+0.5*(i-1.)
        end do
        do i=1,NX
        latt(i)=-89.75+0.5*(i-1.)
        end do
        
        
         print *,"finishing assign value to  and  lat &  longitude"
!------------extract and redistribute data

        deallocate(c_data)
        deallocate(data_get)
        deallocate(c_trans)
!------------month loop start---------------
!!!print *,'monthly loop start***********!'
do month=1,12
       PRINT*, "STARTING MONTH= ",month,"************!"  
         select case(month)
           case(1,3,5,7,8,10,12)
           MZ=124
           case(4,6,9,11)
           MZ=120
           case default
           MZ=112
         end select
         print*, 'MZ', MZ
        allocate(tnum(MZ))
        do i=1,MZ
          tnum(i)=i
        end do
        print*, 'tnum', tnum
        print *, "finishing select MZ *****************!"
        allocate (o_data1(NY,NX,MZ))
        print *, "finishing allocating data array*********!" 
         dd1=0
         dd2=0
         if (month.eq.1)then
             dd1=1
             dd2=pot(month)*4 
         else
             dd1=sum(pot(1:month-1))*4+1
             dd2=sum(pot(1:month))*4
         end if

        print *, "finishing distribute dd1,and dd2 "   
            point=>o_data(:,:,dd1:dd2)
            o_data1(:,:,:)=point(:,:,:)
        print *,"****SUCESS reading o_data***"
 do k=1,MZ
    do i=1,360
       do j=1,720
          if (mask_target(j,i).eq.1.and.o_data1(j,i,k).eq.-999.)then
              ! Do a snake style search
              !     |---| 
              !     ||-||
              !     ||--|
              !     |---->
               cnt = 0
               newi = i
               newj = j
               do while (mask_target(j,i).eq.1.and.o_data1(j,i,k).eq.-999.)
                 cnt = cnt + 1
                 if (mod(cnt,2).eq.1) then
                   do inc = 1,cnt
                     ! search up
                     newi = newi - 1
                     if(newi<1) then
                        newi = 1
                     endif
                     if(o_data1(newj,newi,k).ne.-999.) then 
                        o_data1(j,i,k)=o_data1(newj,newi,k)
                        go to 100
                     endif
                   enddo
                   do inc = 1,cnt
                     ! search left
                     newj = newj - 1
                     if(newj<1) then
                        newj = 1
                     endif
                     if(o_data1(newj,newi,k).ne.-999.) then 
                        o_data1(j,i,k)=o_data1(newj,newi,k)
                        go to 100
                     endif
                   enddo
                 else 
                   do inc = 1,cnt
                     ! search down
                     newi = newi + 1
                     if(newi>360) then
                        newi = 360
                     endif
                     if(o_data1(newj,newi,k).ne.-999.) then 
                        o_data1(j,i,k)=o_data1(newj,newi,k)
                        go to 100
                     endif
                   enddo
                   do inc = 1,cnt
                     ! search right
                     newj = newj + 1
                     if(newj>720) then
                        newj = 720
                     endif
                     if(o_data1(newj,newi,k).ne.-999.) then 
                        o_data1(j,i,k)=o_data1(newj,newi,k)
                        go to 100
                     endif
                   enddo
                 endif
               enddo
          end if
 100 continue
       end do 
    end do
 end do
PRINT*, 'INTERPOLATE 3333333'

!!! Mask out grids outside the mask
     do k=1,MZ
      do i=1,360
        do j=1,720
           
           if (mask_target(j,i).eq.0.and.o_data1(j,i,k).ne.-999.)then
               o_data1(j,i,k)=-999.
           end if
!!! QA
           if (mask_target(j,i).eq.1.and.o_data1(j,i,k).lt.0.)then
               o_data1(j,i,k)=0.
           end if
           if (mask_target(j,i).eq.1.and.o_data1(j,i,k).gt.2e5)then
               o_data1(j,i,k)=0.
           end if
        end do
      end do
     end do

    

       call writenetcdf(o_data1&
                       ,month,MZ,lonxy,latxy,long,latt,fnn,tnum,yr)
          
         
print *,"****SUCCESS CALL WRITENETCDF SUBTOUTINE****"
      deallocate (o_data1)
      deallocate (tnum)
PRINT *, "*****SUCCESS DEALLOCATE o_data1 ****!"
       
      end do     
      deallocate(o_data)
      deallocate(lonxy)
      deallocate(latxy)
      deallocate(latt)
      deallocate(long)
      deallocate(mask_target)    
PRINT *,"****DEALLOCATE ALL ARRAYS***month  =   ",m
      end do    
print*,'*********************THE END**********************' 
!---------subroutine------------------

      

      CONTAINS


      subroutine writenetcdf(o_data1&
           ,month,mz,lonxy,latxy,long,latt,fnn,tnum,yr)

      use netcdf

      real,dimension(:,:,:),intent(in)::o_data1
      real,dimension(:,:),intent(in)::lonxy,latxy
      REAL,DIMENSION(:),INTENT(IN)::long,latt
      integer,dimension(:),intent(in)::tnum
      integer,intent(in)::month,mz,fnn
      character(len=*), intent(in) :: yr
      integer,parameter:: mm=12
      character ( len= 256) :: FILE_NAME(mm) !parameter ::&
     !   FILE_NAME(mm) = (/'out_check2014/2005-01.nc  ','out_check2014/2005-02.nc  ','out_check2014/2005-03.nc  ',&
     !                     'out_check2014/2005-04.nc  ','out_check2014/2005-05.nc  ','out_check2014/2005-06.nc  ',&
     !                     'out_check2014/2005-07.nc  ','out_check2014/2005-08.nc  ','out_check2014/2005-09.nc  ',&
     !                     'out_check2014/2005-10.nc  ','out_check2014/2005-11.nc  ','out_check2014/2005-12.nc'/)
      character ( len= *), parameter :: &
        mons(mm) = (/'-01.nc','-02.nc','-03.nc',&
                     '-04.nc','-05.nc','-06.nc',&
                     '-07.nc','-08.nc','-09.nc',&
                     '-10.nc','-11.nc','-12.nc'/)
 
      character (len=*),parameter::&
        varname(8) =(/'TBOT    ','UWIND   ','QBOT    ','PRECTmms'&
                     ,'PSRF    ','FSDS    ','VWIND   ','LWDOWN  '/)
      character (len=*),parameter::&
        units(8) =(/'k                      '&
                   ,'m/s                    '&
                   ,'g/g                    '&
                   ,'mm (6 hour total)      '&
                   ,'Pa                     '&
                   ,'W/m2 (6 hourly Average)'&
                   ,'m/s                    '&
                   ,'W/m2                   '/)
      !we are writing 3d data, a 720 * 360* 1460 grid
      integer,parameter :: NDIMS = 3
      integer,parameter :: NX = 360,NY = 720
      !we when we create net CDF files, variables and dimensions, we get back an ID for each one.
      integer :: ncid,varid
      integer,dimension(:),allocatable :: dimid
      integer :: x, y,z
      integer :: i
 
      do i=1,mm
         FILE_NAME(i) = 'out_check_ssp2/'//trim(yr)//trim(mons(i))
      enddo   
 
      allocate (dimid(3))
      
      print*,"*******SUCCESS define parameter******"
      print *, "What variable right now?", trim(varname(fnn))
     
      if(fnn.eq.1)then
      call check( nf90_create(trim(FILE_NAME(month)), NF90_CLOBBER, ncid))
      print *,"*****success creating newfile ",FILE_NAME(month),"!"
      !define the dimensions. netCDF will hand back an ID for each
      call check( nf90_def_dim( ncid, "latitude", NX, dimid(2)))
      call check( nf90_def_dim( ncid, "longitude", NY, dimid(1)))
      call check( nf90_def_dim( ncid, "Time", mz, dimid(3)))
      
       
      PRINT*,"**dimention dimids2 and dimids success reading***"
      !define the lon variable. 
      call check(nf90_def_var(ncid,'longitude',NF90_FLOAT,dimid(1),varid))
      call check( nf90_put_att( ncid, varid,'Name','Longitude'))
      call check( nf90_put_att( ncid, varid,'Units','degree_east'))
      !define the latitudinal variable
      call check(nf90_def_var(ncid,'latitude',NF90_FLOAT,dimid(2),varid))
      call check( nf90_put_att( ncid,varid,'Name','Latitude'))
      call check( nf90_put_att( ncid,varid,'Units','degree_north'))
      !define time
      call check( nf90_def_var(ncid,'Time',nf90_int,dimid(3),varid))
      call check( nf90_put_att(ncid,varid,'Name','Time'))
      !2d 
      call check(nf90_def_var(ncid,'LATIXY',NF90_FLOAT,dimid(1:2),varid))
      call check(nf90_def_var(ncid,'LONGXY',NF90_FLOAT,dimid(1:2),varid))
      print*,"****laxixy,longxy,success define*****"
      !3d variables
      call check( nf90_def_var( ncid,trim(varname(fnn)),NF90_FLOAT, dimid,varid))
      call check( nf90_put_att( ncid,varid,'Units',trim(units(fnn))))
      call check( nf90_enddef(ncid) )
      PRINT *,"****SUCCESS DEFINE OUTPUT VARIABLE***"
      ! write the data to the file.
      call check( nf90_inq_varid(ncid,'longitude',varid))
      call check( nf90_put_var(ncid,varid,long))
      call check( nf90_inq_varid(ncid,'latitude',varid))
      call check( nf90_put_var(ncid, varid,latt) )
      call check( nf90_inq_varid(ncid,'Time',varid))
      call check( nf90_put_var(ncid,varid,tnum))
      print *,"******success writing coordination****"
     
      call check( nf90_inq_varid(ncid,'LATIXY',varid))
      call check( nf90_put_var(ncid,varid,latxy))
      call check( nf90_inq_varid(ncid,'LONGXY',varid))
      call check( nf90_put_var(ncid,varid,lonxy))



      call check( nf90_inq_varid(ncid,trim(varname(fnn)),varid))
      call check( nf90_put_var(ncid,varid,o_data1))
      call check( nf90_close(ncid) )


      else
     
      call check( nf90_open( trim(FILE_NAME(month)), NF90_WRITE, ncid))
      print *,"****success reopening existing file",FILE_NAME(month),"!"
      !print*,"define the dimensions. netCDF will hand back an ID for"
      call check( nf90_inq_dimid( ncid,"longitude",dimid(1)))
      !print *,lonID
      !call check( nf90_inquire_dimension( ncid,dimid(1),len=lonID))
      !PRINT *,dimid(1)
      call check( nf90_inq_dimid( ncid,"latitude",dimid(2)))
      ! print *,latID
      ! call check( nf90_inquire_dimension( ncid,latID,len=dimid(2)))
      !PRINT *, dimid(2)
       call check( nf90_inq_dimid( ncid,"Time",dimid(3)))
      !print *,timeID
      !call check( nf90_inquire_dimension( ncid,timeID,len=dimid(3))) 
      !PRINT *,dimid(3)
      PRINT*,"**dimention dimids2 and dimids success reading***"
      !3d variables
      call check(nf90_redef(ncid))
       print*,'redefining!!!!!!!!!!!!'
      call check( nf90_def_var( ncid,trim(varname(fnn)),NF90_FLOAT, dimid,varid))
      call check( nf90_put_att( ncid,varid,'Units',trim(units(fnn))))
      
      print *, "*** SUCCESS adding new variable in file 2010.nc!"
      call check( nf90_enddef(ncid) )
      PRINT *,"****SUCCESS DEFINE appending VARIABLE***"



      call check( nf90_inq_varid(ncid,trim(varname(fnn)),varid))
      call check( nf90_put_var(ncid,varid,o_data1))
      call check( nf90_close(ncid) )
      print *, "SUCCESS APPENDING NEW VARIABLE ",fnn
      end if

      end subroutine writenetcdf

      subroutine check( status)
      use netcdf
      integer,intent( in)::status
      if ( status /= nf90_noerr)then
         print *,trim( nf90_strerror(status))
         stop 2
      end if
      end subroutine check


      end program webdata 
