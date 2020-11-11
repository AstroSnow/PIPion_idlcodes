;Time series for the IRIP case after 1 (top), 10 (middle) and 100 (lower) collisional times showing the $v_x$ velocity (left), temperature (centre), and ionisation and recombination rates (right).
;Requires simulation data

thval=2 ; thickness of the plots
orange=[255,194,10]
purple=[93,58,155]
green=[26,255,26]

rdmpi,ds3,datapath='../Data_time_series3',time_step=[10]
rdmpi,ds2,datapath='../Data_time_series2',time_step=[1,10]
rdmpi,ds,datapath='../Data_time_series',time_step=[100]

;interpolation grid to reduce file size
xg=exp(findgen(10001)/10000.0*10.3-7.0)

tp=ds.pr_p/ds.ro_p*5.0/6.0
tn=ds.pr_n/ds.ro_n*5.0/3.0

tp2=ds2.pr_p/ds2.ro_p*5.0/6.0
tn2=ds2.pr_n/ds2.ro_n*5.0/3.0

tp3=ds3.pr_p/ds3.ro_p*5.0/6.0
tn3=ds3.pr_n/ds3.ro_n*5.0/3.0

;time step 1
p=plot(ds3.x/ds3.t(0),ds3.vx_p(*,0),xr=[0.001,25],xtitle='x/t',ytitle='$v_x$',thick=thval,'b',layout=[3,3,1],/xlog,dimension=[970,600],margin=[0.18,0.18,0.05,0.1],name='Plasma')
pn=plot(ds3.x/ds3.t(0),ds3.vx_n(*,0),'r',/overplot,name='Neutral',thick=thval)
l=legend(target=[p,pn])
l.position=[0.64,0.95]
l.sample_width=[0.1]

p=plot(ds3.x/ds3.t(0),tp3(*,0),xr=[0.001,25],xtitle='x/t',ytitle='$T$',thick=thval,'b',layout=[3,3,2],/current,/xlog ,margin=[0.18,0.18,0.05,0.1])
pn=plot(ds3.x/ds3.t(0),tn3(*,0),'r',/overplot,thick=thval)

p=plot(ds3.x/ds3.t(0),ds3.ion(*,0),xr=[0.001,25],xtitle='x/t',ytitle='$\Gamma _{rec},\Gamma _{ion}$',thick=thval,color=orange,layout=[3,3,3],/current,/ylog,/xlog ,margin=[0.18,0.18,0.05,0.1],name='$\Gamma _{ion}$')
pn=plot(ds3.x/ds3.t(0),ds3.rec(*,0),color='g',/overplot,name='$\Gamma _{rec}$',thick=thval)
l2=legend(target=[p,pn])
l2.position=[0.97,0.95]
l2.sample_width=[0.1]
l2.font_size=14

;time step 10
p=plot(ds2.x/ds2.t(1),ds2.vx_p(*,1),xr=[0.001,25],xtitle='x/t',ytitle='$v_x$',thick=thval,'b',layout=[3,3,4],/current,/xlog ,margin=[0.18,0.18,0.05,0.1])
pn=plot(ds2.x/ds2.t(1),ds2.vx_n(*,1),'r',/overplot,thick=thval)

p=plot(ds2.x/ds2.t(1),tp2(*,1),xr=[0.001,25],xtitle='x/t',ytitle='$T$',thick=thval,'b',layout=[3,3,5],/current,/xlog ,margin=[0.18,0.18,0.05,0.1])
pn=plot(ds2.x/ds2.t(1),tn2(*,1),'r',/overplot,thick=thval)

p=plot(ds2.x/ds2.t(1),ds2.ion(*,1),xr=[0.001,25],xtitle='x/t',ytitle='$\Gamma _{rec},\Gamma _{ion}$',thick=thval,color=orange,layout=[3,3,6],/current,/ylog,/xlog ,margin=[0.18,0.18,0.05,0.1])
pn=plot(ds2.x/ds2.t(1),ds2.rec(*,1),'g',/overplot,thick=thval)


;time step 100
p=plot(xg,interpol(ds.vx_p,ds.x/ds.t(0),xg),xr=[0.001,25],xtitle='x/t',ytitle='$v_x$',thick=thval,'b',layout=[3,3,7],/current,/xlog ,margin=[0.18,0.18,0.05,0.1])
pn=plot(xg,interpol(ds.vx_n,ds.x/ds.t(0),xg),'r',/overplot,thick=thval)

p=plot(xg,interpol(tp,ds.x/ds.t(0),xg),xr=[0.001,25],xtitle='x/t',ytitle='$T$',thick=thval,'b',layout=[3,3,8],/current,/xlog ,margin=[0.18,0.18,0.05,0.1])
pn=plot(xg,interpol(tn,ds.x/ds.t(0),xg),'r',/overplot,thick=thval)

p=plot(xg,interpol(ds.ion,ds.x/ds.t(0),xg),xr=[0.001,25],xtitle='x/t',ytitle='$\Gamma _{rec},\Gamma _{ion}$',thick=thval,color=orange,layout=[3,3,9],/current,/ylog,/xlog ,margin=[0.18,0.18,0.05,0.1])
pn=plot(xg,interpol(ds.rec,ds.x/ds.t(0),xg),color='g',/overplot,thick=thval)

END
