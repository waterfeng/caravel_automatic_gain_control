v {xschem version=2.9.9 file_version=1.2 }
G {}
K {}
V {}
S {}
E {}
N 440 -270 440 -230 { lab=out}
N 440 -250 520 -250 { lab=out}
N 380 -200 400 -200 { lab=in}
N 380 -300 380 -200 { lab=in}
N 380 -300 400 -300 { lab=in}
N 330 -250 380 -250 { lab=in}
N 440 -350 440 -330 { lab=vdd}
N 440 -170 440 -150 { lab=GND}
C {sky130_fd_pr/nfet3_01v8.sym} 420 -200 0 0 {name=M1
L=0.15
W=1
body=GND
nf=1
mult=1
ad="'int((nf+1)/2) * W/nf * 0.29'" 
pd="'2*int((nf+1)/2) * (W/nf + 0.29)'"
as="'int((nf+2)/2) * W/nf * 0.29'" 
ps="'2*int((nf+2)/2) * (W/nf + 0.29)'"
nrd="'0.29 / W'" nrs="'0.29 / W'"
sa=0 sb=0 sd=0
model=nfet_01v8
spiceprefix=X
}
C {sky130_fd_pr/pfet3_01v8.sym} 420 -300 0 0 {name=M2
L=0.15
W=1
body=VDD
nf=1
mult=1
ad="'int((nf+1)/2) * W/nf * 0.29'" 
pd="'2*int((nf+1)/2) * (W/nf + 0.29)'"
as="'int((nf+2)/2) * W/nf * 0.29'" 
ps="'2*int((nf+2)/2) * (W/nf + 0.29)'"
nrd="'0.29 / W'" nrs="'0.29 / W'"
sa=0 sb=0 sd=0
model=pfet_01v8
spiceprefix=X
}
C {devices/gnd.sym} 440 -150 0 0 {name=l1 lab=GND}
C {devices/code.sym} 10 -410 0 0 {name=TT_MODELS
only_toplevel=true
format="tcleval( @value )"
value="** manual skywater pdks install (with patches applied)
* .lib \\\\$::SKYWATER_MODELS\\\\/models/sky130.lib.spice tt

** opencircuitdesign pdks install
.lib \\\\$::SKYWATER_MODELS\\\\/sky130.lib.spice tt

.param mc_mm_switch=0
.param mc_pr_switch=0
"
spice_ignore=false}
C {devices/code_shown.sym} 640 -420 0 0 {name=NGSPICE 
only_toplevel=false 
value=".option TEMP=27C
.option dccap post brief accurate nomod

.dc v2 0 3 0.01

.control
  run
  plot (v(v2)) (v(net1))
.endc

.save all
"}
C {devices/ipin.sym} 330 -250 0 0 {name=in lab=in}
C {devices/opin.sym} 520 -250 0 0 {name=out lab=out}
C {devices/ipin.sym} 440 -350 1 0 {name=vdd lab=vdd}