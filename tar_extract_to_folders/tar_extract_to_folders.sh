#!/bin/bash

# Set up debugging, if needed
    
    # exec 2> ./trace$$.log # Redirect errors to trace log
    # or
    # exec >& ~/Documents/trace$$.log 2>&1 # Redirect all output to trace log
    # set -x

# Check if an argument was provided

    if [ $# -eq 0 ]; then
        zenity --error --text="No argument provided. Please run the script with an argument." --title="Error"
        exit 1
    fi

# Propt the user to confirm archive extraction. If the user says no, then bail out.
    
	zenity --question --icon-name=dialog-question --title="Confirm extraction" --text="Would you like to extract each selected archive to its own folder?" || exit


# Loop through the list of files provided in the argument, create target directories and extract the archives

    for full_file_path in "$@"; do

        file_basename=$(basename -- "$full_file_path")

        # extension="${filename##*.}"

        filename_without_extension="${file_basename%.*}"

        file_path=$(dirname -- "$full_file_path")

        target_folder="$file_path/$filename_without_extension"

        mkdir "$target_folder"

        # 7z x "$full_file_path" -o"$target_folder/"
        tar -xf "$full_file_path" -C "$target_folder/"

    done


# Press any key to continue

    # read -n 1 -s -r -p "Press any key to continue"; echo
