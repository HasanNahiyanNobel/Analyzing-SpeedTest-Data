# Analyzing SpeedTest Data
This project is a combination of three different scripts—which together perform a speed test using [SpeedTest CLI](https://github.com/sivel/speedtest-cli), store the data, and generate a graph showing the speeds of download and upload.




## Workflow
1. The shell script `SpeedtestAndExportAndPlotData.sh` performs a speed test, and stores the data in a output file named `EncryptedSpeedTestOutputs.txt`.
2. The same shell scripts invokes the python script `SpeedTestDataExporter.py`—which exports selected data (timestamp, download, upload) to the csv file named `EncryptedSpeedTestDownUpData.csv`.
3. Lastly, the shell script invokes the R script named `PlottingDataWithR.R`—which uses the csv file to generate two line graphs (one for download speed, another for upload) in a single file named `EncryptedRPlot.png`.




## Arguments of the Shell Script
* `$1`: if `1`, `true`, `True` or `TRUE`, a speed test is performed, and data is appended in a single line of a `.txt`
  file as JSON object.
* `$2`: if `1`, `true`, `True` or `TRUE`, then selected data (*timestamp*, *download*, *upload*) from the `.txt` file is exported to a `.csv` file, using the Python script.
* `$3`: if `1`, `true`, `True` or `TRUE`, data from the `.csv` file is plotted on two timeline graphs and exported as a `.png` file using the R script.
* `$4`: used for the `start_time` of the timeline graph, with a default value `2000-01-01 00:00:00`. Possible cases are,
	- If not given, then the default value
	- If `TRUE`, then also the default value
	- If given in a format which `POSIXct` can parse, then the given value.
* `$5`: used for the `numeric_plot_type` of the plot, with a default value `"line"`. Possible cases are,
	- If not given, then the default value
	- If `TRUE`, then also the default value
	- If `"line"`, `"plot"` or `"step"`, then the given value.




## Optional Batch Script
Task Scheduler of Windows 10 doesn't seem friendly to shell scripts, so there is a batch script named `RunnerOfShellScript.bat`—which, as the name suggests, just invokes the shell script with some arguments.




## Thanks to
1. Matt Martz of course, for [SpeedTest CLI](https://github.com/sivel/speedtest-cli).
2. Aaron Bull Schaefer for the script [Transcrypt](https://github.com/elasticdog/transcrypt), which I used to encrypt my outputs.
