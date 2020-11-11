;initial temperature 
;$v_x$ plasma velocity for different reference temperatures showing the equilibrium state after 40000 collisional times.

xg=exp(findgen(10001)/10000.0*6.0-5.0)

rdmpi,ds0,datapath='../Simulations/Data',time_step=200
rdmpi,ds2,datapath='../Simulations/IRIP_t12000_r1e-3_beta0.1',time_step=200
rdmpi,ds4,datapath='../Simulations/IRIP_t14000_r1e-3_beta0.1',time_step=200
;rdmpi,ds6,datapath='../Simulations/IRIP_t16000_r1e-3_beta0.1',time_step=100

t0=ds0.pr_p/ds0.ro_p*5.0/6.0
t2=ds2.pr_p/ds2.ro_p*5.0/6.0
t4=ds4.pr_p/ds4.ro_p*5.0/6.0

p0=plot(xg,interpol(ds0.vx_p,ds0.x/ds0.t(0),xg),xr=[0.01,2],/xlog,xtitle='x/t',ytitle='$v_x$',dimension=[970,600],name='$T_0=10000 K (\xi_n=0.997$)',font_size=16,thick=3)
p2=plot(xg,interpol(ds2.vx_p,ds2.x/ds2.t(0),xg),/overplot,'r',name='$T_0=12000 K (\xi_n=0.957)$',thick=3)
p4=plot(xg,interpol(ds4.vx_p,ds4.x/ds4.t(0),xg),/overplot,'b',name='$T_0=14000 K (\xi_n=0.741)$',thick=3)
;p6=plot(xg,interpol(ds6.vx_p,ds6.x/ds6.t(0),xg),/overplot,'g',name='16000',thick=3)

l=legend(target=[p0,p2,p4],font_size=16,position=[0.7,0.8])

END
