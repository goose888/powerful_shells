;*******************************************
; transform_files.ncl
;
; Concepts illustrated:
;   - Reading multiple CRCM netCDF files containing daily hourly data
;   - Computing daily averages using simple loop plus array syntax
;   - Dealing with (possibly) packed data on netCDF file
;***************************************************************

load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/gsn_code.ncl"  
load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/gsn_csm.ncl"  
load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/contributed.ncl"  

begin
 diri   = "./"                                 ; input dir
 fili   = systemfunc("cd "+diri+" ; ls *.nc") ; inpit file name(s)
 nfil   = dimsizes(fili)
 print(fili)

; varName= (/"msl"/)                 ; manually specify

 netCDF = True
 PLOT   = False

 if (netCDF) then
     ncDir   = "./Processed/"                        ; directory for netCDF output
     ncPack  = False                        ; True=>create "short"; False=>float
     if (ncPack) then
         scale   = 1000.
         optPack = True
         optPack@scale_factor = 1./scale   ; COARDS/CF convention attributes
         optPack@add_offset   = 0.
     end if
 end if

 if (PLOT) then
     pltDir  = "./"                        ; directory for plot output
     pltName = "CRCM"                      ; netCDF name output
     pltType = "ps"  
 end if

;*******************************************
; Pre-define the array
;*******************************************
 year = new((/nfil/), "integer")

;*******************************************
; Loop over files                                    
;*******************************************
 do nf=0,nfil-1
    f       = addfile (diri+fili(nf), "r")
    x3      = f->$varName(0)$       ; (time,yc, xc) 3 hrly
    printVarSummary(x3)

    year(nf) = 1701 + nf

;************************************************
; Create netCDF: Use NCL's Simple Method
;************************************************
  
   if (netCDF) then

       if (ncPack) then
           x = round(x*scale, 0)/scale     ; avoid truncation bias
       end if

       xMin  = min(x3)
       xMax  = max(x3)
       x3@actual_range = (/ xMin, xMax /)  

;       globeAtt              = 1
;       globeAtt@description  = "ISAM Trendy SG3 output"

       ncVarName = varName(0)

;       ncFil     = "ISAM_S3_"+year(nf)+"_"+varName(0)+".nc"
       ncFil_full     = ncFil+year(nf)+"_"+varName(0)+".nc"
     
       NCFILE    = ncDir + ncFil_full
       system ("/bin/rm -f " +  NCFILE)    ; remove any pre-exist file 
           
       ncdf   = addfile(NCFILE,"c")     
     
       fileattdef( ncdf, globeAtt )        ; create the global [file] attributes
;       filedimdef(ncdf,"time",-1,True)     ; force "time" to be unlimited
                                         
;       ncdf->time   = x&time
;       ncdf->lat    = x&lat
;       ncdf->lon    = x&lon
;       ncdf->date   = date

       ncdf->$ncVarName$ = x3

   end if   ; netCDF

 end do     ; nf


end

exit
