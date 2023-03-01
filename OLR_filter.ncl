;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;    This program follows the steps by Wheeler & Kiladis (1999) &   ;;;
;;;    Wheeler & Hendon (2004) to filter the tropical waves.          ;;;
;;;    ============================================================   ;;;
;;;    Programmer: Wayne Yuan-huai Tsai.                              ;;;
;;;    Date: 07/03/2018                                               ;;;
;;;    ============================================================   ;;;
;;;    Revised version: 11/26/2018 by Wayne Yuan-huai Tsai            ;;;
;;;    Description: Saperate MRG and TD-type.                         ;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; 

load "$NCARG_ROOT/lib/ncarg/nclscripts/contrib/kf_filter.ncl"
;load "/home/waynetsai/kf_filter.ncl"
load "$NCARG_ROOT/lib/ncarg/nclscripts/contrib/time_axis_labels.ncl"
load "$NCARG_ROOT/lib/ncarg/nclscripts/contrib/cd_string.ncl"

begin 

print_clock ("Program started.") 
print ( "This program follows the steps by Wheeler & Kiladis (1999) &")
print ( "Wheeler & Weickmann (2001) to filter the tropical waves.")
print ( "============================================================")
print ( "Programmer: Wayne Yuan-Huai Tsai.")
print ( "Version: 3/26/2020" ) 

MIS = -999
MIS@_FillValue  = -999 

; Period interested in. 
ys = 2017
ye = 2022     

; Read the file. 
;fls = systemfunc("ls /data3/USERS/waynetsai/data/OLR/OLR_CER_v1.2/olr-daily_v01r02_*.nc")
f = addfile ("./olra_1997-2020.nc","r")
print ("reading file...")
lats  = -25
latn  =  25  
lon1  =  0
lon2  = 360     ; MUST BE 0~360 DEGREE!!!!!
time1 = ys * 10000 + 101
time2 = ye * 10000 + 1231 ; 20200128

;ListSetType (f, "cat")        ; concatenate (=default)
olr1   = f->olr(:,{lats:latn},{lon1:lon2})
time = olr1&time
time_int = toint(time)
copy_VarAtts(time,time_int)
delete(olr1&time) 
olr1!0 = "time"
olr1&time = time_int
printVarSummary(olr1&time)   

olr1@_FillValue = -99999 
olr1@missing_value = -99999

lat = olr1&lat
lon = olr1&lon

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;       STEP 1. REMOVE THE LONGTERM TIME MEAN.                      ;;; 
;;;       STEP 2. REMOVE THE FIRST 3 HARMONICS OF ANNUAL CYCLE.       ;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Compute the first 3 harmonics of annual cycle from the first step. 
print ("Step 1: Remove the longterm time mean.")
print ("Step 2: Remove the first 3 harmonics of annual cycle from the first step.")
olrClmDay    = clmDayTLL (olrc, yyyymmdd_to_yyyyddd(toint(olrc&time)) )
olrClmDay_sm = smthClmDayTLL (olrClmDay,3)
olra         = calcDayAnomTLL (olrrt, yyyymmdd_to_yyyyddd(toint(olrrt&time)), olrClmDay_sm) 
delete(olra&time) 
olra!0 = "time" 
olra&time = f[:]->time 

olra = olr1
printVarSummary(olra) 

delete(olr1) 

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;       STEP 4. WAVE FILTERING.                                     ;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
print ("Step 4: Wave filtering...")
; Creating arrays needed. 
olr_Kelvin = new((/dimsizes(olra&time), dimsizes(olra&lat),dimsizes(olra&lon)/),"float")
olr_Kelvin!0 = "time"
olr_Kelvin!1 = "lat"
olr_Kelvin!2 = "lon"
olr_Kelvin&time = olra&time
olr_Kelvin&lat  = olra&lat
olr_Kelvin&lon  = olra&lon
olr_Kelvin@_FillValue = -99999
olr_Kelvin = 0.
tdim = dimsizes(olra&time) 
Kelvin = (/ 2.5, 30., 1., 14., 8., 90./)
       ; (/tMin, tMax, kMin, kMax, hMin, hMax/)  

olr_ER = new((/tdim, dimsizes(lat),dimsizes(lon)/),"float")
copy_VarMeta (olr_Kelvin, olr_ER)
olr_ER = 0.
ER = (/ 9.7, 48., -10., -1., 8., 90./)

olr_MRG = new((/tdim, dimsizes(lat),dimsizes(lon)/),"float")
copy_VarMeta (olr_Kelvin, olr_MRG)
olr_MRG = 0.
MRG = (/3., 9.6, -14., -1., 8., 90./)

olr_TD = new((/tdim, dimsizes(lat),dimsizes(lon)/),"float")
copy_VarMeta (olr_Kelvin, olr_TD)
olr_TD = 0.
TD = (/2.5, 5., -15., -6., 90., MIS/)

olr_MT = new((/tdim, dimsizes(lat),dimsizes(lon)/),"float")
copy_VarMeta (olr_Kelvin, olr_MT)
olr_MT = 0.
MT = (/2.5,10., -14., 0., MIS, MIS/)

olr_MJO = new((/tdim, dimsizes(lat),dimsizes(lon)/),"float")
copy_VarMeta (olr_Kelvin, olr_MJO)
olr_MJO = 0.
MJO = (/30., 96., 1., 5., MIS, MIS/)

olr_low = new((/tdim, dimsizes(lat),dimsizes(lon)/),"float")
copy_VarMeta (olr_Kelvin, olr_low)
olr_low = 0.
low = (/120., 9999., -9999., 9999., MIS, MIS/)
; (/tMin, tMax, kMin, kMax, hMin, hMax/)

