dim cArray
dim WshShell
cArray = Array("~","~","~","~")

set WshShell = WScript.CreateObject("WScript.Shell")
WshShell.Run "NoCD.exe"
WScript.Sleep 300
WshShell.AppActivate "NoCD.exe"
WScript.Sleep 300

for i = 0 to 3
WshShell.SendKeys cArray(i)
WScript.Sleep 600
next

