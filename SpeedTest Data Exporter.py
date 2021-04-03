import json

file_input = open("SpeedTest Outputs.txt", "r")

open("SpeedTest Down-Up Data.csv", "w").close()  # Clear existing data
file_output = open("SpeedTest Down-Up Data.csv", "a")
file_output.write("Date-Time, Download Speed (MB/s), Upload Speed (MB/s)\n")

for a_line in file_input:
	json_data = json.loads(a_line)
	timestamp = json_data["timestamp"]
	download = round(json_data["download"] / 8000000, 2)
	upload = round(json_data["upload"] / 8000000, 2)

	date = timestamp[:10]  # date as yyyy-mm-dd format
	time = timestamp[11:-8]  # time as hh:mm:ss format

	string_to_write = date + " " + time + ", " + str(download) + ", " + str(upload) + "\n"
	file_output.write(string_to_write)

file_input.close()
file_output.close()
