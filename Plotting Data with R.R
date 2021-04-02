#!/usr/bin/env Rscript
library(dplyr, quietly = T)
require(timelineR)

timeline_data = read.csv("SpeedTest Down-Up Data.csv",
												 skip = 1, # Skip the header
												 header = FALSE,
												 col.names = c("col_datetime","col_down","col_up"))

timeline_data$col_datetime = as.POSIXct(timeline_data$col_datetime)

start_time = as.POSIXct("2021-01-01 00:00:00")

titles = c("col_down" = "Download Speed",
					 "col_up" = "Upload Speed")

ylabels = c("col_down" = "Speed (Mbps)",
						"col_up" = "Speed (Mbps)")

save_path = "F:/Projects/SpeedTest Data/Rplot.png"

plot_grob = plot_timeline(timeline_data,
													start_time = start_time,
													titles = titles,
													ylabels = ylabels,
													save_path = save_path,
													output_width = 1350,
													output_height = 600)
