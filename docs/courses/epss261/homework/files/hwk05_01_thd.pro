;
; make sure you run the latest (bleeding edge) of the SPEDAS distribution
;
cwdirname='C:\My Documents\ucla\teaching\EPSS_261_2025_Winter_DA\Homeworks\Hwk05'
cwd,cwdirname
;
thm_init ; this sets color options and things like that. It is not necessary but useful.
tplot_options, 'xmargin', [20,9] ; increases left margin to account for long names (ylabel)
;
timespan,'2008/02/26 03:00:00',3,/hours
timeofint=['2008/02/26 04:45','2008/02/26 05:15']
twaveburst=['2008/02/26 04:58:00','2008/02/26 05:00:00']
twaveburst_narrow=['2008/02/26 04:58:26','2008/02/26 04:58:36']
twaveburst_poynting=['2008/02/26 04:58:29.5','2008/02/26 04:58:34.15']



;------------------------------------------------------------
; Introduce and calibrate E, Ez, assuming E*B=0, from Ex, Ey
;
sclets=['d']
foreach element, sclets do begin
sclet=element
mysc='th'+sclet
thm_load_state,probe=sclet,/get_supp
thm_load_fit,probe=sclet,suff='_dsl' ; this gives both FGM and EFI (spin-fits)
options,mysc+['_fgs_dsl','_efs_dsl','_efs_0_dsl','_efs_dot0_dsl'],'databar',0
tplot,mysc+['_fgs_dsl','_efs_dsl','_efs_0_dsl','_efs_dot0_dsl']
options,'
tplot_apply_databar



;------------------------------------------------------------
; Get Ez (dsl) and ExB
;
; first get Ex/y offsets
;
print,'Select 2 times (Start/Stop) for obtaining Ex, Ey offsets'
ctime,trange4offset
; we get: trange4offset=['2008-02-26/03:47:00','2008-02-26/03:56:50']
Exyzoffsets = spd_tplot_average(mysc+'_efs_dsl',trange4offset)
Exoffset = Exyzoffsets[0]
Eyoffset = Exyzoffsets[1]
;
angle=20. ; degrees
tanangle=tan(angle*!PI/180.)
get_data,'th'+sclet+'_efs_0_dsl',data=thx_efs_dsl
get_data,'th'+sclet+'_fgs_dsl',data=thx_fgs_dsl
igood=where(abs(thx_fgs_dsl.y(*,2)/sqrt(thx_fgs_dsl.y(*,0)^2+thx_fgs_dsl.y(*,1)^2)) ge tanangle,janygood)
ibad=where(abs(thx_fgs_dsl.y(*,2)/sqrt(thx_fgs_dsl.y(*,0)^2+thx_fgs_dsl.y(*,1)^2)) lt tanangle,janybad)
;
thx_efs_dsl.y(*,0)=thx_efs_dsl.y(*,0)-Exoffset
thx_efs_dsl.y(*,1)=thx_efs_dsl.y(*,1)-Eyoffset
thx_efs_dot0_dsl=thx_efs_dsl
;
if (janybad ge 1) then thx_efs_dot0_dsl.y(ibad,*)=!VALUES.F_NAN
if (janygood lt 1) then print,'*****WARNING: NO GOOD 3D ExB data'
if (janygood ge 1) then thx_efs_dot0_dsl.y(igood,2)=$
  -(thx_efs_dsl.y(igood,0)*thx_fgs_dsl.y(igood,0)+$
    thx_efs_dsl.y(igood,1)*thx_fgs_dsl.y(igood,1)) / $
    thx_fgs_dsl.y(igood,2)
;
thx_exb_dot0_dsl=thx_efs_dot0_dsl ; this is a variable to hold the ExB data
store_data,'th'+sclet+'_efs_dot0_dsl',data={x:thx_efs_dot0_dsl.x,y:thx_efs_dot0_dsl.y}
options,'th'+sclet+'_efs_dot0_dsl','colors',[2,4,6]
options,'th'+sclet+'_efs_dot0_dsl','databar',0


