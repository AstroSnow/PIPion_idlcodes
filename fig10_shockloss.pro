; energy loss through the shock
;Finite width of the shock (black line) as a function of the initial recombination rates. Integrated cooling for a parcel of fluid travelling through the shock (red line).

rdmpi,ds,datapath='../Simulations/Data_t10000_r-3_e3',var=['vx_p','vx_n','ro_n','ro_p'],time_step=[39]
rdmpi,ds2,datapath='../Simulations/Data_t10000_r-5_e3',var=['vx_p','vx_n','ro_n','ro_p'],time_step=[38]
rdmpi,ds3,datapath='../Simulations/Data_t10000_r-6_e3',var=['vx_p','vx_n','ro_n','ro_p'],time_step=[39]
rdmpi,ds4,datapath='../Simulations/Data_t10000_r-7_e3',var=['vx_p','vx_n','ro_n','ro_p'],time_step=[39]

rdmpi,dse1,datapath='../Simulations/Data_t10000_r-2_e3',var=['vx_p','vx_n','ro_n','ro_p'],time_step=[46]
rdmpi,dse2,datapath='../Simulations/Data_t10000_r-8_e3',var=['vx_p','vx_n','ro_n','ro_p'],time_step=[37]
rdmpi,dse3,datapath='../Simulations/Data_t10000_r-4_e3',var=['vx_p','vx_n','ro_n','ro_p'],time_step=[28]

;get the shock frame
a=min(deriv(ds.vx_p),b)
vs=ds.x(b)/ds.t(0)
xs=ds.x-vs*ds.t(0)

a2=min(deriv(ds2.vx_p),b2)
vs2=ds2.x(b2)/ds2.t(0)
xs2=ds2.x-vs2*ds2.t(0)

a3=min(deriv(ds3.vx_p),b3)
vs3=ds3.x(b3)/ds3.t(0)
xs3=ds3.x-vs3*ds3.t(0)

a4=min(deriv(ds4.vx_p),b4)
vs4=ds4.x(b4)/ds4.t(0)
xs4=ds4.x-vs4*ds4.t(0)

a=min(deriv(dse1.vx_p),be1)
vse1=dse1.x(be1)/dse1.t(0)
xse1=dse1.x-vse1*dse1.t(0)

a=min(deriv(dse2.vx_p),be2)
vse2=dse2.x(be2)/dse2.t(0)
xse2=dse2.x-vse2*dse2.t(0)

a=min(deriv(dse3.vx_p),be3)
vse3=dse3.x(be3)/dse3.t(0)
xse3=dse3.x-vse3*dse3.t(0)

;get the heating
h=ds.aheat-ds.ion*ds.ro_n*(13.6*0.1/10000.0/2.0/8.6173e-5)
h2=ds2.aheat-ds2.ion*ds2.ro_n*(13.6*0.1/10000.0/2.0/8.6173e-5)
h3=ds3.aheat-ds3.ion*ds3.ro_n*(13.6*0.1/10000.0/2.0/8.6173e-5)
h4=ds4.aheat-ds4.ion*ds4.ro_n*(13.6*0.1/10000.0/2.0/8.6173e-5)
he1=dse1.aheat-dse1.ion*dse1.ro_n*(13.6*0.1/10000.0/2.0/8.6173e-5)
he2=dse2.aheat-dse2.ion*dse2.ro_n*(13.6*0.1/10000.0/2.0/8.6173e-5)
he3=dse3.aheat-dse3.ion*dse3.ro_n*(13.6*0.1/10000.0/2.0/8.6173e-5)

;find the finite width of the shock
vd=ds.vx_p-ds.vx_n
vdd=deriv(vd)
a=min(vdd,b)
a=max(vdd,c)
sw=abs(xs(b)-xs(c))

vd2=ds2.vx_p-ds2.vx_n
vdd2=deriv(vd2)
a=min(vdd2,b2)
a=max(vdd2,c2)
sw2=abs(xs2(b2)-xs2(c2))

