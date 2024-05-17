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

# Zenity dialog to confirm before starting the script
    
    zenity --question --icon-name=dialog-warning --title="Confirm action" --text="<big>This script will copy files / folders to a new location, then securely destroy the original files / folders. Are you sure you wish to continue?</big>" || exit


# Propt the user for new location

	folder=$(zenity  --file-selection --title="Please select a destination folder" --directory)"/"


# Copy files and folders to new location

    for file in "$@"; do
        cp -r "$file" "$folder"
    done

# Now shred the original files

    bleachbit --shred "$@"

# Press any key to continue

    read -n 1 -s -r -p "Press any key to continue"; echo