;------------------------------------------------------------
; Compute V=ExB/B^2
;
tinterpol_mxn,'th'+sclet+'_fgs_dsl','th'+sclet+'_efs_dot0_dsl',newname='th'+sclet+'_fgs_dsl_int' ; interpolated B on E
tcrossp,'th'+sclet+'_efs_dot0_dsl','th'+sclet+'_fgs_dsl_int',newname='thx_exb_temp' ; form ExB
tdotp,'th'+sclet+'_fgs_dsl_int','th'+sclet+'_fgs_dsl_int',newname='thx_bdotb_temp' ; form B^2
div_data,'thx_exb_temp','thx_bdotb_temp',newname='thx_exbob2_temp' ; take ExB/B^2
get_data,'thx_exbob2_temp',data=thx_exbob2_temp 
store_data,'th'+sclet+'_Vexb_dot0_dsl',data={x:thx_exbob2_temp.x,y:thx_exbob2_temp.y*1000.}
options,'th'+sclet+'_Vexb_dot0_dsl','colors',[2,4,6]
options,'th'+sclet+'_Vexb_dot0_dsl','databar',0
;
stop
;
endforeach
;
; convert to GSM
; 
thm_cotrans,mysc+'_fgs',in_suffix='_dsl',out_suffix='_gsm'
thm_cotrans,mysc+'_efs_dot0',in_suffix='_dsl',out_suffix='_gsm'
thm_cotrans,mysc+'_Vexb_dot0',in_suffix='_dsl',out_suffix='_gsm'
;
; interpolate across gaps (when Bz is small and E*B=0 cannot be implemented resulting in gaps)
;
tdeflag,mysc+'_efs_dot0_gsm','linear',/overwrite
tdeflag,mysc+'_Vexb_dot0_gsm','linear',/overwrite
options,'th'+sclet+'*gsm','databar',0
;
tplot,['thd_fgs_gsm','thd_efs_dot0_gsm','thd_Vexb_dot0_gsm']
tlimit,timeofint
tplot_apply_databar
;
stop


;------------------------------------------------------------
; Introduce and plot onboard spectra
;
thm_load_fbk,probe=sclet
options,'*fb*',spec=1
ylim,'*fb*',1,6000.,1
zlim,'thd_fb_scm1',0.001,1,1
zlim,'thd_fb_edc12',0.002,0.5,1
thm_load_fft,probe=sclet
tplot,['thd_fgs_gsm','thd_efs_dot0_gsm','thd_Vexb_dot0_gsm', $
       'thd_fb_edc12','thd_fb_scm1','thd_ffw_16_eac34','thd_ffp_16_eac34','thd_ffp_16_scm3']
tlimit,timeofint
tplot_apply_databar
stop


;------------------------------------------------------------
; Introduce and plot ground processed SCM and EFW spectra to see what you've got
;
thm_load_scm,probe=sclet,coord='dsl',suff='_dsl'
tres,'thd_scw_dsl',scwtres
print,'Cadence:',1/scwtres,'Samples/s'
tdpwrspc,'thd_scw_dsl',nboxpoints=(1/scwtres)/4,nshiftpoints=(1/scwtres)/8
zlim,'thd_scw_dsl_?_dpwrspc',1.e-10,1.e-3,1
thm_efi_clean_efw, probe=sclet, spikenfit=300 ; cleaned from spikes and cal'ed frequency response
tres,'thd_efw_clean_dsl',efwtres
print,'Cadence:',1/efwtres,'Samples/s'
tdpwrspc,'thd_efw_clean_dsl',nboxpoints=(1/efwtres)/4,nshiftpoints=(1/efwtres)/8
zlim,'thd_efw_clean_dsl_?_dpwrspc',1.e-7,1.e1,1
;
tlimit,timeofint
tplot,['thd_fgs_gsm','thd_efs_dot0_gsm','thd_Vexb_dot0_gsm', 'thd_efw_clean_dsl_x_dpwrspc','thd_scw_dsl_x_dpwrspc',$
  'thd_fb_edc12','thd_fb_scm1','thd_ffw_16_eac34','thd_ffw_16_scm3','thd_ffp_16_eac34','thd_ffp_16_scm3']
