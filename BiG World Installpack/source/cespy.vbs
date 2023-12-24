dim cArray
dim WshShell
Dim ScriptPath
ScriptPath = WScript.Arguments(0)
cArray = Array("~", "{TAB}", "{TAB}", ScriptPath, "{TAB}", "{TAB}", "~","~","~")

set WshShell = WScript.CreateObject("WScript.Shell")
WshShell.Run "CespyAudioV1.exe"
WScript.Sleep 200
WshShell.AppActivate "CespyAudioV1.exe"
WScript.Sleep 200

for i = 0 to 8
WshShell.SendKeys cArray(i)
WScript.Sleep 200
next

wScript.Sleep 10000

WshShell.AppActivate "c2audioREADME.txt"
WScript.Sleep 200
Wshshell.sendkeys ("%{F4}"), true
