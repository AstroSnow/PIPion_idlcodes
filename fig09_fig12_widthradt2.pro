;look at the shock width for different taus
;Plasma (blue) and neutral (red) $v_x$ velocities for recombination time scales of $10^{-3}$, $10^{-5}$, $10^{-6}$, $10^{-7}$ from top to bottom.
;Requires simulation data
;Plots Figure 09 and Figure 12

rdmpi,ds,datapath='../Simulations/Data_t10000_r-3_e3',var=['vx_p','vx_n','ro_n','ro_p'],time_step=[39]
rdmpi,ds2,datapath='../Simulations/Data_t10000_r-5_e3',var=['vx_p','vx_n','ro_n','ro_p'],time_step=[38]
rdmpi,ds3,datapath='../Simulations/Data_t10000_r-6_e3',var=['vx_p','vx_n','ro_n','ro_p'],time_step=[39]
rdmpi,ds4,datapath='../Simulations/Data_t10000_r-7_e3',var=['vx_p','vx_n','ro_n','ro_p'],time_step=[39]

rdmpi,dse1,datapath='../Simulations/Data_t10000_r-2_e3',var=['vx_p','vx_n','ro_n','ro_p'],time_step=[46]
rdmpi,dse2,datapath='../Simulations/Data_t10000_r-8_e3',var=['vx_p','vx_n','ro_n','ro_p'],time_step=[37]
rdmpi,dse3,datapath='../Simulations/Data_t10000_r-4_e3',var=['vx_p','vx_n','ro_n','ro_p'],time_step=[28]

;rdmpi,dsir,datapath='../Simulations/IR_t10000_r1e-3_beta0.1_r',var=['ro_p'],time_step=[50]

thicklv=2

p=plot(ds.x/ds.t(0),ds.vx_p,position=[0.1,0.75,0.45,0.95],xr=[0,0.1], ytitle='$v_x$','b',dimension=[970,600],font_size=14,thick=thicklv, yr=[-0.35,0.05],/buffer)
pa=p.axes
pa[0].show=0
pa[1].tickvalues=[-0.3,-0.2,-0.1,0.0]
p=plot(ds.x/ds.t(0),ds.vx_n,'r',/overplot,position=[0.1,0.75,0.45,0.95],thick=thicklv)
p=plot(ds2.x/ds2.t(0),ds2.vx_p,position=[0.1,0.55,0.45,0.75],/current,xr=[0,0.1],ytitle='$v_x$','b',font_size=14,thick=thicklv,yr=[-0.35,0.05])
p=plot(ds2.x/ds2.t(0),ds2.vx_n,'r',/overplot,position=[0.1,0.55,0.45,0.75],thick=thicklv)
pa=p.axes
pa[0].show=0
pa[1].tickvalues=[-0.3,-0.2,-0.1,0.0]
p=plot(ds3.x/ds3.t(0),ds3.vx_p,position=[0.1,0.35,0.45,0.55],/current,xr=[0,0.1],ytitle='$v_x$','b',font_size=14,thick=thicklv,yr=[-0.35,0.05])
p=plot(ds3.x/ds3.t(0),ds3.vx_n,position=[0.1,0.35,0.45,0.55],thick=thicklv,/overplot,'r')
pa=p.axes
pa[0].show=0
pa[1].tickvalues=[-0.3,-0.2,-0.1,0.0]
p=plot(ds4.x/ds4.t(0),ds4.vx_p,position=[0.1,0.15,0.45,0.35],/current,xr=[0,0.1],ytitle='$v_x$','b',xtitle='x/t',font_size=14,thick=thicklv,yr=[-0.35,0.05])
p=plot(ds4.x/ds4.t(0),ds4.vx_n,position=[0.1,0.15,0.45,0.35],/overplot,'r',thick=thicklv)
pa=p.axes
pa[1].tickvalues=[-0.3,-0.2,-0.1,0.0]
t=text(0.35,0.9,'$\tau_{IR}=10^{-3}$',/current,font_size=14)
t=text(0.35,0.7,'$\tau_{IR}=10^{-5}$',/current,font_size=14)
t=text(0.35,0.5,'$\tau_{IR}=10^{-6}$',/current,font_size=14)
t=text(0.35,0.3,'$\tau_{IR}=10^{-7}$',/current,font_size=14)

