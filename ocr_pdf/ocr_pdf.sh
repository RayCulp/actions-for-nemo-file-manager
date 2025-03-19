#!/bin/bash

# Set up debugging, if needed
    
    # exec 2> ./trace$$.log # Redirect errors to trace log
    # or
    # exec >& ~/Documents/ocr_pdf$$.log 2>&1 # Redirect all output to trace log
    # set -x

# This script will only work if a list of files is passed to it as an argument. 
# Check if an argument was passed to the script. If not, bail out.

    if [ $# -eq 0 ]; then
        zenity --error --text="No argument provided. Please run this script with an argument." --title="Error"
        exit 1
    fi

# Prompt user to select OCR options

    SELECTED_OPTIONS=$(zenity --list \
        --title="Select OCR options" \
        --text="Select the following options:" \
        --checklist \
        --column="Select" \
        --column="Option" \
        TRUE "Force OCR (even if PDF already contains text)" \
        TRUE "Overwrite original file(s)" \
        --height=200 \
        --width=350)

# Check the exit status of Zenity (0 for OK, 1 for Cancel)

    if [ $? -eq 0 ]; then
        # Convert the pipe-separated output into an array
        IFS="|" read -r -a OPTIONS_ARRAY <<< "$SELECTED_OPTIONS"

        # Flags to track which options were selected
        OPTION1_SELECTED=false
        OPTION2_SELECTED=false

        # Check each selected option
        for option in "${OPTIONS_ARRAY[@]}"; do
            if [ "$option" = "Force OCR (even if PDF already contains text)" ]; then
                OPTION1_SELECTED=true
            elif [ "$option" = "Overwrite original file(s)" ]; then
                OPTION2_SELECTED=true
            fi
        done

        # Check which options were selected

            if [ "$OPTION1_SELECTED" = true ]; then
                force_ocr="--force-ocr"
            fi

            if [ "$OPTION2_SELECTED" = true ]; then
                new_file_extension=".pdf"
            else
                new_file_extension="-ocr.pdf"
            fi

    else
        exit 0
    fi

# Get the list of installed Tesseract languages into the LANGUAGES array.

    readarray -t LANGUAGES < <(tesseract --list-langs | sed '1d' | sed '/osd/d')

# Build the Zenity radiolist arguments

    ZENITY_ARGS=()
    FIRST=true
    for lang in "${LANGUAGES[@]}"; do
        # The first item will be pre-selected (TRUE), others FALSE
        if [ "$FIRST" = true ]; then
            ZENITY_ARGS+=("TRUE" "$lang")
            FIRST=false
        else
            ZENITY_ARGS+=("FALSE" "$lang")
        fi
    done

# Select langauge

    Selectedlanguage=$(zenity --list \
        --title="Select OCR language" \
        --text="Select one of the following languages:" \
        --radiolist \
        --column="Select" \
        --column="Language" \
        "${ZENITY_ARGS[@]}" \
        --height=200 \
        --width=200)

# Check if the user cancelled the dialog

    if [ $? -eq 1 ]; then
        exit 0
    fi

# Loop through the list of files provided in the argument, OCR using ocrmypdf

    for full_file_path in "$@"; do

        file_basename=$(basename -- "$full_file_path")

        # extension="${filename##*.}"

        filename_without_extension="${file_basename%.*}"

        file_path=$(dirname -- "$full_file_path")

        ocrmypdf "$full_file_path" "$file_path/$filename_without_extension$new_file_extension" $force_ocr --language $Selectedlanguage

    done


# Press any key to continue

    read -n 1 -s -r -p "Press any key to continue"; echo