vd3=ds3.vx_p-ds3.vx_n
vdd3=deriv(vd3)
a=min(vdd3,b3)
a=max(vdd3,c3)
sw3=abs(xs3(b3)-xs3(c3))

vd4=ds4.vx_p-ds4.vx_n
vdd4=deriv(vd4)
a=min(vdd4,b4)
a=max(vdd4,c4)
sw4=abs(xs4(b4)-xs4(c4))

vde1=dse1.vx_p-dse1.vx_n
vdde1=deriv(vde1)
a=min(vdde1,be1)
a=max(vdde1,ce1)
swe1=abs(xse1(be1)-xse1(ce1))

vde2=dse2.vx_p-dse2.vx_n
vdde2=deriv(vde2)
a=min(vdde2,be2)
a=max(vdde2,ce2)
swe2=abs(xse2(be2)-xse2(ce2))

vde3=dse3.vx_p-dse3.vx_n
vdde3=deriv(vde3)
a=min(vdde3,be3)
a=max(vdde3,ce3)
swe3=abs(xse3(be3)-xse3(ce3))

;p=plot(xs,ds.vx_p-vs,xr=[-0.01,0.03])
;p=plot(xs2,ds2.vx_p-vs2,/overplot)
;p=plot(xs3,ds3.vx_p-vs3,/overplot)
;p=plot(xs4,ds4.vx_p-vs4,/overplot)

;p=plot(xs,h,xr=[-0.01,0.03])
;p=plot(xs2,h2,/overplot)
;p=plot(xs3,h3,/overplot)
;p=plot(xs4,h4,/overplot)

;Track a particle through the shock
inte=0.0
for i=c,b,-1 do begin
	inte=inte-h(i)*(xs(i+1)-xs(i))/(ds.vx_p(i)-vs)
endfor

inte2=0.0
for i=c2,b2,-1 do begin
	inte2=inte2-h2(i)*(xs2(i+1)-xs2(i))/(ds2.vx_p(i)-vs2)
endfor

inte3=0.0
for i=c3,b3,-1 do begin
	inte3=inte3-h3(i)*(xs3(i+1)-xs3(i))/(ds3.vx_p(i)-vs3)
endfor

inte4=0.0
for i=c4,b4,-1 do begin
	inte4=inte4-h4(i)*(xs4(i+1)-xs4(i))/(ds4.vx_p(i)-vs4)
endfor

intee1=0.0
for i=ce1,be1,-1 do begin
	intee1=intee1-he1(i)*(xse1(i+1)-xse1(i))/(dse1.vx_p(i)-vse1)
endfor

intee2=0.0
for i=ce2,be2,-1 do begin
	intee2=intee2-he2(i)*(xse2(i+1)-xse2(i))/(dse2.vx_p(i)-vse2)
endfor

intee3=0.0
for i=ce3,be3,-1 do begin
	intee3=intee3-he3(i)*(xse3(i+1)-xse3(i))/(dse3.vx_p(i)-vse3)
endfor


recarr=[1.0e-2,1.0e-3,1.0e-4,1.0e-5,1.0e-6,1.0e-7]
intearr=[intee1,inte,intee3,inte2,inte3,inte4]
swarr=[swe1,sw,swe3,sw2,sw3,sw4]

p=plot(recarr,swarr,/xlog,xtitle='Recombination rate',ytitle='Shock width',thick=2,position=[0.1,0.1,0.9,0.9],dimension=[970,600],font_size=14,'*-')
p.sym_size=2
p.sym_thick=2
pa=p.axes
pa[3].hide=1

p2=plot(recarr,-intearr,/current,thick=2,position=[0.1,0.1,0.9,0.9],/xlog,'r*-',font_size=14)
p2.sym_size=2
p2.sym_thick=2
p2a=p2.axes
p2a[0].hide=1
p2a[1].hide=1
p2a[2].hide=1
p2a[3].show=1
p2a[3].title='Integrated cooling'
p2a[3].color='r'
END
