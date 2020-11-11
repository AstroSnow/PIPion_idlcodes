;Energies across the system for the MHD (black) and IRIP cases (red neutrals, blue plasma). The quantity $A_{heat}- \phi _I$ shows the balance between the heating and loss terms in the energy equation where red denotes net energy addition (heating) and blue is net energy loss (cooling).
;REQUIRES SIMULATION DATA

;interpolation grid to reduce file size
xg=exp(findgen(10001)/10000.0*6.0-5.0)

;rdmpi,ds,datapath='../snapshot',time_step=150
rdmpi,ds,datapath='../Simulations/Data',time_step=200
rdmpi,dsm,datapath='../Data_mhd',time_step=200

tep=ds.pr_p/(5.0/3.0-1.0)
ten=ds.pr_n/(5.0/3.0-1.0)
tem=dsm.pr_p/(5.0/3.0-1.0)

thicklv=2

pv=plot(xg,interpol(tep,ds.x/ds.t(0),xg),xr=[0.01,2.0],/xlog,xtitle='x/t',ytitle='$Thermal energy$',margin=[0.22,0.10,0.07,0.12], dimension=[970,600],font_size=14,thick=thicklv,/ylog,'b',layout=[2,2,1])
pv=plot(xg,interpol(ten,ds.x/ds.t(0),xg),/overplot,'r',thick=thicklv)
pv=plot(xg,interpol(tem,dsm.x/dsm.t(0),xg),/overplot,'k',thick=thicklv)
pv.ytickunits='Scientific'
pv.yr=[1.0e-4,1.0e0]

;heating=-ds.ion*ds.ro_n+ds.ion(255000)*ds.ro_n(255000)
aheat=ds.ion(255000)*ds.ro_n(255000)*(13.6*0.1/10000.0/2.0/8.6173e-5)
ionpot=ds.ion*ds.ro_n*(13.6*0.1/10000.0/2.0/8.6173e-5)
heating=aheat-ionpot

pv=plot(xg,interpol(heating,ds.x/ds.t(0),xg),xr=[0.01,2.0],/xlog,xtitle='x/t',ytitle='$A_{heat}-\phi _I$',margin=0.12, dimension=[970,600],font_size=14,thick=thicklv,'r',/ylog,layout=[2,2,2],/current)
pv=plot(xg,interpol(-heating,ds.x/ds.t(0),xg),thick=thicklv,/overplot,'b') 
pv.yr=[1.0e-9,1.0e-4]
th=text(0.45,1.0e-5,'Heating',target=pv,/data,'r',font_size=14)
ah=arrow([0.7,0.7],[8.0e-6,1.0e-6],/data,target=pv)
ah.color='r'
tc=text(0.07,1.0e-5,'Cooling',target=pv,/data,'b',font_size=14)
ac=arrow([0.07,0.035],[1.5e-5,1.5e-5],/data,target=pv)
ac.color='b'

;stop


mep=0.5*(ds.by^2.0+ds.bx^2)
mem=0.5*(dsm.by^2.0+dsm.bx^2)

pv=plot(xg,interpol(mep,ds.x/ds.t(0),xg),xr=[0.01,2.0],/xlog,xtitle='x/t',ytitle='$Magnetic energy$',margin=[0.22,0.19,0.07,0.06], dimension=[970,600],font_size=14,thick=thicklv,'b',layout=[2,2,3],/current)
pv=plot(xg,interpol(mem,dsm.x/dsm.t(0),xg),/overplot,'k',thick=thicklv)


kep=0.5*ds.ro_p*(ds.vx_p^2+ds.vy_p^2)
ken=0.5*ds.ro_n*(ds.vx_n^2+ds.vy_n^2)
keb=0.5*(ds.ro_p+ds.ro_n)*(ds.vx_p^2+ds.vy_p^2+ds.vx_n^2+ds.vy_n^2)/2.0
kem=0.5*dsm.ro_p*(dsm.vx_p^2+dsm.vy_p^2)

pv=plot(xg,interpol(kep,ds.x/ds.t(0),xg),xr=[0.01,2.0],/xlog,xtitle='x/t',ytitle='$Kinetic energy$',margin=[0.12,0.19,0.12,0.06], dimension=[970,600],font_size=14,thick=thicklv,'b',layout=[2,2,4],/current)
pv=plot(xg,interpol(ken,ds.x/ds.t(0),xg),/overplot,'r',thick=thicklv)
;pv=plot(xg,interpol(keb,ds.x/ds.t(0),xg),/overplot,'g',thick=thicklv)
pv=plot(xg,interpol(kem,dsm.x/dsm.t(0),xg),/overplot,'k',thick=thicklv)
pv.ylog=1
pv.ytickunits='Scientific'
pv.yr=[1.0e-5,1.0e1]

;pa=pv.axes
;pa[0].hide=1
;pa[1].hide=1
;pa[2].hide=1
;pa[3].show=1



end
