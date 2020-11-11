;radttemp
;Plasma (solid) and neutral (dashed) temperatures for different initial recombination rates. The orange dashed line shows the downstream MHD temperature.

orange=[255,194,10]

rdmpi,ds0,datapath='../Simulations/Data_t10000_r-3_e3',var=['pr_p','pr_n','ro_n','ro_p'],time_step=[39]
rdmpi,ds1,datapath='../Simulations/Data_t10000_r-5_e3',var=['pr_p','pr_n','ro_n','ro_p'],time_step=[38]
rdmpi,ds2,datapath='../Simulations/Data_t10000_r-6_e3',var=['pr_p','pr_n','ro_n','ro_p'],time_step=[39]
rdmpi,ds3,datapath='../Simulations/Data_t10000_r-7_e3',var=['pr_p','pr_n','ro_n','ro_p'],time_step=[39]

rdmpi,dsm,datapath='../Data_mhd_bx_0.3_beta_0.1',var=['pr_p','ro_p'],time_step=[0,100]

t0=ds0.pr_p/ds0.ro_p*5.0/6.0
t0n=ds0.pr_n/ds0.ro_n*5.0/3.0

t1=ds1.pr_p/ds1.ro_p*5.0/6.0
t1n=ds1.pr_n/ds1.ro_n*5.0/3.0

t2=ds2.pr_p/ds2.ro_p*5.0/6.0
t2n=ds2.pr_n/ds2.ro_n*5.0/3.0

t3=ds3.pr_p/ds3.ro_p*5.0/6.0
t3n=ds3.pr_n/ds3.ro_n*5.0/3.0

tm=dsm.pr_p/dsm.ro_p*5.0/3.0


p0=plot(ds0.x/ds0.t(0),t0,xr=[0,0.1],xtitle='x/t',ytitle='Temperature',dimension=[970,600],thick=3, font_size=16,name='$\tau_{IR}=10^{-3}$')
p0n=plot(ds0.x/ds0.t(0),t0n,/overplot,'--',thick=3)

p1=plot(ds1.x/ds1.t(0),t1,/overplot,'r',thick=3,name='$\tau_{IR}=10^{-5}$')
p1n=plot(ds1.x/ds1.t(0),t1n,/overplot,'r--',thick=3)

p2=plot(ds2.x/ds2.t(0),t2,/overplot,'g',thick=3,name='$\tau_{IR}=10^{-6}$')
p2n=plot(ds2.x/ds2.t(0),t2n,/overplot,'g--',thick=3)

p3=plot(ds3.x/ds3.t(0),t3,/overplot,'b',thick=3,name='$\tau_{IR}=10^{-7}$')
p3n=plot(ds3.x/ds3.t(0),t3n,/overplot,'b--',thick=3)

pini=plot([0.,1.0],tm(1,1)*[1.0,1.0],/overplot,'--',thick=3,color=orange,name='MHD')

l=legend(target=[p0,p1,p2,p3],font_size=16)
l.position=[0.36,0.75]

END
