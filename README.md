# Analyzing SpeedTest Data
This is a combination of three different scripts which uses data from [SpeedTest CLI](https://www.speedtest.net/apps/cli) to analyze internet connection speed.

Workflow of the scripts is as follows:
1. A **Shell Script** is executed from command line with 3 arguments.
1. If the 1st argument is 1, then a **SpeedTest** is performed, and data is appended in a single line of a `.txt` file, as JSON object.
1. If the 2nd argument is 1, then selected data (*timestamp*, *download*, *upload*) from the `.txt` file is exported to a `.csv` file, using a **Python Script**.
1. If the 3rd argument is 1, data from `.csv` file is plotted on two timeline graphs and exported as `.png` file using an **R Script**.
