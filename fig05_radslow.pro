;Close-up of the slow mode shock for the IRIP model showing $v_x$ velocity (top left), temperature (top right) and density (lower left) for plasma (blue) and neutral (red) species. The lower right panel shows the ionisation (orange) and recombination (green) rates.
;Requires simulation data

orange=[255,194,10]

;rdmpi,ds,datapath='../snapshot',time_step=150
rdmpi,ds,datapath='../Simulations/Data',time_step=200
rdmpi,dsm,datapath='../Data_mhd',time_step=200
rdmpi,dsk,datapath='../Data_kho',time_step=85

tp=ds.pr_p/ds.ro_p*5.0/6.0
tn=ds.pr_n/ds.ro_n*5.0/3.0
tm=dsm.pr_p/dsm.ro_p*5.0/3.0

thicklv=2

;Upper left
pv=plot(ds.x/ds.t(0),ds.vx_p,xr=[0.03,0.035],xtitle='x/t',ytitle='$v_x$',margin=0.15,layout=[2,2,1],dimension=[970,600],font_size=14,thick=thicklv, yr=[-0.35,0.02],'b')
pv=plot(ds.x/ds.t(0),ds.vx_n,/overplot,'r',thick=thicklv)
;pv=plot(dsm.x/dsm.t(0),dsm.vx_p,/overplot,'k',thick=thicklv)
;pv=plot(dsk.x/dsk.t(0),dsk.vx_p,/overplot,'b--',thick=thicklv)
;pv=plot(dsk.x/dsk.t(0),dsk.vx_n,/overplot,'r--',thick=thicklv)
pv.position=[0.1,0.57,0.45,0.97]
;t=text(0.17,0.87,'Rarefaction wave',font_size=14,target=[pv],/relative) 
;a1=arrow([0.8,1.0],[-0.03,-0.05],data=1,/current)
;t2=text(0.1,0.22,'Inflow',font_size=14,target=[pv],/relative)
;a2=arrow([0.3,0.3],[-0.24,-0.2],data=1,/current)


;Upper right
pb=plot(ds.x/ds.t(0),tp,xr=[0.03,0.035],xtitle='x/t',ytitle='$Temperature$',margin=0.15,layout=[2,2,2],/current,font_size=14,thick=thicklv,'b')
pb=plot(ds.x/ds.t(0),tn,/overplot,'r',thick=thicklv)
;pb=plot(dsm.x/dsm.t(0),tm,/overplot,'k',thick=thicklv)
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
pvz=plot(ds.x/ds.t(0),ds.ro_p,xr=[0.03,0.035],xtitle='x/t',ytitle='$\rho$',margin=0.15,layout=[2,2,3],/current,font_size=14,thick=thicklv,'b',/ylog)
pv=plot(ds.x/ds.t(0),ds.ro_n,/overplot,'r',thick=thicklv)
;pv=plot(ds.x/ds.t(0),ds.ro_n+ds.ro_p,/overplot,'g',thick=thicklv)
;pv=plot(dsm.x/dsm.t(0),dsm.ro_p,/overplot,'k',thick=thicklv)
pvz.position=[0.1,0.08,0.45,0.48]
pvz.ytickunits='Scientific'
;t=text(0.2,0.2,'Outflow',font_size=14,target=[pvz],/relative)
;a1=arrow([0.3,0.07],[-0.73,-0.73],data=1,/current,target=[pvz])

;Lower right
pb=plot(ds.x/ds.t(0),ds.ion,xr=[0.03,0.035],xtitle='x/t',ytitle='$\Gamma_{ion},\Gamma_{rec}$',margin=0.15,layout=[2,2,2],/current,font_size=14,thick=thicklv,color=orange,/ylog)
pb=plot(ds.x/ds.t(0),ds.rec,/overplot,'g',thick=thicklv)
pb.position=[0.57,0.08,0.92,0.48]
;t=text(0.6,0.0,'MHD Solution',font_size=14,target=[pb],/relative,data=1)
;t=text(0.6,-0.1,'$\beta = 1.0, B_x = 0.1$',font_size=14,target=[pb],/relative,data=1)
;pvz=plot(ds.x/ds.t(0),ds.by,xr=[0.0,0.05],margin=0.15,'b',/current,font_size=10,yr=[-0.2,0.2],thick=thicklv)
;pv2z=plot(dsm.x/dsm.t(0),dsm.by,/overplot,'k--',thick=thicklv)
;pvz.position=[0.67,0.22,0.89,0.44]
;pvz.xtickvalues=[0,0.02,0.04]
;pl=plot([0.04,0.08],[0,0],/overplot)
;t=text(0.005,0.095,'Magnetic field',font_size=14,target=[pvz],/relative,data=1)
;t=text(0.005,0.055,'reversal',font_size=14,target=[pvz],/relative,data=1)
;a1=arrow([0.024,0.03],[0.065,0.03],data=1,/current,target=[pvz])

;p.save,'Figures/paperbothmulti.pdf'

end
