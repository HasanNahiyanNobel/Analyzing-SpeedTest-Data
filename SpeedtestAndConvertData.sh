#!/bin/bash
# Argument $1 == 1: A speedtest will be performed
# Argument $1 != 1: No speedtest will be performed
# Argument $2 == 1: Data will be converted to csv
# Argument $2 != 1: Data will not be converted to csv
# Argument $3 == 1: Data will be plotted to png file
# Argument $3 != 1: Data will not be plotted to png file

if [ $1 -eq 1 ]; then
	speedtest --json >> SpeedTest\ Outputs.txt
	echo "Test complete."
fi

if [ $2 -eq 1 ]; then
	python SpeedTest\ Data\ Analyzer.py
	echo "Converted data to CSV."
fi

if [ $3 -eq 1 ]; then
  echo "" # Just because this new line feels good.
	./Plotting\ Data\ with\ R.R
	echo "Plotted Data in file."
	rm Rplots.pdf # Remove the unnecessary pdf file
fi
