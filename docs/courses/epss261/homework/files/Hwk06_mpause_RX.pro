;
; make sure you run the latest (bleeding edge) of the SPEDAS distribution
;
cwdirname='C:\My Documents\ucla\teaching\EPSS_261_2025_Winter_DA\Homeworks\Hwk06'
cwd,cwdirname
;
mms_init ; this sets color options and things like that. It is not necessary but useful.
tplot_options, 'xmargin', [20,9] ; mms has looooong names so extend x size!
;
tstart='2015/10/16 13:05:30'
tduration=2. ; minutes
tend=time_string(time_double(tstart)+tduration*60.)
timespan,tstart,tduration,/minutes
tBurchFig2=[tstart,tend]
tBurchFig3='2015/10/16 '+['13:07:00.5','13:07:03.5']
;
sclet='2'
mysc='mms'+sclet
;
ident=[1,1,1]
;
; Introduce FPI Data
; 
mms_load_state, probes = sclet
mms_load_fgm, probes = sclet ; default is survey
mms_load_fpi, probes = sclet, datatype=['des-dist', 'dis-dist', 'dis-moms', 'des-moms'] ; loads specific datatype vars
;
; Introduce EDP data
;
mms_load_edp, data_rate='slow', probes=sclet ; pick your rate, since edp can have a lot of data!
options,'*','databar',0.
;
; rotate data to LMN coord's
;
dtmpause=['2015/10/16 13:05:40','2015/10/16 13:06:09'] ; to get N
dtmsphere=['2015/10/16 13:05:31','2015/10/16 13:05:32']; to get L
;
; obtain single matrix to rotate to LMN coords (limit interval to dtmpause !)
minvar_matrix_make,'mms2_fgm_b_gse_srvy_l2_bvec',tstart=dtmpause[0],tstop=dtmpause[1],tminname='Ngsedir' ; this gives N-direction
Bxyz_msphere=spd_tplot_average('mms2_fgm_b_gse_srvy_l2_bvec',dtmsphere)
Lgsedir=Bxyz_msphere/sqrt(total(double(Bxyz_msphere)^2)) ; unit vector L
get_data,'Ngsedir',data=minusNgsedir ; actually this is radially inward so reverse it
Ngsedir = double(-minusNgsedir.y)
Mgsedir=crossp(Ngsedir,Lgsedir)
Mgsedir=Mgsedir/sqrt(total(double(Mgsedir)^2))
get_data,'mms2_fgm_b_gse_srvy_l2_bvec_mva_mat',data=mymat,dlim=mydlim,lim=mylim ; just to get dlim and lim, nothing else
GSE2LMNrotmat=transpose([[reform(Lgsedir)],[reform(Mgsedir)],[reform(Ngsedir)]]) ; check N is 3rd column (reform ensures row). So GSE2LMNrotmat#Ngsedir=[0,0,1]
GSE2LMNrotmat=reform(GSE2LMNrotmat,1,3,3) ; matrix expected to be (N,3,3) where N is number of times, here N=1
store_data,'mms2_fgm_b_gse_srvy_l2_bvec_lmn_mat',data={x:mymat.x,y:GSE2LMNrotmat},dlim=mydlim,lim=mylim ; use dlim, lim from above
;
; rotate fgm srvy data 
tvector_rotate,'mms2_fgm_b_gse_srvy_l2_bvec_lmn_mat','mms2_fgm_b_gse_srvy_l2_bvec',newname='mms2_fgm_b_lmn_srvy_l2_bvec'
tvectot,'mms2_fgm_b_lmn_srvy_l2_bvec',newname='mms2_fgm_b_lmn_srvy_l2_bvect'
options,'*','databar',0.
options,'mms2_fgm_b_lmn_srvy_l2_bvec*','labels',['BL','BM','BN','BT']
;
; rotate edp fast data
tvector_rotate,'mms2_fgm_b_gse_srvy_l2_bvec_lmn_mat','mms2_edp_dce_gse_fast_l2',newname='mms2_edp_dce_lmn_fast_l2'
options,'*','databar',0.
options,'mms2_edp_dce_lmn_fast_l2','labels',['EL','EM','EN']
ylim,'mms2_edp_dce_lmn_fast_l2',-20,20,0
;
; rotate dis fast data, ignore "ERROR: Input matrices are not valid rotation matries."
tvector_rotate,'mms2_fgm_b_gse_srvy_l2_bvec_lmn_mat','mms2_dis_bulkv_gse_fast',newname='mms2_dis_bulkv_lmn_fast'
options,'mms2_dis_bulkv_lmn_fast','labels',['VL','VM','VN']
options,'*','databar',0.

; rotate des fast data, ignore "ERROR: Input matrices are not valid rotation matries."
tvector_rotate,'mms2_fgm_b_gse_srvy_l2_bvec_lmn_mat','mms2_des_bulkv_gse_fast',newname='mms2_des_bulkv_lmn_fast'
options,'*','databar',0.


; get J = N*e*(Vi-Ve)
Jbulkv_scale=0.16/1000. ; microA/m2 from (1/cc)*e*km/s, that's huge
tinterpol_mxn,'mms2_dis_bulkv_lmn_fast','mms2_dis_bulkv_lmn_fast',newname='mms2_dis_bulkv_lmn_fast_int'
calc,"'mms2_Jbulkv_lmn_fast' = Jbulkv_scale*('mms2_des_numberdensity_fast'#ident)*('mms2_dis_bulkv_lmn_fast_int'-'mms2_des_bulkv_lmn_fast')
ylim,'mms2_Jbulkv_lmn_fast',0,0,0
options,'mms2_Jbulkv_lmn_fast','colors',['b','g','r']
options,'mms2_Jbulkv_lmn_fast','labels',['JL','JM','JN']
options,'*','databar',0.


