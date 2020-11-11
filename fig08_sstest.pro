;Drift velocity at different times for the IRIP simulation. The shocks are aligned using $x_s$ which is the location of the minimum gradient of the plasma velocity, i.e., the shock terminus.
;Requires simulation data

orange=[255,194,10]

rdmpi,ds,datapath='../Simulations/Data',time_step=[12,25,50,100,200]

a=min(deriv(ds.vx_p(*,0)),b)
a=min(deriv(ds.vx_p(*,1)),b1)
a=min(deriv(ds.vx_p(*,2)),b2)
a=min(deriv(ds.vx_p(*,3)),b3)
a=min(deriv(ds.vx_p(*,4)),b4)

thicklv=2

p=plot(ds.x-ds.x(b),ds.vx_n(*,0)-ds.vx_p(*,0),xr=[-10,40],thick=thicklv,dimension=[970,600],xtitle='$x-x_s$',ytitle='$v_{xn}-v_{xp}$',font_size=16,name='t='+strtrim(floor(ds.t(0)),1),/buffer)
p1=plot(ds.x-ds.x(b1),ds.vx_n(*,1)-ds.vx_p(*,1),/overplot,thick=thicklv,'r',name='t='+strtrim(floor(ds.t(1)),1))
p2=plot(ds.x-ds.x(b2),ds.vx_n(*,2)-ds.vx_p(*,2),/overplot,thick=thicklv,'b',name='t='+strtrim(floor(ds.t(2)),1))
p3=plot(ds.x-ds.x(b3),ds.vx_n(*,3)-ds.vx_p(*,3),/overplot,thick=thicklv,'g',name='t='+strtrim(floor(ds.t(3)),1))
p4=plot(ds.x-ds.x(b4),ds.vx_n(*,4)-ds.vx_p(*,4),/overplot,thick=thicklv,color=orange,name='t='+strtrim(floor(ds.t(4)),1))

l=legend(target=[p,p1,p2,p3,p4],font_size=16)
l.position=[0.55,0.5]

p.save,'sstest.pdf'

END
