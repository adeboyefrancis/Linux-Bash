#!/bin/bash

# Day of the week
: '
day_of_week=$(date +%A)


echo "$day_of_week"
'

# search file utility
# Check if a search term is provided
if [ -z "$1" ]; then
  echo "Usage: $0 search_term"
  exit 1
fi

# Assign the search term to a variable
SEARCH_TERM=$1

# Search for files in the current directory and its subdirectories


echo "Searching for files containing: $SEARCH_TERM"
find . -type f -name "*$SEARCH_TERM*"
