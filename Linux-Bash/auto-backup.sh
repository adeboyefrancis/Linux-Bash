#!/bin/bash

#Define source directory to be backed up
src_to_backup="$HOME/auto-backup/"

#Define the destination directory for back up
dst_to_backup="$HOME/back-ops"

#Define the time stamp of the back up
back_time_ops=$(date +%c)
backup_timestamp=$(date +"%Y-%m-%d_%H-%M-%S")

#Create back up directory
backup_folder="$dst_to_backup/backup_$backup_timestamp"
mkdir -p "back-ops"

#Copy contents to back up folder from source directory
cp -r "$src_to_backup"* "back-ops"

# Using IF statement to logically check if the operation was successful
if  [ $? -eq 0 ]; then
  echo "Backup was successfully created at $back_time_ops : $backup_folder"
else
  echo "Backup Failed"
fi