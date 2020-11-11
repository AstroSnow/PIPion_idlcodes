;Context figure for the equilibrium state in the MHD (black), IRIP (solid) and IR (dashed) cases. The blue (red) line is for the plasma (neutral) species for the two-fluid cases.
;REQUIRES SIMULATION DATA

;rdmpi,ds,datapath='../snapshot',time_step=150
rdmpi,ds,datapath='../Simulations/Data',time_step=200
;rdmpi,ds,datapath='../Simulations/IRIP_t12000_r1e-3_beta0.1',time_step=200
rdmpi,dsm,datapath='../Data_mhd',time_step=200
;rdmpi,dsk,datapath='../Data_kho',time_step=85
rdmpi,dsk,datapath='../Simulations/IR_t10000_r1e-3_beta0.1_r',time_step=200

;interpolation grid to reduce file size
xg=exp(findgen(10001)/10000.0*6.0-5.0)

tp=ds.pr_p/ds.ro_p*5.0/6.0
tn=ds.pr_n/ds.ro_n*5.0/3.0
tpk=dsk.pr_p/dsk.ro_p*5.0/6.0
tnk=dsk.pr_n/dsk.ro_n*5.0/3.0
tm=dsm.pr_p/dsm.ro_p*5.0/3.0

thicklv=2

;Upper left
pv=plot(xg,interpol(ds.vx_p,ds.x/ds.t(0),xg),xr=[0.01,2.0],/xlog,xtitle='x/t',ytitle='$v_x$',margin=0.15,layout=[2,2,1],dimension=[970,600],font_size=14,thick=thicklv, yr=[-0.35,0.02],'b',name='IRIP p')
pv1=plot(xg,interpol(ds.vx_n,ds.x/ds.t(0),xg),/overplot,'r',thick=thicklv,name='IRIP n')
pv2=plot(xg,interpol(dsm.vx_p,dsm.x/dsm.t(0),xg),/overplot,'k',thick=thicklv,name='MHD')
pv3=plot(xg,interpol(dsk.vx_p,dsk.x/dsk.t(0),xg),/overplot,'b--',thick=thicklv,name='IR p')
pv4=plot(xg,interpol(dsk.vx_n,dsk.x/dsk.t(0),xg),/overplot,'r--',thick=thicklv,name='IR n')
pv.position=[0.12,0.57,0.47,0.97]
;t=text(0.17,0.87,'Rarefaction wave',font_size=14,target=[pv],/relative) 
;a1=arrow([0.8,1.0],[-0.03,-0.05],data=1,/current)
;t2=text(0.1,0.22,'Inflow',font_size=14,target=[pv],/relative)
;a2=arrow([0.3,0.3],[-0.24,-0.2],data=1,/current)
l=legend(target=[pv,pv1,pv2,pv3,pv4])
l.font_size=13
l.position=[0.9,0.475] 


;Upper right
pb=plot(xg,interpol(ds.pr_p,ds.x/ds.t(0),xg),xr=[0.01,2.0],/xlog,xtitle='x/t',ytitle='$Pressure$',margin=0.15,layout=[2,2,2],/current,font_size=14,thick=thicklv,'b',/ylog)
pb=plot(xg,interpol(ds.pr_n,ds.x/ds.t(0),xg),/overplot,'r',thick=thicklv)
pb=plot(xg,interpol(dsm.pr_p,dsm.x/dsm.t(0),xg),/overplot,'k',thick=thicklv)
pv3=plot(xg,interpol(dsk.pr_p,dsk.x/dsk.t(0),xg),/overplot,'b--',thick=thicklv)
pv4=plot(xg,interpol(dsk.pr_n,dsk.x/dsk.t(0),xg),/overplot,'r--',thick=thicklv)
pb.position=[0.57,0.57,0.92,0.97]
;t=text(0.6,0.0,'MHD Solution',font_size=14,target=[pb],/relative,data=1)
;t=text(0.6,-0.1,'$\beta = 1.0, B_x = 0.1$',font_size=14,target=[pb],/relative,data=1)
;pvz=plot(ds.x/ds.t(0),tp,xr=[0.0,0.1],margin=0.15,'b',/current,font_size=10,yr=[0.05,0.15],thick=thicklv)
;pv2z=plot(ds.x/ds.t(0),tn,/overplot,'r',thick=thicklv)
;pv2z=plot(dsm.x/dsm.t(0),tm,/overplot,'k',thick=thicklv)
;pvz.position=[0.67,0.70,0.89,0.94]
;pvz.xtickvalues=[0,0.02,0.04,0.06,0.08,0.1]
;pl=plot([0.04,0.08],[0,0],/overplot)
;t=text(0.005,0.095,'Magnetic field',font_size=14,target=[pvz],/relative,data=1)
;t=text(0.005,0.055,'reversal',font_size=14,target=[pvz],/relative,data=1)
;a1=arrow([0.035,0.05],[0.065,0.03],data=1,/current,target=[pvz])

