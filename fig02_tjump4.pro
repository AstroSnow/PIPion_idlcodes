; temperature jumps
; Generates the data for fig02_tjumpplotex.pro
; Finds all possible equilibrium temperature jumps for a given upstream temperature

;T0=10000.0
;T0e=T0/1.1604e4
;n0=1.0e13

;beta0=0.1
;theta0=!pi /4.0

;Simulation values
beta0=0.13
theta0=1.16

;rec0=2.6e-19*(n0*1.0e6)/sqrt(T0e)
;ion0=(n0*1.0e6)*2.91e-14*exp(-13.6/T0e)*(13.6/T0e)^0.39/(0.232+13.6/T0e)

;t0arr=[10000.0:50000.0:200.0]
t0arr=[16000.0]
;rarr=[0.001:20:0.001]


;Restore the t/t0 solution for radiative losses from tjump3.pro
restore,'t16000_radsol.sav'


;loop over r and T0
Ti=0

;w=window(dimension=[970,600])

;for ad=0.01,2.0,0.01 do begin
ad=[0.001:3.5:0.001]
;au=1.0

sol=dblarr(n_elements(ad))
sol2=dblarr(n_elements(ad))

sols=[]
sols2=[]

solau=[]
solau2=[]

;for Ti=0,n_elements(t0arr)-1 do begin
;for ri=0,n_elements(rarr)-1 do begin
for au=0.01,3.5,0.001 do begin

	for ai=0,n_elements(ad)-1 do begin
		r=au/ad(ai)

		root=interpol(t1,rarr,r)
		root2=interpol(t2,rarr,r)

	;	print,T0,r,root,root2

		sol(ai)=ad(ai)/au*((ad(ai)-1.0)^2+2.0/(beta0*(1.0+tan(theta0)^2))*((ad(ai)-1.0)^2*(au-ad(ai))+ 0.5*tan(theta0)^2*((ad(ai)-1.0)^2-(au-1.0)^2)))-(ad(ai)-1.0)^2*root

		sol2(ai)=ad(ai)/au*((ad(ai)-1.0)^2+2.0/(beta0*(1.0+tan(theta0)^2))*((ad(ai)-1.0)^2*(au-ad(ai))+ 0.5*tan(theta0)^2*((ad(ai)-1.0)^2-(au-1.0)^2)))-(ad(ai)-1.0)^2*root2

	endfor

	for i=1,n_elements(sol)-1 do begin
		rr=0.0
		rr2=0.0
		if (sol(i) gt 0) and (sol(i-1) lt 0) then rr=interpol(ad(i-1:i),sol(i-1:i),0.0)
		if (sol(i) lt 0) and (sol(i-1) gt 0) then rr=interpol(ad(i-1:i),sol(i-1:i),0.0)
		if (sol2(i) gt 0) and (sol2(i-1) lt 0) then rr2=interpol(ad(i-1:i),sol2(i-1:i),0.0)
		if (sol2(i) lt 0) and (sol2(i-1) gt 0) then rr2=interpol(ad(i-1:i),sol2(i-1:i),0.0)

		if (rr ne 0.0) then begin
			sols=[sols,rr]
			solau=[solau,au]
		endif
		if (rr2 ne 0.0) then begin
			sols2=[sols2,rr2]
			solau2=[solau2,au]
		endif

	endfor


endfor	

;;;MHD solution
ax1=[]
ax2=[]
gamma=5.0/3.0

for i=0.0,3.5,0.001 do begin

	ax2=[ax2,i]

	a=i*((gamma-1.0)/gamma *((gamma+1.0)/(gamma-1.0)-tan(theta0)^2.0)*(i-1.0)^2.0+tan(theta0)^2.0 * ((gamma-1.0)/gamma *i -1.0)*(i-2.0))-beta0/(cos(theta0)^2)*(i-1.0)^2.0
	b=(gamma-1.0)/gamma *(i-1.0)^2.0/(cos(theta0)^2)-i*(tan(theta0)^2)*((gamma-1.0)/gamma *i -1.0)

	ax1=[ax1,a/b]	

endfor


;p=plot(sols,solau,xtitle='$A^{d2}$',ytitle='$A^{u2}$','.',thick=2,/xlog,/ylog,xr=[0.01,2],yr=[0.01,2])
p=plot(sols,solau,xtitle='$A^{d2}$',ytitle='$A^{u2}$','r.',thick=2,name='IRIP T=16000',dimension=[970,600],xr=[0,2.5],yr=[0,4])
ph=plot(ax2,ax1,/overplot,name='MHD',thick=2)
l=legend(target=[p,ph])

save,sols,solau,ax2,ax1,sols2,solau2,filename='tjump4_t0_16000_sim.sav'

end
