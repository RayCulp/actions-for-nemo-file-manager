#!/bin/bash

# Set up debugging, if needed
    
    # exec 2> ./trace$$.log # Redirect errors to trace log
    # or
    # exec >& ~/Documents/ocr_image$$.log 2>&1 # Redirect all output to trace log
    # set -x

# Check if an argument was provided

    if [ $# -eq 0 ]; then
        zenity --error --text="No argument provided. Please run the script with an argument." --title="Error"
        exit 1
    fi

# Ask user for confirmation to continue
    
	zenity  --question --title="OCR images" --text="Do you want to OCR this/these images?"

# Check the exit status of Zenity command

    if [ $? -eq 1 ]; then
        exit 0
    fi

# Select langauge

    Selectedlanguage=$(zenity --list \
        --title="OCR language" \
        --text="Select one of the following languages:" \
        --radiolist \
        --column="Select" --column="Language" \
        TRUE "English" \
        FALSE "German")

    #if  then
        # Display the selected option
        #echo "You selected: $MyVariable"
    #else
        #echo "No option was selected."
    #fi

    case $Selectedlanguage in
        "English")
            ocr_language="-l eng"
            ;;
        "German")
            ocr_language="-l deu"
            ;;
        *)
            echo "Invalid value for MyString. Please use 'String1' or 'String2'."
            exit 1
            ;;
    esac

# Check if the user selected an option or cancelled the dialog

    #if [ $? -eq 0 ]; then
        # Display the selected option
        #echo "You selected: $MyVariable"
    #else
        #echo "No option was selected."
    #fi

# Set new file extensino

    $new_file_extension=".txt"

# Loop through the list of files provided in the argument, OCR using tesseract

    for full_file_path in "$@"; do

        file_basename=$(basename -- "$full_file_path")

        # extension="${filename##*.}"

        filename_without_extension="${file_basename%.*}"

        file_path=$(dirname -- "$full_file_path")

        tesseract "$full_file_path" "$file_path/$filename_without_extension$new_file_extension" $ocr_language

    done


# Press any key to continue

    read -n 1 -s -r -p "Press any key to continue"; echo