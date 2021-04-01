#!/bin/bash
# Argument $1 == 1: A speedtest will be performed
# Argument $1 != 1: No speedtest will be performed
# Argument $2 == 1: Data will be converted to csv
# Argument $2 != 1: Data will not be converted to csv

if [ $1 -eq 1 ]; then
	speedtest --json >> SpeedTest\ Outputs.txt
	echo "Test complete."
fi

if [ $2 -eq 1 ]; then
	python SpeedTest\ Data\ Analyzer.py
	echo "Converted data to CSV."
fi
