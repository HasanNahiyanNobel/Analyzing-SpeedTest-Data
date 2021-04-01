library(vistime)

timeline_data = data.frame(event = c("Event 1", "Event 2"),
														start = c("2020-06-06", "2020-10-01"),
														end = c("2020-10-01", "2020-12-31"),
														# color = c("red", "blue"),
														# fontcolor = c("blue", "red"),
														group = "Speed (Mbps)")

timeline_data = read.csv("SpeedTest Down-Up Data.csv")

vistime(timeline_data)
