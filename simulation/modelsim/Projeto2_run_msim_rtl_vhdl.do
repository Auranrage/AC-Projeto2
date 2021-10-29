transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vcom -93 -work work {C:/Users/Greed/OneDrive/Documentos/GitHub/AC-Projeto2/ripple_carry.vhd}
vcom -93 -work work {C:/Users/Greed/OneDrive/Documentos/GitHub/AC-Projeto2/full_adder.vhd}
vcom -93 -work work {C:/Users/Greed/OneDrive/Documentos/GitHub/AC-Projeto2/ULA.vhd}

