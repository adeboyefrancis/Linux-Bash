#!/bin/bash

#Define source directory 
scr_to_back="$HOME/my-document-s3"

#Define S3 bucket name
bucket_name="back-up-ops-2024"

#Define s3 bucket path to destination
bucket_path="s3://$bucket_name"

#Upload files bucket destination
if  [ -f "$scr_to_back" ]; then
  aws s3 cp "$scr_to_back" "$bucket_path"
if  [ $? -eq 0 ]; then
  echo "File backup successfully"
else
  echo "File backup failed"
fi
elif [ -d "$src_to_back" ]; then
  aws s3 sync "$src_to_back" "$bucket_path/"
  if [ $? -eq 0 ]; then
    echo "Folder backup synced successfully"
  else
    echo "Folder backup failed"
  fi
else
  echo "Invalid source path"
fi