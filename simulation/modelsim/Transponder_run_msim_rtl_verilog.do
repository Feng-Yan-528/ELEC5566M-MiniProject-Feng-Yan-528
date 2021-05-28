transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+C:/Users/YF/workspace/ELEC5566M-MiniProject-Feng-Yan-528/ELEC5566M-MiniProject-Feng-Yan-528 {C:/Users/YF/workspace/ELEC5566M-MiniProject-Feng-Yan-528/ELEC5566M-MiniProject-Feng-Yan-528/Subject.v}
vlog -vlog01compat -work work +incdir+C:/Users/YF/workspace/ELEC5566M-MiniProject-Feng-Yan-528/ELEC5566M-MiniProject-Feng-Yan-528 {C:/Users/YF/workspace/ELEC5566M-MiniProject-Feng-Yan-528/ELEC5566M-MiniProject-Feng-Yan-528/Bigscreen.v}
vlog -vlog01compat -work work +incdir+C:/Users/YF/workspace/ELEC5566M-MiniProject-Feng-Yan-528/ELEC5566M-MiniProject-Feng-Yan-528 {C:/Users/YF/workspace/ELEC5566M-MiniProject-Feng-Yan-528/ELEC5566M-MiniProject-Feng-Yan-528/UpCounterNbit.v}
vlog -vlog01compat -work work +incdir+C:/Users/YF/workspace/ELEC5566M-MiniProject-Feng-Yan-528/ELEC5566M-MiniProject-Feng-Yan-528 {C:/Users/YF/workspace/ELEC5566M-MiniProject-Feng-Yan-528/ELEC5566M-MiniProject-Feng-Yan-528/LT24Display.v}
vlog -vlog01compat -work work +incdir+C:/Users/YF/workspace/ELEC5566M-MiniProject-Feng-Yan-528/ELEC5566M-MiniProject-Feng-Yan-528 {C:/Users/YF/workspace/ELEC5566M-MiniProject-Feng-Yan-528/ELEC5566M-MiniProject-Feng-Yan-528/Seg_display.v}
vlog -vlog01compat -work work +incdir+C:/Users/YF/workspace/ELEC5566M-MiniProject-Feng-Yan-528/ELEC5566M-MiniProject-Feng-Yan-528 {C:/Users/YF/workspace/ELEC5566M-MiniProject-Feng-Yan-528/ELEC5566M-MiniProject-Feng-Yan-528/FD.v}
vlog -vlog01compat -work work +incdir+C:/Users/YF/workspace/ELEC5566M-MiniProject-Feng-Yan-528/ELEC5566M-MiniProject-Feng-Yan-528 {C:/Users/YF/workspace/ELEC5566M-MiniProject-Feng-Yan-528/ELEC5566M-MiniProject-Feng-Yan-528/Counter.v}
vlog -vlog01compat -work work +incdir+C:/Users/YF/workspace/ELEC5566M-MiniProject-Feng-Yan-528/ELEC5566M-MiniProject-Feng-Yan-528 {C:/Users/YF/workspace/ELEC5566M-MiniProject-Feng-Yan-528/ELEC5566M-MiniProject-Feng-Yan-528/Countdown.v}
vlog -vlog01compat -work work +incdir+C:/Users/YF/workspace/ELEC5566M-MiniProject-Feng-Yan-528/ELEC5566M-MiniProject-Feng-Yan-528 {C:/Users/YF/workspace/ELEC5566M-MiniProject-Feng-Yan-528/ELEC5566M-MiniProject-Feng-Yan-528/transponder.v}
vlog -vlog01compat -work work +incdir+C:/Users/YF/workspace/ELEC5566M-MiniProject-Feng-Yan-528/ELEC5566M-MiniProject-Feng-Yan-528 {C:/Users/YF/workspace/ELEC5566M-MiniProject-Feng-Yan-528/ELEC5566M-MiniProject-Feng-Yan-528/Tr.v}
vlog -vlog01compat -work work +incdir+C:/Users/YF/workspace/ELEC5566M-MiniProject-Feng-Yan-528/ELEC5566M-MiniProject-Feng-Yan-528 {C:/Users/YF/workspace/ELEC5566M-MiniProject-Feng-Yan-528/ELEC5566M-MiniProject-Feng-Yan-528/TRUE.v}
vlog -vlog01compat -work work +incdir+C:/Users/YF/workspace/ELEC5566M-MiniProject-Feng-Yan-528/ELEC5566M-MiniProject-Feng-Yan-528 {C:/Users/YF/workspace/ELEC5566M-MiniProject-Feng-Yan-528/ELEC5566M-MiniProject-Feng-Yan-528/ERROR.v}

vlog -vlog01compat -work work +incdir+C:/Users/YF/workspace/ELEC5566M-MiniProject-Feng-Yan-528/ELEC5566M-MiniProject-Feng-Yan-528/simulation {C:/Users/YF/workspace/ELEC5566M-MiniProject-Feng-Yan-528/ELEC5566M-MiniProject-Feng-Yan-528/simulation/Transponder_tb.v}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cyclonev_ver -L cyclonev_hssi_ver -L cyclonev_pcie_hip_ver -L rtl_work -L work -voptargs="+acc"  Transponder_tb

add wave *
view structure
view signals
run 20 sec
