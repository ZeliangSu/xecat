pro zatwt,atwt,z_array,help=help

;+
;	pro zatwt,atwt,z_array
;
;	Given z_array (as set by compound or zcompound), calculates
;	the atomic/molecular weight of the compound.
;
; CJJ Feb 93
;-

if (keyword_set(help) or (n_elements(atwt) eq 0)) then begin
	print,'zatwt,atwt,z_array'
	return
endif

maxz=n_elements(z_array)
atwt=0.

for i=0,(maxz-1) do begin
    if (z_array(i) ne 0.) then begin
	case (i+1) of
	1: this_atwt=1.00794
	2: this_atwt=4.0026
	3: this_atwt=6.941
	4: this_atwt=9.01218
	5: this_atwt=10.81
	6: this_atwt=12.011
	7: this_atwt=14.0067
	8: this_atwt=15.9994
	9: this_atwt=18.9984
	10: this_atwt=21.179
	11: this_atwt=22.98977
	12: this_atwt=24.305
	13: this_atwt=26.98154
	14: this_atwt=28.0855
	15: this_atwt=30.97376
	16: this_atwt=32.06
	17: this_atwt=35.453
	18: this_atwt=39.948
	19: this_atwt=39.0983
	20: this_atwt=40.08
	21: this_atwt=44.9559
	22: this_atwt=47.88
	23: this_atwt=50.9415
	24: this_atwt=51.996
	25: this_atwt=54.9380
	26: this_atwt=55.847
	27: this_atwt=58.9332
	28: this_atwt=58.69
	29: this_atwt=63.546
	30: this_atwt=65.38
	31: this_atwt=69.72
	32: this_atwt=72.59
	33: this_atwt=74.9216
	34: this_atwt=78.96
	35: this_atwt=79.904
	36: this_atwt=83.80
	37: this_atwt=85.4678
	38: this_atwt=87.62
	39: this_atwt=88.9059
	40: this_atwt=91.22
	41: this_atwt=92.9064
	42: this_atwt=95.94
	43: this_atwt=98.
	44: this_atwt=101.07
	45: this_atwt=102.9055
	46: this_atwt=106.42
	47: this_atwt=107.8682
	48: this_atwt=112.41
	49: this_atwt=114.82
	50: this_atwt=118.69
	51: this_atwt=121.75
	52: this_atwt=127.60
	53: this_atwt=126.9054
	54: this_atwt=131.29
	55: this_atwt=132.9054
	56: this_atwt=137.33
	57: this_atwt=138.9055
	58: this_atwt=140.12
	59: this_atwt=140.9077
	60: this_atwt=144.24
	61: this_atwt=145.
	62: this_atwt=150.36
	63: this_atwt=151.96
	64: this_atwt=157.25
	65: this_atwt=158.9254
	66: this_atwt=162.5
	67: this_atwt=164.9304
	68: this_atwt=167.26
	69: this_atwt=168.9342
	70: this_atwt=173.04
	71: this_atwt=174.967
	72: this_atwt=178.49
	73: this_atwt=180.9479
	74: this_atwt=183.85
	75: this_atwt=186.207
	76: this_atwt=190.2
	77: this_atwt=192.22
	78: this_atwt=195.08
	79: this_atwt=196.9665
	80: this_atwt=200.59
	81: this_atwt=204.383
	82: this_atwt=207.2
	83: this_atwt=208.9804
	84: this_atwt=209.
	85: this_atwt=210.
	86: this_atwt=222.
	87: this_atwt=223.
	88: this_atwt=226.0254
	89: this_atwt=227.0278
	90: this_atwt=232.0381
	91: this_atwt=231.0359
	92: this_atwt=238.0289
	else: this_atwt=0.
	endcase

	atwt=atwt+z_array(i)*this_atwt
    endif
endfor

return
end