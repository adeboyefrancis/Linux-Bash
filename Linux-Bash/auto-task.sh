#!/bin/bash

separator="---------------------------------"


# System Monitoring Process Script
echo " Task Scheduler "
echo $separator

echo "Start Time: $(date)"
echo "Host Name:  $(hostname)"

echo $separator

echo "Uptime:     $(uptime)"

echo $separator
echo "User:       $(whoami)"

echo $separator

echo "Process:    $(ps)"

echo $separator

echo "Memory Available: $(free)"

echo $separator

echo "Disk Usage:  $(df -h | head -n 5)"

echo $separator

echo "End Time: $(date)"
date >> ~/timestamp-log.txt
echo $separator


echo "Automate Logs"



# Prompt the user to enter the log type and filename
read -p "Log Type ($1): " log_type
read -p "Log Filename ($2): " log_filename

# Validate the log type
if [ "$log_type" != "process" ]; then
    echo "Invalid log type. Please enter 'process'"
    exit 1
fi

# Fetch Log type output and redirect it to the specified log file
if [ "$log_type" == "process" ]; then
    echo "Fetching process log..."
    echo "$(ps -aux | head -n 1 && ps -aux | grep apache)" > "$log_filename"
    echo "Process log saved to '$log_filename'."
    sleep 3
    echo "Loading.... '$log_filename'."
    cat "$log_filename"

fi