view wave 
wave clipboard store
wave create -pattern clock -initialvalue 0 -period 1000ps -dutycycle 50 -starttime 0ps -endtime 10000ps sim:/projeto2/Clock 
wave create -pattern constant -value 1 -starttime 0ps -endtime 1000ps sim:/projeto2/reset 
wave modify -driver freeze -pattern constant -value 0 -starttime 1000ps -endtime 10000ps Edit:/projeto2/reset 
wave create -driver freeze -pattern constant -value 00000011 -range 7 0 -starttime 0ps -endtime 10000ps sim:/projeto2/somador/Rj 
wave create -driver freeze -pattern constant -value 00000001 -range 7 0 -starttime 0ps -endtime 10000ps sim:/projeto2/somador/Rk 
wave create -pattern constant -value 00000011 -range 7 0 -starttime 0ps -endtime 10000ps sim:/projeto2/Rj 
wave create -pattern constant -value 00000001 -range 7 0 -starttime 0ps -endtime 10000ps sim:/projeto2/Rk 
wave create -pattern constant -value 0 -starttime 0ps -endtime 10000ps sim:/projeto2/CinR 
WaveCollapseAll -1
wave clipboard restore
