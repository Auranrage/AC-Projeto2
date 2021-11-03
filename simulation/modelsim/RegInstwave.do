view wave 
wave clipboard store
wave create -driver freeze -pattern clock -initialvalue 0 -period 100ps -dutycycle 50 -starttime 0ps -endtime 1000ps sim:/reg_instrucao/Clock 
wave create -driver freeze -pattern constant -value 01010111 -range 7 0 -starttime 0ps -endtime 100ps sim:/reg_instrucao/instrucao 
WaveExpandAll -1
wave modify -driver freeze -pattern constant -value 11001100 -range 7 0 -starttime 100ps -endtime 400ps Edit:/reg_instrucao/instrucao 
wave modify -driver freeze -pattern constant -value 00000011 -range 7 0 -starttime 200ps -endtime 400ps Edit:/reg_instrucao/instrucao 
wave create -driver freeze -pattern constant -value 1 -starttime 0ps -endtime 200ps sim:/reg_instrucao/load 
wave modify -driver freeze -pattern constant -value 0 -starttime 200ps -endtime 500ps Edit:/reg_instrucao/load 
WaveCollapseAll -1
wave clipboard restore
