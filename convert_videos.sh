#!/bin/bash

# Function to convert video to H.264 AAC
convert_video() {
    input_file="$1"
    output_file="${input_file%.*}_conv.mp4"
    
    yes | ffmpeg -i "$input_file" -c:v libx264 -preset slow -crf 18 -c:a aac -vf format=yuv420p -movflags +faststart "$output_file"
    
    echo "Converted $input_file to $output_file"
}

# Find all video files recursively
find_videos() {
    directory="$1"
    
    echo "Finding videos in $directory"

    video_files=$(find "$directory" -type f -name "annotated.mp4" -o -name "depth.mp4" -o -name "robot.mp4")

    echo "Found videos: $video_files"

    for file in $video_files; do
        echo "Processing $file"

        convert_video "$file"
    done 
}

# Main script
main() {
    root_directory="/home/nils/robottasklabeling.github.io"
    
    find_videos "$root_directory"
}

main