olr2 = new((/tdim, dimsizes(lon)/),"float")
olr2!0 = "time"
olr2!1 = "lon"
olr2&time = olra&time 
olr2&lon  = olra&lon   
olr2 = 0. 

do ii = 0, (dimsizes(lat)-1) 
   print("Latitude: " + lat(ii))
   ; Step 4: Remove the interannual variability by subtracting the previous 120-day 
   ; running average data in the previous step.
   ;olr2 = olrsys(:,ii,{lon1:lon2})
  ; Step 5: Apply kf_filter to wave filtering.
  ; Kelvin wave.
   ;waveName = "Kelvin"
   ;filter_tmp = kf_filter (olr2(time|:,lon|:), 1, Kelvin(0), Kelvin(1), Kelvin(2), \
   ;             Kelvin(3), Kelvin(4), Kelvin(5), waveName)
   ;olr_Kelvin (:,ii,{lon1:lon2}) = filter_tmp
   ;filter_tmp = 0.

   ; ER. 
   ;waveName = "ER"
   ;filter_tmp = kf_filter (olr2(time|:,lon|:), 1, ER(0), ER(1), ER(2), \
   ;             ER(3), ER(4), ER(5), waveName)
   ;olr_ER (:,ii,{lon1:lon2}) = filter_tmp
   ;filter_tmp = 0.

   ; MJO. 
   waveName = "MJO"
   filter_tmp = kf_filter (olr2(time|:,lon|:), 1, MJO(0), MJO(1), MJO(2), \
                MJO(3), MJO(4), MJO(5), "none")
   olr_MJO (:,ii,{lon1:lon2}) = filter_tmp
   filter_tmp = 0.

  ; MRG. 
   ;MRGName = "MRG"  ; "MRG" for MRG wave; "none" for MRG/TD type disturbance.
   ;filter_tmp = kf_filter (olr2(time|:,lon|:), 1, MRG(0), MRG(1), MRG(2), \
   ;             MRG(3), MRG(4), MRG(5), MRGName)
   ;olr_MRG (:,ii,{lon1:lon2}) = filter_tmp
   ;filter_tmp = 0.

   ;;; TD-type
   ;filter_tmp = kf_filter (olr2(time|:,lon|:), 1, TD(0), TD(1), TD(2), \
   ;             TD(3), TD(4), TD(5), "none")
   ;olr_TD (:,ii,{lon1:lon2}) = filter_tmp
   ;filter_tmp = 0.
;
   ;; MT wave.
   ;filter_tmp = kf_filter (olr2(time|:,lon|:), 1, MT(0), MT(1), MT(2), \
   ;             MT(3), MT(4), MT(5), "none")
   ;olr_MT (:,ii,{lon1:lon2}) = filter_tmp
   ;filter_tmp = 0.

   ; Low 
   ;olr2 = olra(:,ii,{lon1:lon2})
   ;filter_tmp = kf_filter (olr2(time|:,lon|:), 1, low(0), low(1), low(2), \
   ;             low(3), low(4), low(5), "none")
   ;olr_low (:,ii,{lon1:lon2}) = filter_tmp
   ;filter_tmp = 0.
;
   olr2 = 0. 
end do

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;                       OUTPUT .nc FILES.                           ;;;     
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

outdir = "/works/waynetsai/data3_backup/filtered_nc/"
print("Output filtered .nc files...")
;printVarSummary (olr_Kelvin)
;ncdf_KW = addfile(outdir + "olr_" + ys + "-" +  ye + "_Kelvin.nc","c")
;filedimdef(ncdf_KW,"time",-1,True)
;ncdf_KW->olra = olr_Kelvin;({time1:time2},:,:) 

;printVarSummary (olr_ER)
;ncdf_ER = addfile(outdir + "olr_" + ys + "-" + ye + "_ER.nc","c")
;filedimdef(ncdf_ER,"time",-1,True)
;ncdf_ER->olra = olr_ER;({time1:time2},:,:)

;printVarSummary (olr_MRG)
;ncdf_MRG = addfile(outdir + "olr_" + ys + "-" + ye + "_MRG.nc","c")
;filedimdef(ncdf_MRG,"time",-1,True)
;ncdf_MRG->olra = olr_MRG;({time1:time2},:,:)

;printVarSummary (olr_TD)
;ncdf_TD = addfile(outdir + "olr_" + ys + "-" + ye + "_TD.nc","c")
;filedimdef(ncdf_TD,"time",-1,True)
;ncdf_TD->olra = olr_TD;({time1:time2},:,:)
;
;printVarSummary (olr_MT)
;ncdf_MT = addfile(outdir + "olr_" + ys + "-" + ye + "_MT.nc","c")
;filedimdef(ncdf_MT,"time",-1,True)
;ncdf_MT->olra = olr_MT;({time1:time2},:,:)
;
printVarSummary (olr_MJO)
ncdf_MJO = addfile(outdir + "olr_" + ys + "-" + ye + "_MJO.nc","c")
filedimdef(ncdf_MJO,"time",-1,True)
ncdf_MJO->olra = olr_MJO; ({time1:time2},:,:) 

;printVarSummary (olr_low)
;ncdf_low = addfile(outdir + "olr_" + ys + "-" + ye + "_LF.nc","c")
;filedimdef(ncdf_low,"time",-1,True)
;ncdf_low->olra = olr_low

print_clock ("Filtering completed.")
end
