# Analyzing SpeedTest Data
This is a **Shell script** which performs a speed test using [SpeedTest CLI](https://github.com/sivel/speedtest-cli), then invokes a Python script and an R script respectively to store and analyze the data.

## Arguments
* `$1`: if `1`, `true`, `True` or `TRUE`, a speed test is performed, and data is appended in a single line of a `.txt` file as JSON object.
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