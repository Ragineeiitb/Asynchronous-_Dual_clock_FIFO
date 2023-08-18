transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+D:/Asyncronous_FIFO {D:/Asyncronous_FIFO/b_to_g.v}
vlog -vlog01compat -work work +incdir+D:/Asyncronous_FIFO {D:/Asyncronous_FIFO/Asynchronous_FIFO.v}
vlog -vlog01compat -work work +incdir+D:/Asyncronous_FIFO {D:/Asyncronous_FIFO/synchro_r2W.v}
vlog -vlog01compat -work work +incdir+D:/Asyncronous_FIFO {D:/Asyncronous_FIFO/synchro_W2r.v}
vlog -vlog01compat -work work +incdir+D:/Asyncronous_FIFO {D:/Asyncronous_FIFO/readptr_empty.v}
vlog -vlog01compat -work work +incdir+D:/Asyncronous_FIFO {D:/Asyncronous_FIFO/writeptr_full.v}
vlog -vlog01compat -work work +incdir+D:/Asyncronous_FIFO {D:/Asyncronous_FIFO/fifomem.v}

vlog -vlog01compat -work work +incdir+D:/Asyncronous_FIFO {D:/Asyncronous_FIFO/tb_fifo.v}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cyclonev_ver -L cyclonev_hssi_ver -L cyclonev_pcie_hip_ver -L rtl_work -L work -voptargs="+acc"  tb_fifo

add wave *
view structure
view signals
run -all
