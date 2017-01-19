pro elctfplot,filename, $
	eps=eps,encapsulated=encapsulated, $
	titlesize=titlesize,annotsize=annotsize,help=help

if keyword_set(help) then begin
	print,'elctfplot,[filename],[/eps] or [/encapsulated]'
	return
endif

if (n_elements(filename) gt 0) then begin
  print,'Writing PostScript file ',strtrim(filename,2)
  old_name=!d.name
  old_font=!p.font
  set_plot,'ps'
  !p.font=0
  if (keyword_set(eps) or keyword_set(encapsulated)) then begin
	device,file=filename,/portrait,/encapsulated
  endif else begin
	device,file=filename,/inch,/landscape, $
		xsize=7.,ysize=5.
  endelse
endif

pichar='!Mp!X'

if keyword_set(titlesize) then begin
	!p.charsize=titlesize
endif

if keyword_set(annotsize) then begin
endif else begin
	annotsize=1.0
endelse

!x.title='Spatial frequency !4f!X in nm!S!U-1!R'
!y.title='sin[W(!4f!X)]
!p.title='100 keV, C!S!Ds!R =2 mm'
!p.subtitle=''

cs=2.e-3
energy=100.

df=[0.,1.,3.16,10.,31.6,100.,316.]
dfnum=n_elements(df)
ytop=3.+3.*(dfnum-1)

; wmax=2.*!pi

xstart=0.016
for dfi=0,(dfnum-1) do begin
	this_df=df(dfi)
	freqs=findgen(2000)
	elw,energy,cs,this_df,f_scherzer,freqs,w,/normdefocus
	df(dfi)=this_df

	; Limit w to wmax
;	 truncate,w,wmax,/abs
;	 wnum=n_elements(w)
;	 ftemp=freqs
;	 freqs=fltarr(wnum)
;	 freqs(0:(wnum-1))=ftemp(0:(wnum-1))
;	 ftemp=0

	if (dfi eq 0) then begin
	  plot_oi,1.e-9*freqs,sin(w),xrange=[0.01,10.], $
		yrange=[-3.,ytop],yticks=1, $
		ystyle=1
	endif else begin
	  oplot,1.e-9*freqs,(3*dfi+sin(w)),linestyle=dfi
	endelse

	thisy=3.*dfi+0.75
	if (dfi eq 1) then begin
	  xyouts,xstart,thisy,/data, $
	    strtrim(string(1.e9*df(dfi),format='(i5)'),2) + $
	    ' nm defocus (Scherzer)',charsize=annotsize
	endif else begin
	  xyouts,xstart,thisy,/data, $
	    strtrim(string(1.e9*df(dfi),format='(i5)'),2) + $
	    ' nm defocus',charsize=annotsize
	endelse
endfor

xyouts,1.,-2.,/data,'0.5 nm feature', $
	alignment=0.5,charsize=annotsize
xyouts,0.1,-2.,/data,'5 nm feature', $
	alignment=0.5,charsize=annotsize

if (n_elements(filename) gt 0) then begin
	device,/close
	set_plot,old_name
	!p.font=old_font
endif

return
end