tplot_apply_databar
;
stop
;
; rotate E,B to FAC coord's
;
thm_load_fgm,probe=sclet,datatype='fgh',coord='dsl',suff='_dsl'
thm_cotrans,mysc+'_fgh',in_suffix='_dsl',out_suffix='_gsm'
;
tsmooth2,'thd_fgh_dsl',64,newname='thd_fgh_dsl_lp' ; low pass filtered data in DSL
thm_fac_matrix_make,'thd_fgh_dsl_lp'
tvector_rotate,'thd_fgh_dsl_lp_fac_mat','thd_scw_dsl' ; creates new quantity "*_rot" for scw
tvector_rotate,'thd_fgh_dsl_lp_fac_mat','thd_efw_clean_dsl' ; creates new quantity "*_rot" for efw
;
twavpol,'thd_scw_dsl_rot',nopfft=(1/scwtres)/8
zlim,'thd_scw_dsl_rot_powspec',1.e-10,1.e-3,1
zlim,'thd_scw_dsl_rot_pspec3',1.e-10,1.e-3,1
ylim,'thd_scw_dsl_rot_*',30.,4000.,1
;
tvectot,'thd_fgh_gsm',newname='thd_fgh_gsmt'
tvectot,'thd_fgh_gsm',tot='thd_fgh_tot' ; just one quantity, Btot here
calc,"'thd_fce'=28.*'thd_fgh_tot'"
calc,"'thd_half_fce'='thd_fce'/2."
options,'thd_fce','linestyle','2'
options,'thd_half_fce','linestyle','1'
;
time_clip,'thd_scw_dsl_rot',twaveburst[0],twaveburst[1]
time_clip,'thd_efw_clean_dsl_rot',twaveburst[0],twaveburst[1]
split_vec,'thd_scw_dsl_rot_tclip'
split_vec,'thd_efw_clean_dsl_rot_tclip'
wav_data,'thd_scw_dsl_rot_tclip_x',maxpoints=2l^16l
wav_data,'thd_scw_dsl_rot_tclip_z',maxpoints=2l^16l
wav_data,'thd_efw_clean_dsl_rot_tclip_x',maxpoints=2l^16l
wav_data,'thd_efw_clean_dsl_rot_tclip_z',maxpoints=2l^16l
store_data,'thd_scw_dsl_x_wvlt_pow',data='thd_scw_dsl_rot_tclip_x_wv_pow thd_fce thd_half_fce'
store_data,'thd_scw_dsl_z_wvlt_pow',data='thd_scw_dsl_rot_tclip_z_wv_pow thd_fce thd_half_fce'
store_data,'thd_efw_clean_dsl_x_wvlt_pow',data='thd_efw_clean_dsl_rot_tclip_x_wv_pow thd_fce thd_half_fce'
store_data,'thd_efw_clean_dsl_z_wvlt_pow',data='thd_efw_clean_dsl_rot_tclip_z_wv_pow thd_fce thd_half_fce'
ylim,'thd_scw_dsl_?_wvlt_pow',30.,4000.,1
zlim,'thd_scw_dsl_?_wvlt_pow',1.e-10,1.e-3,1
ylim,'thd_efw_clean_dsl_?_wvlt_pow',30.,4000.,1
zlim,'thd_efw_clean_dsl_?_wvlt_pow',1.e-7,1.e1,1
;
store_data,'thd_ffp_16_scm3_fc',data='thd_ffp_16_scm3 thd_fce thd_half_fce'
store_data,'thd_ffp_16_eac34_fc',data='thd_ffp_16_eac34 thd_fce thd_half_fce'
ylim,'thd_ffp_16_scm3_fc thd_ffp_16_eac34_fc',30.,4000.,1
;
tlimit,twaveburst_narrow
tplot,['thd_fgh_gsmt','thd_efw_clean_dsl_?_wvlt_pow','thd_scw_dsl_?_wvlt_pow',$
  'thd_scw_dsl_rot_powspec','thd_scs_dsl_rot_degpol','thd_scw_dsl_rot_waveangle','thd_scw_dsl_rot_elliptict', $
  'thd_scw_dsl_rot_helict','thd_ffp_16_scm3_fc','thd_ffp_16_eac34_fc']
tplot_apply_databar
;
stop



