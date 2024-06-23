#!/bin/bash

input_folder=$1


# Directory containing the folders with frames
frames_dir="$input_folder"

# Loop through each folder in the frames directory
for folder in "$frames_dir"/*; do
    if [[ -d "$folder" ]]; then
        # Get the folder name
        folder_name=$(basename "$folder")

        # Create the output video file path
        output_video="$folder/masks.mp4"

        echo "Converting frames in $folder to $output_video"

        # Convert frames to video using ffmpeg
                ffmpeg -framerate 8 -i "$folder/annotated_frames/deva_annotations/Annotations/%d.png" -c:v libx264 -preset slow -crf 18 -c:a aac -vf format=yuv420p -movflags +faststart "$output_video"

        echo "Converted frames in $folder to $output_video"
    fi
done