;Lower left
pvz=plot(xg,interpol(ds.ro_p,ds.x/ds.t(0),xg),xr=[0.01,2.0],/xlog,xtitle='x/t',ytitle='$\rho$',margin=0.15,layout=[2,2,3],/current,font_size=14,thick=thicklv,'b',/ylog)
pv=plot(xg,interpol(ds.ro_n,ds.x/ds.t(0),xg),/overplot,'r',thick=thicklv)
;pv=plot(ds.x/ds.t(0),ds.ro_n+ds.ro_p,/overplot,'g',thick=thicklv)
pv3=plot(xg,interpol(dsk.ro_p,dsk.x/dsk.t(0),xg),/overplot,'b--',thick=thicklv)
pv4=plot(xg,interpol(dsk.ro_n,dsk.x/dsk.t(0),xg),/overplot,'r--',thick=thicklv)
pv=plot(xg,interpol(dsm.ro_p,dsm.x/dsm.t(0),xg),/overplot,'k',thick=thicklv)
pvz.position=[0.12,0.08,0.47,0.48]
pvz.ytickunits='Scientific'
;t=text(0.2,0.2,'Outflow',font_size=14,target=[pvz],/relative)
;a1=arrow([0.3,0.07],[-0.73,-0.73],data=1,/current,target=[pvz])

;Lower right
pb=plot(xg,interpol(ds.by,ds.x/ds.t(0),xg),xr=[0.01,2.0],/xlog,xtitle='x/t',ytitle='$B_y$',margin=0.15,layout=[2,2,2],/current,font_size=14,thick=thicklv,'b',yr=[-1.2,0.2])
pb=plot(xg,interpol(dsm.by,dsm.x/dsm.t(0),xg),/overplot,'k',thick=thicklv)
pv3=plot(xg,interpol(dsk.by,dsk.x/dsk.t(0),xg),/overplot,'b--',thick=thicklv)
pb.position=[0.57,0.08,0.92,0.48]
;t=text(0.6,0.0,'MHD Solution',font_size=14,target=[pb],/relative,data=1)
;t=text(0.6,-0.1,'$\beta = 1.0, B_x = 0.1$',font_size=14,target=[pb],/relative,data=1)
;pvz=plot(ds.x/ds.t(0),ds.by,xr=[0.0,0.05],margin=0.15,'b',/current,font_size=10,yr=[-0.2,0.2],thick=thicklv)
;pv2z=plot(dsm.x/dsm.t(0),dsm.by,/overplot,'k--',thick=thicklv)
;pvz.position=[0.67,0.22,0.89,0.44]
;pvz.xtickvalues=[0,0.02,0.04]
;t=text(0.005,0.095,'Magnetic field',font_size=14,target=[pvz],/relative,data=1)
;t=text(0.005,0.055,'reversal',font_size=14,target=[pvz],/relative,data=1)
;a1=arrow([0.024,0.03],[0.065,0.03],data=1,/current,target=[pvz])

;p.save,'Figures/paperbothmulti.pdf'

end