; Get Poynting Flux [copy from thm_crib_poynting_flux.pro].
;
fsmin = 64. ; [Hz], the min freq. to perform S calcs
fsmax = 1./scwtres/2. ; [Hz], the max freq. to perform S calcs, this is f_Nyquist
fnyquist=1./scwtres/2.
npntswin=(1./scwtres)*(1/fsmin) ; number of points in window
;
; prepare quantities
time_clip,'thd_scw_dsl_rot',twaveburst_poynting[0],twaveburst_poynting[1],newname='thd_scw_dsl_rot4s'
time_clip,'thd_efw_clean_dsl_rot',twaveburst_poynting[0],twaveburst_poynting[1],newname='thd_efw_clean_dsl_rot4s'
calc," 'thx_scw4s' = 'thd_scw_dsl_rot4s' "
tdegap,'thx_scw4s',/over
tdeflag,'thx_scw4s','linear',/over
calc," 'thx_efw4s' = 'thd_efw_clean_dsl_rot4s' "
tdegap,'thx_efw4s',/over
tdeflag,'thx_efw4s','linear',/over
tinterpol_mxn,'thx_efw4s','thx_scw4s',/overwrite ; just making sure data at same time centers
; 
; filter above fsmin
tsmooth2,'thx_scw4s',npntswin
calc," 'thx_scw4s' = 'thx_scw4s' - 'thx_scw4s_sm' "
tsmooth2,'thx_efw4s',npntswin
calc," 'thx_efw4s' = 'thx_efw4s' - 'thx_efw4s_sm' "
;
; Get data
get_data,'thx_efw4s_sm',lim=lim,dlim=dlim,data=efw
get_data,'thx_scw4s_sm',lim=lim1,dlim=dlim1,data=scw
;
; Calculate Poynting flux (bandpass filtered, time domain)
ndata = n_elements(efw.x)       ;jmm, 22-may-2012 efw was interpolated earlier
S=dblarr(ndata,3)
E=efw.y
B=scw.y
filter=digital_filter(fsmin/fnyquist,fsmax/fnyquist,50,npntswin,/double)
for i=0,2 do E[*,i]=convol(E[*,i],filter,/center) ; this is bandpass filtering in time domain
for i=0,2 do B[*,i]=convol(B[*,i],filter,/center) ; this is bandpass filtering in time domain
S[*,0]= E[*,1]*B[*,2]-E[*,2]*B[*,1] 
S[*,1]=-E[*,0]*B[*,2]+E[*,2]*B[*,0]
S[*,2]= E[*,0]*B[*,1]-E[*,1]*B[*,0]
S_conversion=1d-3*1d-9*1d6/(4d-7*!dpi)  ; mV->V, nT->T, W->uW, divide by mu_0
S*=S_conversion
;for i=0,2 do S[*,i]=S[*,i]-smooth(S[*,i],npntswin) ; DO NOT LOW/HIGH PASS! ALREADY HIGH PASSED E, B!
store_data,'S_timeseries',data={x:efw.x,y:S},lim={ytitle:'Poynting flux '+strtrim(long(fsmin),1)+'-4096 Hz!C!C[!4l!3W/m2]'}
store_data,'S_tot1',    data={x:efw.x,y:sqrt(total(S*S,2))}
options,'S_timeseries','colors',['b','g','r']
;
split_vec,'S_timeseries'
tdpwrspc,'S_timeseries',nboxpoints=(1/scwtres)/4,nshiftpoints=(1/scwtres)/8 ; same params as for scw
wav_data,'S_timeseries_x',maxpoints=2l^16l
wav_data,'S_timeseries_z',maxpoints=2l^16l
zlim,'S_timeseries_?_wv_pow',2.e-10,5.e-4,1
ylim,'S_timeseries_?_wv_pow',30.,4000.,1
;
tlimit,twaveburst_narrow
tplot,['thd_fgh_gsmt','thd_efw_clean_dsl_?_wvlt_pow','thd_scw_dsl_?_wvlt_pow',$
  'thd_scw_dsl_rot_powspec','thd_scs_dsl_rot_degpol','thd_scw_dsl_rot_waveangle','thd_scw_dsl_rot_elliptict', $
  'thd_scw_dsl_rot_helict','S_timeseries','S_timeseries_z_wv_pow','S_timeseries_x_wv_pow']
tplot_apply_databar
;
stop
;
; Do the same in frequency domain
; 
; Perform FFTs for frequency-domain calculation
nfft=npntswin
stride=nfft/4
ndata=n_elements(efw.x)
efw_fft=dcomplexarr(long(ndata-nfft)/stride+1,nfft,3)
scw_fft=dcomplexarr(long(ndata-nfft)/stride+1,nfft,3)
win=hanning(nfft,/double)
win/=mean(win^2)  ; preserve energy
i=0L
for j=0L,ndata-nfft-1,stride do begin
  for k=0,2 do efw_fft[i,*,k]=fft(efw.y[j:j+nfft-1,k]*win)
  for k=0,2 do scw_fft[i,*,k]=fft(scw.y[j:j+nfft-1,k]*win)
  i++
