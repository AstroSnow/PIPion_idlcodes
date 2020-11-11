;Figure 1
;No simulation data required
;$F(T) \xi_i^2$ as a function of temperature in dimensional form. Red line shows the ionisation fraction $\xi_i$ for the associated temperature.

T=[0000.0:50000.0:10.0]

T0e=T/1.1604e4
F=2.6e-19/sqrt(T0e)
G=2.91e-14*exp(-13.6/T0e)*(13.6/T0e)^0.39/(0.232+13.6/T0e)

xi=1.0/(f/g + 1.0)

p=plot(t,F*xi*xi*1.0e19,xtitle='Temperature [K]',ytitle='F(T)$\xi _i ^2 \times 10^{19}$ ',font_size=18,thick=3,dimension=[1070,600],margin=[0.11,0.15,0.11,0.1])
pa=p.axes
pa[3].hide=1

p2=plot(t,xi,'r',/current,/ylog,margin=[0.11,0.15,0.11,0.1],font_size=18,ytitle='$\xi_i$',font_color='r',yr=[1.0e-6,1],thick=3)
p2a=p2.axes
p2a[1].hide=1
p2a[2].hide=1
p2a[3].show=1
p2a[3].color='r'
p2a[0].hide=1


END
