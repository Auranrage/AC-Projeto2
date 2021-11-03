view wave 
wave clipboard store
wave create -driver freeze -pattern clock -initialvalue 0 -period 100ps -dutycycle 50 -starttime 0ps -endtime 10000ps sim:/banco_registradores/Clock 
wave create -driver freeze -pattern constant -value 1 -starttime 0ps -endtime 400ps sim:/banco_registradores/RegWrite 
wave modify -driver freeze -pattern constant -value 0 -starttime 400ps -endtime 1000ps Edit:/banco_registradores/RegWrite 
wave create -driver freeze -pattern constant -value 00000000 -range 7 0 -starttime 0ps -endtime 100ps sim:/banco_registradores/WriteData 
WaveExpandAll -1
wave modify -driver freeze -pattern constant -value 00000001 -range 7 0 -starttime 100ps -endtime 200ps Edit:/banco_registradores/WriteData 
wave modify -driver freeze -pattern constant -value 01000000 -range 7 0 -starttime 100ps -endtime 200ps Edit:/banco_registradores/WriteData 
wave modify -driver freeze -pattern constant -value 10000000 -range 7 0 -starttime 200ps -endtime 300ps Edit:/banco_registradores/WriteData 
wave modify -driver freeze -pattern constant -value 11000000 -range 7 0 -starttime 300ps -endtime 400ps Edit:/banco_registradores/WriteData 
wave create -driver freeze -pattern constant -value 00 -range 1 0 -starttime 0ps -endtime 100ps sim:/banco_registradores/WriteReg 
WaveExpandAll -1
wave modify -driver freeze -pattern constant -value 01 -range 1 0 -starttime 100ps -endtime 200ps Edit:/banco_registradores/WriteReg 
wave modify -driver freeze -pattern constant -value 10 -range 1 0 -starttime 200ps -endtime 300ps Edit:/banco_registradores/WriteReg 
wave modify -driver freeze -pattern constant -value 11 -range 1 0 -starttime 300ps -endtime 400ps Edit:/banco_registradores/WriteReg 
wave create -driver freeze -pattern constant -value 00 -range 1 0 -starttime 0ps -endtime 200ps sim:/banco_registradores/ReadReg1 
WaveExpandAll -1
wave modify -driver freeze -pattern constant -value 01 -range 1 0 -starttime 200ps -endtime 400ps Edit:/banco_registradores/ReadReg1 
wave create -driver freeze -pattern constant -value 10 -range 1 0 -starttime 0ps -endtime 200ps sim:/banco_registradores/ReadReg2 
WaveExpandAll -1
wave modify -driver freeze -pattern constant -value 11 -range 1 0 -starttime 200ps -endtime 400ps Edit:/banco_registradores/ReadReg2 
wave modify -driver freeze -pattern constant -value 10 -range 1 0 -starttime 200ps -endtime 400ps Edit:/banco_registradores/ReadReg1 
wave modify -driver freeze -pattern constant -value 01 -range 1 0 -starttime 0ps -endtime 200ps Edit:/banco_registradores/ReadReg2 
WaveCollapseAll -1
wave clipboard restore
