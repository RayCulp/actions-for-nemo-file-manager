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
    
    zenity --question --icon-name=dialog-warning --title="Confirm action" --text="This script will copy files / folders to a new location, then securely destroy the original files / folders. Are you sure you wish to continue?" || exit


# Propt the user for new location

	folder=$(zenity  --file-selection --title="Please select a destination folder" --directory)"/"


# Copy files and folders to new location

    for file in "$@"; do

    # Get the basename of the file

        filename=$(basename "$file")

    # Check whether file already exists in the destination

        if [ -e "$folder/$filename" ]; then

        # Ask the user what to do

            response=$(zenity \
            --list --title="File $filename already exists in target folder" \
            --text "The file $filename already exists in the target folder. What you would like to do?" \
            --radiolist \
            --column "Select" \
            --column "action" \
            FALSE "Overwrite" \
            FALSE "Rename" \
            FALSE "Skip" \
            FALSE "Abort")
            
        # Check which action the user selected

            case "$response" in

            (Overwrite)
                cp -r "$file" "$folder"
                bleachbit --shred "$file"
                zenity --info --text="File $filename overwritten.."
                ;;
            (Rename)
                extension="${filename##*.}"
                filenamefirstpart="${filename%.*}"
                datetime=$(date +%Y%m%d%H%M%S) # This will format the date and time as YYYYMMDDHHMMSS
                newname=$(zenity --entry \
                    --title="Rename file" \
                    --text="Enter a new name for the file (including extension):" \
                    --entry-text "$filenamefirstpart-$datetime.$extension")
                cp -r "$file" "$folder/$newname"
                bleachbit --shred "$file"
                zenity --info --text="File $filename renamed to $newname."
                ;;
            (Skip)
                zenity --info --text="File $filename was skipped."
                ;;
            (Abort)
                zenity --info --text="Operation aborted."
                exit 1
                ;;
            esac

        else
            cp -r "$file" "$folder"
        fi

    done

# Press any key to continue

    # read -n 1 -s -r -p "Press any key to continue"; echo
