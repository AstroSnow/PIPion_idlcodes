;Figure 2
;Solutions to the shock jump equations for the IRIP (red) and MHD (black) equations relating the upstream ($^u$) and downstream ($^d$) Alfv\'en Mach numbers $A_x$. The trivial solution ($A_x^{d}=A_x^{u}$) exists for both sets of equations. The parameters used for this plot are $T_0 = 10000$ K, $\beta = 0.1$, $\theta =\pi/4$ and $\gamma =5/3$.
;REQUIRES DATA GENERATED BY fig02_tjump4.pro

restore,'tjump4_t0_10000.sav'

lsol=[]
lau=[]
nlsol=[]
nlau=[]
;extract linear solution
for i=0,n_elements(solau)-1 do begin
	if (abs(solau(i)-sols(i)) lt 1.0e-5) then begin
;print,i
		lsol=[lsol,sols(i)]
		lau=[lau,solau(i)]
	endif else begin
		nlsol=[nlsol,sols(i)]
		nlau=[nlau,solau(i)]
	endelse
end

nlaus=nlau(sort(nlsol))
nlsols=nlsol(sort(nlsol))

i=1
while nlsols(i) lt 0.04 do i=i+1
nend=n_elements(nlsol)

p=plot(nlsols(i:nend-1),nlaus(i:nend-1),xtitle='$A_x^{d2}$', ytitle='$A_x^{u2}$','r',thick=3,name='IRIP T=10000',dimension=[970,600],xr=[0,2.5],yr=[0,4],font_size=18,margin=[0.1,0.15,0.05,0.1])
ph=plot(ax2,ax1,/overplot,name='MHD',thick=3)
pl=plot(lsol,lau,/overplot,thick=3,name='Linear','--')

l=legend(target=[p,ph,pl],font_size=18)
l.position=[0.6,0.8]

END
