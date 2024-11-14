#!/bin/bash

# Set up debugging, if needed
    
    # exec 2> ./trace$$.log # Redirect errors to trace log
    # or
    # exec >& ~/Documents/pdf_print$$.log 2>&1 # Redirect all output to trace log
    # set -x

# Check if an argument was provided

    if [ $# -eq 0 ]; then
        zenity --error --text="No argument provided. Please run the script with an argument." --title="Error"
        exit 1
    fi

# Check the default printer
    
    default_printer=$(lpstat -d)

# Determine whether a default printer is set or not

    if ! [[ $default_printer == *"system default destination: "* ]]; then
        # echo "Default printer is set: ${default_printer#*: }"
        # zenity --info --text="Default printer is set: ${default_printer#*: }" --title="Default printer found"
    # else
        # echo "No default printer set."
        zenity --error --text="No default printer is set, or the default printer is switched off. Please set a default printer first, or switch on the default printer." --title="Error"
        exit 1
    fi 

# Propt the user to confirm archive extraction. If the user says no, then bail out.
    
	zenity --question --icon-name=dialog-question --title="Confirm print" --text="Would you like to print each selected PDF on the default printer?" || exit


# Loop through the list of files provided in the argument, create target directories and extract the archives

    for full_file_path in "$@"; do

        lpr "$full_file_path" 

    done


# Press any key to continue

    read -n 1 -s -r -p "Press any key to continue"; echo
