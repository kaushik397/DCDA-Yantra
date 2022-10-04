transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+D:/Projects/ROBOTICS-COMP/PERSONAL/4_to_1_mux {D:/Projects/ROBOTICS-COMP/PERSONAL/4_to_1_mux/mux2x1.v}
vlog -vlog01compat -work work +incdir+D:/Projects/ROBOTICS-COMP/PERSONAL/4_to_1_mux {D:/Projects/ROBOTICS-COMP/PERSONAL/4_to_1_mux/mux4_to_1.v}

vlog -vlog01compat -work work +incdir+D:/Projects/ROBOTICS-COMP/PERSONAL/4_to_1_mux {D:/Projects/ROBOTICS-COMP/PERSONAL/4_to_1_mux/mux4x2_tb.v}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cycloneive_ver -L rtl_work -L work -voptargs="+acc"  mux4x2_tb

add wave *
view structure
view signals
run -all
