#!/bin/sh
Pause() {
	read -p "Press any key to continue..."
}

MainMenu() {
	clear
	echo "================================================================="
	echo "| Online Movie Store DBMS - Oracle All Inclusive Tool"
	echo "|"
	echo "| Main Menu - Select Desired Operation(s):"
	echo "|"
	echo "| <CTRL-Z Anytime to Enter Interactive CMD Prompt>"
	echo "|"
	echo "-----------------------------------------------------------------"
	echo " 1) Drop Tables"
	echo " 2) Drop Views"
	echo " 3) Create Tables"
	echo " 4) Create Views"
	echo " 5) Populate Tables"
	echo " 6) Query Tables"
	echo " "
	echo " E) End/Exit"
	echo "Choose: "
	
	read CHOICE

	if [ "$CHOICE" == "0" ]
	then
		echo "Nothing Here"
		Pause
	elif [ "$CHOICE" == "1" ]
	then
		bash drop_tables.sh
		Pause
	elif [ "$CHOICE" == "2" ]
	then
		bash drop_views.sh
		Pause
	elif [ "$CHOICE" == "3" ]
	then
		bash create_tables.sh
		Pause	
	elif [ "$CHOICE" == "4" ]
	then
		bash create_views.sh
		Pause
	elif [ "$CHOICE" == "5" ]
	then
		bash populate_tables.sh
		Pause
	elif [ "$CHOICE" == "6" ]
	then
		bash queries.sh
		Pause
	elif [ "$CHOICE" == "E" ]
	then
		exit
	fi
}
#--COMMENTS BLOCK--
# Main Program
#--COMMENTS BLOCK--
ProgramStart() {
	while [ 1 ]
	do
		MainMenu
	done
}

ProgramStart
