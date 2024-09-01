#!/bin/bash

# Set up debugging, if needed
    
    # exec 2> ./trace$$.log # Redirect errors to trace log
    # or
    # exec >& ~/Documents/pandoc_md_to_odt$$.log 2>&1 # Redirect all output to trace log
    # set -x

# Check if an argument was provided

    if [ $# -eq 0 ]; then
        zenity --error --text="No argument provided. Please run the script with an argument." --title="Error"
        exit 1
    fi


# Loop through the list of files provided in the argument, convert to OpenDocument Text

    for full_file_path in "$@"; do

        file_basename=$(basename -- "$full_file_path")

        # extension="${filename##*.}"

        filename_without_extension="${file_basename%.*}"

        file_path=$(dirname -- "$full_file_path")

        pandoc "$full_file_path" -o "$file_path/$filename_without_extension.odt"

    done


# Press any key to continue

    # read -n 1 -s -r -p "Press any key to continue"; echo