p.save,'widthradt2_vx.pdf'
p.close
;stop
;p=plot(ds.x/ds.t(0),ds.ro_n/(ds.ro_p+ds.ro_n),position=[0.55,0.75,0.9,0.95],xr=[0,0.1],/current, ytitle='$\xi_n$',font_size=14,thick=thicklv)
;pa=p.axes
;pa[0].show=0
;p=plot(ds2.x/ds2.t(0),ds2.ro_n/(ds2.ro_p+ds2.ro_n),position=[0.55,0.55,0.9,0.75],/current,xr=[0,0.1], ytitle='$\xi_n$',font_size=14,thick=thicklv)
;pa=p.axes
;pa[0].show=0
;p=plot(ds3.x/ds3.t(0),ds3.ro_n/(ds3.ro_p+ds3.ro_n),position=[0.55,0.35,0.9,0.55],/current,xr=[0,0.1], ytitle='$\xi_n$',font_size=14,thick=thicklv)
;pa=p.axes
;pa[0].show=0
;p=plot(ds4.x/ds4.t(0),ds4.ro_n/(ds4.ro_p+ds4.ro_n),position=[0.55,0.15,0.9,0.35],/current,xr=[0,0.1],xtitle='x/t', ytitle='$\xi_n$',font_size=14,thick=thicklv)


p3=plot(ds.x/ds.t(0),ds.ro_p/(ds.ro_p+ds.ro_n),xtitle='x/t',ytitle='$\xi_i$',dimension=[970,600],name='$\tau_{IR}=10^{-3}$', font_size=18,thick=3,xr=[0,0.1],/ylog,/buffer)
p5=plot(ds2.x/ds2.t(0),ds2.ro_p/(ds2.ro_p+ds2.ro_n),/overplot,'r',name='$\tau_{IR}=10^{-5}$',thick=3)
p6=plot(ds3.x/ds3.t(0),ds3.ro_p/(ds3.ro_p+ds3.ro_n),/overplot,'g',name='$\tau_{IR}=10^{-6}$',thick=3)
p7=plot(ds4.x/ds4.t(0),ds4.ro_p/(ds4.ro_p+ds4.ro_n),/overplot,'b',name='$\tau_{IR}=10^{-7}$',thick=3)
l=legend(target=[p3,p5,p6,p7])
l.position=[0.88,0.82]
l.font_size=16

p3.save,'widthradt2_xi.pdf'
p3.close

;estimate shock width based on drift velocities
sw=dblarr(7)
urec=dblarr(7)
vd=dse1.vx_p-dse1.vx_n
vdd=deriv(vd)
a=min(vdd,b)
a=max(vdd,c)
sw(0)=abs(dse1.x(b)-dse1.x(c))
urec(0)=dse1.rec(c+50)

vd=ds.vx_p-ds.vx_n
vdd=deriv(vd)
a=min(vdd,b)
a=max(vdd,c)
sw(1)=abs(ds.x(b)-ds.x(c))
urec(1)=ds.rec(c+50)

vd=dse3.vx_p-dse3.vx_n
vdd=deriv(vd)
a=min(vdd,b)
a=max(vdd,c)
sw(2)=abs(dse3.x(b)-dse3.x(c))
urec(2)=dse3.rec(c+50)

vd=ds2.vx_p-ds2.vx_n
vdd=deriv(vd)
a=min(vdd,b)
a=max(vdd,c)
sw(3)=abs(ds2.x(b)-ds2.x(c))
urec(3)=ds2.rec(c+50)

