onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /cpu/clock
add wave -noupdate /cpu/Control/state
add wave -noupdate /cpu/PCout
add wave -noupdate /cpu/instrucao
add wave -noupdate /cpu/UCout
add wave -noupdate /cpu/result
add wave -noupdate /cpu/banco/Q0
add wave -noupdate /cpu/banco/Q1
add wave -noupdate /cpu/banco/Q2
add wave -noupdate /cpu/banco/Q3
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {14 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 150
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 0
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ns
update
WaveRestoreZoom {0 ps} {1 ns}
view wave 
wave clipboard store
wave create -driver freeze -pattern clock -initialvalue 1 -period 100ps -dutycycle 50 -starttime 0ps -endtime 2000ps sim:/cpu/clock 
wave create -driver freeze -pattern clock -initialvalue 1 -period 100ps -dutycycle 50 -starttime 0ps -endtime 2000ps sim:/cpu/clock 
WaveCollapseAll -1
wave clipboard restore
