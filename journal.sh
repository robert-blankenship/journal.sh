#!/usr/bin/env sh

showMenu() {
echo "Press 'n' to create a new entry, 'r' to read the journal, and 'q' to quit"
while true; do
	read -rsn1 input
	if [ "$input" = "n" ]; then
		echo "Writing journal"
		vi ~/journal.d/$(date +%s).journal
		showMenu
		break
	elif [ "$input" = "r" ]; then
		echo "Reading journal"
		tail -n +1 -- ~/journal.d/* | less
		showMenu
		break
	elif [ "$input" = "q" ]; then
		echo "Quitting journal"
		break
	fi
done
}

showMenu
