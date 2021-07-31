#!/usr/bin/env Rscript

##	Arguments:
##
##	args[1]:
##	Used for start_time of the plot, with a default value of 2000-01-01 00:00:00.
##	Possible cases are,
##		a. If argument not given, then default value
##		b. If TRUE, then default value
##		c. If given in format which POSIXct can parse, then the given value
##
##	args[2]:
##	Used for numeric_plot_type of the plot, with a default value "line".
##	Possible cases are,
##		a. If argument not given, then default value
##		b. If TRUE, then default value
##		c. If given as string, then the given value

library(dplyr, quietly = T)
require(timelineR)

args <- commandArgs(trailingOnly = TRUE)
number_of_args <- length(args)
default_start_time <- as.POSIXct("2000-01-01 00:00:00")
default_numeric_plot_type <- "line"

timeline_data <- read.csv("SpeedTestDownUpData.csv",
						  skip = 1, # Skip the header
						 header = FALSE,
						  col.names = c("col_datetime", "col_down", "col_up"))

timeline_data$col_datetime <- as.POSIXct(timeline_data$col_datetime)

if (number_of_args == 0) {

	# Set default values
	start_time <- default_start_time
	numeric_plot_type <- default_numeric_plot_type

} else if (number_of_args == 1) {

	# Only start_time given
	if (args[1] == TRUE) start_time <- default_start_time
	else start_time <- as.POSIXct(args[1])
	numeric_plot_type <- default_numeric_plot_type

} else {

	# Both start_time and numeric_plot_type given
	if (args[1] == TRUE) start_time <- default_start_time
	else start_time <- as.POSIXct(args[1])
	if (args[2] == TRUE) numeric_plot_type <- default_numeric_plot_type
	else numeric_plot_type <- args[2]

}

titles <- c("col_down" = "Download Speed",
		   "col_up" = "Upload Speed")

ylabels <- c("col_down" = "Speed (MB/s)",
			"col_up" = "Speed (MB/s)")

save_path <- "Rplot.png"

plot_grob <- plot_timeline(timeline_data,
						  start_time = start_time,
						  titles = titles,
						  ylabels = ylabels,
						  numeric_plot_type = numeric_plot_type,
						  save_path = save_path,
						  output_width = 1350,
						  output_height = 600)