; get Vi_perp, Ve_perp (lmn coords)
; 
tinterpol_mxn,'mms2_fgm_b_lmn_srvy_l2_bvec','mms2_dis_bulkv_lmn_fast',newname='mms2_fgm_b_lmn_srvy_l2_bvec_intVi'
tnormalize,'mms2_fgm_b_lmn_srvy_l2_bvec_intVi',newname='BintVihat' ; this is the unit B for interpolated data onto Vi
calc,"'mms2_dis_bulkv_lmn_fast_par'= total('BintVihat'*'mms2_dis_bulkv_lmn_fast',2)" ; get dot product
calc," 'mms2_dis_bulkv_lmn_fast_per'='mms2_dis_bulkv_gse_fast'-('mms2_dis_bulkv_lmn_fast_par'#ident)*'BintVihat'"
tvectot,'mms2_dis_bulkv_lmn_fast_per',tot='mms2_dis_bulkv_lmn_fast_per_tot'
;
tinterpol_mxn,'mms2_fgm_b_lmn_srvy_l2_bvec','mms2_des_bulkv_lmn_fast',newname='mms2_fgm_b_lmn_srvy_l2_bvec_intVe'
tnormalize,'mms2_fgm_b_lmn_srvy_l2_bvec_intVe',newname='BintVehat' ; this is the unit B for interpolated data onto Vi
calc,"'mms2_des_bulkv_lmn_fast_par'= total('BintVehat'*'mms2_des_bulkv_lmn_fast',2)" ; get dot product
calc," 'mms2_des_bulkv_lmn_fast_per'='mms2_des_bulkv_lmn_fast'-('mms2_des_bulkv_lmn_fast_par'#ident)*'BintVehat'"
tvectot,'mms2_des_bulkv_lmn_fast_per',tot='mms2_des_bulkv_lmn_fast_per_tot'
;
store_data,'mms2_dxs_bulkv_lmn_fast_per_tot',data='mms2_dis_bulkv_lmn_fast_per_tot mms2_des_bulkv_lmn_fast_per_tot'
options,'mms2_dxs_bulkv_lmn_fast_per_tot','colors',['b','r']
options,'mms2_dxs_bulkv_lmn_fast_per_tot','labels',['Viper_t','Veper_t']
;
store_data,'mms2_des_temppxxx_fast',data='mms2_des_temppara_fast mms2_des_tempperp_fast'
options,'mms2_des_temppxxx_fast','colors',['b','r']
options,'mms2_des_temppxxx_fast','labels',['Tepar','Teper']
;
ylim,'*bulkv*',-400,400,0
ylim,'*bulkv*tot',0,0,0
options,'*bulkv*','databar',0.
store_data,mysc+'_'+'dxs_numberdensities_fast',data=mysc+'_'+['dis_numberdensity_fast','des_numberdensity_fast']
ylim,'*numberdens*',0.1,50.,1
tplot,mysc+'_'+['fgm_b_lmn_srvy_l2_bvect','dis_energyspectr_omni_fast', 'des_energyspectr_omni_fast' , $
                'dxs_numberdensities_fast','dis_bulkv_lmn_fast','dxs_bulkv_lmn_fast_per_tot','Jbulkv_lmn_fast', $
                 'des_temppxxx_fast','edp_dce_lmn_fast_l2']
tplot_apply_databar


;
; now plot the para, perp and anti-parallel spectra of electrons
; 
ylim,'*des_energyspectr_*_fast',10,1000,1
tplot,mysc+'_'+['fgm_b_lmn_srvy_l2_bvect','dis_energyspectr_omni_fast', 'des_energyspectr_omni_fast' , $
  'numberdensities','dis_bulkv_lmn_fast','dxs_bulkv_lmn_fast_per_tot','Jbulkv_lmn_fast', $
  'des_temppxxx_fast','edp_dce_lmn_fast_l2', $
  'des_energyspectr_par_fast','des_energyspectr_perp_fast','des_energyspectr_anti_fast']
tplot_apply_databar
makepng,'Hwk06_mpause_RX_Fig1'



;
; Introduce FPI burst data (this example only shows survey data).
; 
; Here you have to proceed with caution, one command at a time.
;
mms_load_fpi, probes = sclet, datatype=['des-dist', 'dis-dist', 'dis-moms', 'des-moms'], data_rate='brst' ; loads specific datatype vars
;
mms_load_edp, datatype='scpot', probes=sclet
;
mms_part_getspec,mysc+'_'+'des_dist_brst',outputs='moments energy',sc_pot_name=mysc+'_'+'edp_scpot_fast_l2'
;
mms_part_getspec,mysc+'_'+'dis_dist_brst',outputs='moments energy',sc_pot_name=mysc+'_'+'edp_scpot_fast_l2'
ylim,'*dis*bulkv*',-400,400,0
ylim,'*des*bulkv*',0,0,0

store_data,mysc+'_'+'dxs_numberdensities_brst',data=mysc+'_'+['dis_numberdensity_brst','des_numberdensity_brst']
ylim,'*numberdens*',0.1,50.,1
options,'*numberdensities*','colors',['b','r']

store_data,'mms2_des_energyspectr_omni_brst_pot',data='mms2_des_energyspectr_omni_brst mms2_edp_scpot_fast_l2'
ylim,'mms2_des_energyspectr_omni_brst_pot',12,25000.,1
;
; see what's produced, for example below:
tplot,mysc+'_'+['fgm_b_gse_srvy_l2','dxs_numberdensities_brst','dis_bulkv_gse_brst','des_bulkv_gse_brst', $
  'dis_energyspectr_omni_brst', 'des_energyspectr_omni_brst_pot']
tplot_apply_databar
;
; continue from this point
;
end


