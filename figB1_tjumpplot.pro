;plot a few different T0 solutions for the shock jumps
;Numerical solutions to the shock jump equations for the MHD (black) and IRIP equations. The trivial solution ($A^{d2}=A^{u2}$) exists for both sets of equations.
;Requires data from fig02_tjump4.pro

restore,'tjump4_t0_10000_sim.sav'

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

p=plot(nlsols(i:nend-1),nlaus(i:nend-1),xtitle='$A^{d2}$',ytitle='$A^{u2}$','r',thick=2,name='IRIP T=10000',dimension=[970,600],xr=[0,1.5],yr=[0,2],font_size=16)
ph=plot(ax2,ax1,/overplot,name='MHD',thick=2)
pl=plot(lsol,lau,/overplot,thick=2)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
restore,'tjump4_t0_12000_sim.sav'

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

p2=plot(nlsols(i:nend-1),nlaus(i:nend-1),'b',thick=2,name='IRIP T=12000',/overplot)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
restore,'tjump4_t0_14000_sim.sav'

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

p3=plot(nlsols(i:nend-1),nlaus(i:nend-1),'g',thick=2,name='IRIP T=14000',/overplot)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
restore,'tjump4_t0_16000_sim.sav'

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
while nlsols(i) lt 0.03 do i=i+1
nend=n_elements(nlsol)

p4=plot(nlsols(i:nend-1),nlaus(i:nend-1),'m',thick=2,name='IRIP T=16000',/overplot)

l=legend(target=[p,p2,p3,p4,ph],font_size=14)
l.position=[0.75,0.85]

END
