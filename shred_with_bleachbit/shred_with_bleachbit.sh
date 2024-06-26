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

# Propt the user to confirm file destruction
    
	zenity --question --icon-name=dialog-warning --title="Confirm file destruction" --text="Are you sure you want to permanently destroy these files / folders?"

# Check the exit status of Zenity command. If the user confirmed, shred the files.

    if [ $? -eq 0 ]; then

    	zenity --question --icon-name=dialog-warning --title="Confirm file destruction" --text="Are you ABSOLUTELY sure you want to permanently destroy these files / folders (no undo)?"

        if [ $? -eq 0 ]; then

            # zenity --info --text="The user chose Yes" --title="Result"
            bleachbit --shred "$@"
            
        fi
    # else
        # zenity --info --text="The user chose No" --title="Result"
    fi

# Press any key to continue

    # read -n 1 -s -r -p "Press any key to continue"; echo