endfor
t=scw.x[0]+(dindgen(i-1)*stride+nfft/2)/8192.
freq=(findgen(nfft/2)+0.5)*8192/nfft
bw=8192/nfft
efwlim={spec:1,zlog:1,ylog:0,yrange:[100,4096],ystyle:1,zrange:[1e-8,1e-4]}
scwlim={spec:1,zlog:1,ylog:0,yrange:[100,4096],ystyle:1,zrange:[1e-10,1e-6]}
store_data,'efw_fft_x',data={x:t,y:abs(efw_fft[*,0:nfft/2,0])^2/bw,v:freq},lim=efwlim
store_data,'efw_fft_y',data={x:t,y:abs(efw_fft[*,0:nfft/2,1])^2/bw,v:freq},lim=efwlim
store_data,'efw_fft_z',data={x:t,y:abs(efw_fft[*,0:nfft/2,2])^2/bw,v:freq},lim=efwlim
store_data,'scw_fft_x',data={x:t,y:abs(scw_fft[*,0:nfft/2,0])^2/bw,v:freq},lim=scwlim
store_data,'scw_fft_y',data={x:t,y:abs(scw_fft[*,0:nfft/2,1])^2/bw,v:freq},lim=scwlim
store_data,'scw_fft_z',data={x:t,y:abs(scw_fft[*,0:nfft/2,2])^2/bw,v:freq},lim=scwlim
;
; Calculate Poynting flux (frequency domain)
Sx= double(efw_fft[*,*,1]*conj(scw_fft[*,*,2])-efw_fft[*,*,2]*conj(scw_fft[*,*,1]))*S_conversion
Sy=-double(efw_fft[*,*,0]*conj(scw_fft[*,*,2])-efw_fft[*,*,2]*conj(scw_fft[*,*,0]))*S_conversion
Sz= double(efw_fft[*,*,0]*conj(scw_fft[*,*,1])-efw_fft[*,*,1]*conj(scw_fft[*,*,0]))*S_conversion
bw=8192/nfft
indx=where(freq ge 128.)
Stot=sqrt(total(Sx[*,indx]^2+Sy[*,indx]^2+Sz[*,indx]^2,2))
zrange=max(Stot)*0.1*[-1,1]/bw
store_data,'S_x',     data={x:t,y:Sx/bw,v:freq},lim={spec:1,zlog:0,ylog:0,yrange:[100,4096],ystyle:1,zrange:zrange,ytitle:'Poynting flux S!Bx!N!C!C[!4l!3W/m!A2!N/Hz]'}
store_data,'S_y',     data={x:t,y:Sy/bw,v:freq},lim={spec:1,zlog:0,ylog:0,yrange:[100,4096],ystyle:1,zrange:zrange,ytitle:'Poynting flux S!By!N!C!C[!4l!3W/m!A2!N/Hz]'}
store_data,'S_z',     data={x:t,y:Sz/bw,v:freq},lim={spec:1,zlog:0,ylog:0,yrange:[100,4096],ystyle:1,zrange:zrange,ytitle:'Poynting flux S!Bz!N!C!C[!4l!3W/m!A2!N/Hz]'}
store_data,'S_tot2',data={x:t,y:Stot},lim={color:1}
store_data,'S_tot' ,data=['S_tot1','S_tot2'],lim={ytitle:'|S| '+strtrim(long(fsmin),1)+'-4096 Hz!C!C[!4l!3W/m2]'}
;
tlimit,twaveburst_poynting
tplot,['thd_fgh_gsmt','thd_efw_clean_dsl_?_wvlt_pow','thd_scw_dsl_?_wvlt_pow',$
  'thd_scw_dsl_rot_powspec','thd_scs_dsl_rot_degpol','thd_scw_dsl_rot_waveangle','thd_scw_dsl_rot_elliptict', $
  'thd_scw_dsl_rot_helict','S_tot','S_timeseries','S_timeseries_z_wv_pow']
tplot_apply_databar
;
stop
;
makepng,'Hwk05_01_thd_Fig7'
;
;
end


