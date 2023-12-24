:: Replace ########.### and ********.*** with the file name you are looking for.
:: Run the batch file in the BGII directory and see the change-log.txt. 
:: You can make multiple logs from multiple files if you copy-paste the last line, change the log txt files number and remove the "::" at the start.

:: Ersetzt ########.### und ********.*** durch den Dateinamen, nach dem Ihr sucht.
:: Führt die Batch-Datei im BGII Verzeichnis aus und seht in die change-log.txt.
:: Ihr könnt mehrere Protokolle von mehreren Dateien machen, wenn Ihr die letzte Zeile kopiert und einsetzt, die Nummer der log.txt-Dateien ändert und "::" am Beginn der Zeile entfernt.

if not exist change-log MD change-log

WeiDU.exe --log nul --change-log ########.### >change-log/change-log.txt --out change-log
:: WeiDU.exe --log nul --change-log ********.*** >change-log/change-log1.txt --out change-log
