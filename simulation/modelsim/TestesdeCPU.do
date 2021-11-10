view wave 
wave clipboard store
wave create -pattern clock -initialvalue 0 -period 1000ps -dutycycle 50 -starttime 0ps -endtime 10000ps sim:/projeto2/Clock 
wave create -pattern constant -value 1 -starttime 0ps -endtime 1000ps sim:/projeto2/reset 
wave create -driver freeze -pattern clock -initialvalue 0 -period 500ps -dutycycle 50 -starttime 0ps -endtime 6000ps sim:/cpu/clock 
wave create -driver freeze -pattern constant -value 1 -starttime 0ps -endtime 1000ps sim:/cpu/reset 
wave modify -driver freeze -pattern constant -value 0 -starttime 1000ps -endtime 6000ps Edit:/cpu/reset 
WaveCollapseAll -1
wave clipboard restore
