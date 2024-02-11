#!/bin/bash
# Finder script for assignment 1 
# Author: Sai Pranav Teja Y

filesdir=/path/to/search/
searchstr=strng_to_find
file_count=0
line_count=0

if [ "$#" -ne 2 ]; then
    echo "Error: $# is not the expected number of parameters"
    exit 1
else
    filesdir=$1
    searchstr=$2   
    if [ ! -d "$filesdir" ];    then
        echo "Error: $filesdir Dosen't Exist"
        exit 1
    else
        while IFS= read -r -d '' file; do
            if [ -f "$file" ]; then
                # Increment file count
                ((file_count++))
                # Search for the target string in the current file
                while IFS= read -r line; do
                    if [[ "$line" == *"$searchstr"* ]]; then
                        # Increment line count if the string is found in the line
                        ((line_count++))
                    fi
                done < "$file"
            fi
        done < <(find "$filesdir" -type f -print0)
        echo "The number of files are $file_count and the number of matching lines are $line_count"
        exit 0
    fi
fi