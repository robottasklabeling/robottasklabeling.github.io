#!/bin/bash

# Function to convert GIFs to loop GIFs
convert_to_gif() {
    local file="$1"
    local temp_output="${file%.*}_temp_loop.gif"  # Use a temporary file for conversion
    convert "$file" -loop 0 "$temp_output" && mv "$temp_output" "$file"  # Overwrite original file after conversion
    echo "Converted and overwritten $file"
}

# Function to process files in a directory recursively
process_files() {
    local dir="$1"
    local file
    for file in "$dir"/*; do
        if [[ -d "$file" ]]; then
            process_files "$file"
        elif [[ -f "$file" && "${file##*.}" = "gif" ]]; then  # Check if the file is a GIF
            convert_to_gif "$file"
        fi
    done
}

# Main script
if [[ $# -eq 0 ]]; then
    echo "Please provide a directory path as an argument."
    exit 1
fi

directory="$1"
if [[ ! -d "$directory" ]]; then
    echo "Invalid directory path: $directory"
    exit 1
fi

process_files "$directory"