;Alfven Mach numbers for the MHD (black) and plasma (blue) based on the bulk density. The red line shows the neutral sonic Mach number.
;Requires simulation data

rdmpi,ds,datapath='../Simulations/Data',time_step=200
rdmpi,dsm,datapath='../Data_mhd',time_step=200

a=min(deriv(ds.vx_p),b)
vs=ds.x(b)/ds.t(0)
xs=ds.x/ds.t(0)-vs

am=min(deriv(dsm.vx_p),bm)
vsm=dsm.x(bm)/dsm.t(0)
xsm=dsm.x/dsm.t(0)-vsm

a=min(deriv(ds.vx_n),bn)                          
vsn=ds.x(bn)/ds.t(0) 


va=ds.bx/sqrt(ds.ro_p+ds.ro_n)
vam=dsm.bx/sqrt(dsm.ro_p)

csn=sqrt(5.0/3.0*ds.pr_n/ds.ro_n)


pp=plot(xs,abs(ds.vx_p-vs)/va,thick=3,xr=[-0.002,0.002],xtitle='$x_s$', ytitle='$Mach number$',dimension=[970,600],font_size=18,'b',name='Alfven')
pmhd=plot(xsm,abs(dsm.vx_p-vsm)/vam,/overplot,'--',thick=3,name='MHD')

pn=plot(xs,abs(ds.vx_n-vsn)/csn,/overplot,'r',thick=3,name='Sound')


l=legend(target=[pmhd,pp,pn],position=[0.85,0.35],font_size=18)
END
