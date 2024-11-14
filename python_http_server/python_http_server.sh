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
    
	zenity --question --icon-name=dialog-question --title="Start Python HTTP server" --text="Would you like to start a Python HTTP server here?" || exit


# URL to open

    URL="http://localhost:8000"

# Brief pause to ensure the server has time to start

    # sleep 1

# Open the URL

    xdg-open "$URL"



# Start the Python HTTP server

    python3 -m http.server --directory  "$@"


# Press any key to continue

    # read -n 1 -s -r -p "Press any key to continue"; echo
