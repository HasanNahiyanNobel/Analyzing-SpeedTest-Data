#!/bin/bash

if		[ "$1" = "1" ] || [ "$1" = "true" ] || [ "$1" = "True" ] || [ "$1" = "TRUE" ]; then
	echo "Ghau"
elif	[ "$1" = "0" ] || [ "$1" = "false" ] || [ "$1" = "False" ] || [ "$1" = "FALSE" ]; then
	echo "Not ghau"
else
	echo
	echo
	echo "Invalid argument \"$1\", script will now exit."
	echo "Ta ta, goodbye!"
fi