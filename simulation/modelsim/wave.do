view wave 
wave clipboard store
wave create -driver freeze -pattern clock -initialvalue 0 -period 100ps -dutycycle 50 -starttime 0ps -endtime 1000ps sim:/cpu/banco/Clock 
wave create -driver freeze -pattern constant -value 1 -starttime 0ps -endtime 100ps sim:/cpu/banco/reset 
wave create -driver freeze -pattern clock -initialvalue 0 -period 100ps -dutycycle 50 -starttime 0ps -endtime 1000ps sim:/cpu/clock 
wave create -driver freeze -pattern clock -initialvalue 1 -period 100ps -dutycycle 50 -starttime 0ps -endtime 100ps sim:/cpu/reset 
wave modify -driver freeze -pattern constant -value 1 -starttime 0ps -endtime 100ps Edit:/cpu/reset 
wave modify -driver freeze -pattern constant -value 0 -starttime 100ps -endtime 1000ps Edit:/cpu/reset 
WaveCollapseAll -1
wave clipboard restore
