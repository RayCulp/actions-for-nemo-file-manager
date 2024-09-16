#!/bin/bash

# Set up debugging, if needed
    
    # exec 2> ./trace$$.log # Redirect errors to trace log
    # or
    # exec >& ~/Documents/resize_pdf$$.log 2>&1 # Redirect all output to trace log
    # set -x

# Check if an argument was provided

    if [ $# -eq 0 ]; then
        zenity --error --text="No argument provided. Please run the script with an argument." --title="Error"
        exit 1
    fi

# Ask user for confirmation to continue
    
	zenity  --question --title="Resize PDF(s)" --text="Do you want to resize the selected PDF(s)?"

# Check the exit status of Zenity command

    if [ $? -eq 1 ]; then
        exit 0
    fi

# Select quality

    Selectedlanguage=$(zenity --list \
        --title="Output quality" \
        --text="Select an output quality:" \
        --radiolist \
        --column="Select" --column="Quality" \
        TRUE "Screen (72 dpi)" \
        FALSE "Ebook (150 dpi)" \
        FALSE "Printer (300 dpi)" )


    case $Selectedlanguage in
        "Screen (72 dpi)")
            dPDFSETTINGS="-dPDFSETTINGS=/screen"
            new_file_extension="_screen.pdf"
            ;;
        "Ebook (150 dpi)")
            dPDFSETTINGS="-dPDFSETTINGS=/ebook"
            new_file_extension="_ebook.pdf"
            ;;
        "Printer (300 dpi)")
            dPDFSETTINGS="-dPDFSETTINGS=/printer"
            new_file_extension="_printer.pdf"
            ;;
        *)
            echo "Invalid value for MyString. Please use 'String1' or 'String2'."
            exit 1
            ;;
    esac

# Propt the user to confirm overwrite
    
	zenity  --question --title="Overwrite original?" --text="Overwrite original PDF(s)?"

# Check the exit status of Zenity command

    if [ $? -eq 0 ]; then
        overwrite=true
    fi

# Loop through the list of files provided in the argument, OCR using ocrmypdf

    for full_file_path in "$@"; do

        file_basename=$(basename -- "$full_file_path")

        # extension="${filename##*.}"

        filename_without_extension="${file_basename%.*}"

        file_path=$(dirname -- "$full_file_path")

        gs "-sDEVICE=pdfwrite" "-dCompatibilityLevel=1.4" "$dPDFSETTINGS" "-dNOPAUSE" "-dBATCH" "-sOutputFile=$file_path/$filename_without_extension$new_file_extension" "$full_file_path"

        if [ "$overwrite" = true ]; then
            rm "$full_file_path"
            mv "$file_path/$filename_without_extension$new_file_extension" "$full_file_path"
        fi

    done


# Press any key to continue

    read -n 1 -s -r -p "Press any key to continue"; echo
