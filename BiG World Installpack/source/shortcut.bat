findstr /I /M "shortcut" %IPL%>nul
if not errorlevel 1 (
	%IF% BWIP_English (
		echo en> BWP_LANGUAGE
		echo ge>> BWP_LANGUAGE
	)
	%IF% BWIP_German (
		echo ge> BWP_LANGUAGE
		echo en>> BWP_LANGUAGE
	)
	echo sp>> BWP_LANGUAGE
	echo fr>> BWP_LANGUAGE
	echo it>> BWP_LANGUAGE
	echo cz>> BWP_LANGUAGE
	echo po>> BWP_LANGUAGE
	echo ru>> BWP_LANGUAGE
	echo ch>> BWP_LANGUAGE
	echo ko>> BWP_LANGUAGE
	echo ja>> BWP_LANGUAGE
	type NUL> BWP_NoWide
	type NUL> listnotinstalled
	echo ^0> AnimalCompanions_input.txt
	echo Leo>> AnimalCompanions_input.txt
	echo ^1>> AnimalCompanions_input.txt
	copy /y ".\%BWIPT%\SC_Conflicts.txt" ".\BWP Conflicts.txt"
	rem echo replace_SCS_6000>> %CON% & rem true for 32 bit
	echo SCSreplacement>> %CON% & rem true for 64 bit
	copy /y ".\%BWIPT%\SC_Settings.txt" ".\BWP Settings.txt"
)