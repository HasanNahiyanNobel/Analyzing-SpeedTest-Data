#!/bin/bash

##	Arguments:
##	$1: if true, a speedtest will be performed
##	$2: if true, data will be exported to csv
##	$3: if true, data will be plotted to a png file
##	$4: arg1 of R script
##	$5: arg2 of R script

if [ "$1" = "1" ] || [ "$1" = "true" ] || [ "$1" = "True" ] || [ "$1" = "TRUE" ]; then
	speedtest --json >> "SpeedTest Outputs.txt"
	echo "Test complete."
fi

if [ "$2" = "1" ] || [ "$2" = "true" ] || [ "$2" = "True" ] || [ "$2" = "TRUE" ]; then
	python "SpeedTest Data Exporter.py"
	echo "Exported data to CSV."
fi

if [ "$3" = "1" ] || [ "$3" = "true" ] || [ "$3" = "True" ] || [ "$3" = "TRUE" ]; then
  echo "" # Just because this new line feels good.
	Rscript "Plotting Data with R.R" "$4" "$5"
	echo "Plotted Data in file."
	rm Rplots.pdf # Remove the unnecessary pdf file
fi
