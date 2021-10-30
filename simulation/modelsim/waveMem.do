view wave 
wave clipboard store
wave create -driver freeze -pattern clock -initialvalue 0 -period 1000ps -dutycycle 50 -starttime 0ps -endtime 10000ps sim:/memoria/Clock 
wave create -driver freeze -pattern constant -value 00000010 -range 7 0 -starttime 0ps -endtime 1000ps sim:/memoria/PC_endereco 
WaveExpandAll -1
wave modify -driver freeze -pattern constant -value 00000110 -range 7 0 -starttime 1000ps -endtime 2000ps Edit:/memoria/PC_endereco 
wave modify -driver freeze -pattern constant -value 00000000 -range 7 0 -starttime 1000ps -endtime 2000ps Edit:/memoria/PC_endereco 
WaveCollapseAll -1
wave clipboard restore
