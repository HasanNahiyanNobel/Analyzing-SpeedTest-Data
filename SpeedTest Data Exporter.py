import json
from datetime import datetime, timedelta

file_input = open("SpeedTest Outputs.txt", "r")

open("SpeedTest Down-Up Data.csv", "w").close()  # Clear existing data.
file_output = open("SpeedTest Down-Up Data.csv", "a")
file_output.write("Timestamp, Download Speed (MB/s), Upload Speed (MB/s)\n")

for a_line in file_input:
	# Get data from json formats.
	json_data = json.loads(a_line)
	timestamp = json_data["timestamp"][:-1]  # Get timestamp in ISO format, without the last 'Z' character.
	download = round(json_data["download"] / 8000000, 2)  # Convert the speed to MB/s and round to 2 digits after decimal.
	upload = round(json_data["upload"] / 8000000, 2)  # Convert the speed to MB/s and round to 2 digits after decimal.

	# Add 6 hours to timestamp to match my local time.
	timestamp = datetime.fromisoformat(timestamp) + timedelta(hours=6)

	# Write the line to csv file.
	string_to_write = timestamp.strftime("%Y-%m-%d %H:%M:%S") + ", " + str(download) + ", " + str(upload) + "\n"
	file_output.write(string_to_write)

file_input.close()
file_output.close()