vd=ds3.vx_p-ds3.vx_n
vdd=deriv(vd)
a=min(vdd,b)
a=max(vdd,c)
sw(4)=abs(ds3.x(b)-ds3.x(c))
urec(4)=ds3.rec(c+50)

vd=ds4.vx_p-ds4.vx_n
vdd=deriv(vd)
a=min(vdd,b)
a=max(vdd,c)
sw(5)=abs(ds4.x(b)-ds4.x(c))
urec(5)=ds4.rec(c+50)

vd=dse2.vx_p-dse2.vx_n
vdd=deriv(vd)
a=min(vdd,b)
a=max(vdd,c)
sw(6)=abs(dse2.x(b)-dse2.x(c))
urec(6)=dse2.rec(c+50)

;vd=dsir.vx_p-dsir.vx_n
;vdd=deriv(vd)
;a=min(vdd,b)
;a=max(vdd,c)
;swir=abs(dsir.x(b)-dsir.x(c))
;urecir=dsir.rec(c+50)


p=plot(urec,sw,'-*',/xlog,/ylog,xr=[1.0e-9,1.0e-1],dimension=[970,600],thick=3, xtitle='Upstream recombination rate',ytitle='Shock width',font_size=16)
p.sym_size=2
p.sym_thick=2


p.save,'widthradt2_sw.pdf'
p.close


;i=0
;while abs(ds.vx_p(i)-ds.vx_n(i)) lt 1.0e-3 do i=i+1
;j=i
;while abs(ds.vx_p(j)-ds.vx_n(j)) gt 1.0e-3 do j=j+1
;sw(0)=ds.x(j)-ds.x(i)
;i=0
;while abs(ds2.vx_p(i)-ds2.vx_n(i)) lt 1.0e-3 do i=i+1
;j=i
;while abs(ds2.vx_p(j)-ds2.vx_n(j)) gt 1.0e-3 do j=j+1
;sw(1)=ds2.x(j)-ds2.x(i)
;i=0
;while abs(ds3.vx_p(i)-ds3.vx_n(i)) lt 1.0e-3 do i=i+1
;j=i
;while abs(ds3.vx_p(j)-ds3.vx_n(j)) gt 1.0e-3 do j=j+1
;sw(2)=ds3.x(j)-ds3.x(i)
;i=0
;while abs(ds4.vx_p(i)-ds4.vx_n(i)) lt 1.0e-3 do i=i+1
;j=i
;while abs(ds4.vx_p(j)-ds4.vx_n(j)) gt 1.0e-3 do j=j+1
;sw(3)=ds4.x(j)-ds4.x(i)

;t1=39
;t2=30

;p=plot(ds.x/ds.t(t1),ds.vx_p(*,t1),'b',xr=[0,0.1])
;p=plot(ds.x/ds.t(t1),ds.vx_n(*,t1),'r',/overplot)
;p=plot(ds.x/ds.t(t1),ds.ro_p(*,t1)*ds.rec(*,t1),'g',/overplot)
;p=plot(ds.x/ds.t(t1),ds.ro_n(*,t1)*ds.ion(*,t1),'y',/overplot)

;p=plot(ds.x/ds.t(t1),ds.vx_p(*,t1)-ds.vx_n(*,t1),'b',xr=[0,0.1])
;p=plot(ds.x/ds.t(t1),ds.ro_p(*,t1)*ds.rec(*,t1)-ds.ro_n(*,t1)*ds.ion(*,t1),'g',/overplot)

;p=plot(ds.x/ds.t(t2),ds.vx_p(*,t2),'b--',/overplot)
;p=plot(ds.x/ds.t(t2),ds.vx_n(*,t2),'r--',/overplot)
;p=plot(ds.x/ds.t(t2),ds.ro_p(*,t2)*ds.rec(*,t2),'g',/overplot)
;p=plot(ds.x/ds.t(t2),ds.ro_n(*,t2)*ds.ion(*,t2),'y',/overplot)
end
