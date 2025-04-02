#!/bin/bash

# Prompt the user for the text input
echo "Enter the text you want to generate:"
read user_text

# Prompt the user for the output folder path
echo "Enter the output folder path:"
read output_folder

# Create the folder if it doesn't exist
if [ ! -d "$output_folder" ]; then
    echo "Folder does not exist, creating it..."
    mkdir -p "$output_folder"
fi

# Define the output file path
output_file="$output_folder/output.mp3"

# Send POST request to the API using curl
curl -X POST http://127.0.0.1:5000/synthesize \
     -H "Content-Type: application/json" \
     -d "{\"text\": \"$user_text\", \"folder\": \"$output_folder\"}" \
     --output "$output_file"

# Check if the file was created successfully
if [ -f "$output_file" ]; then
    echo "Audio file generated at: $output_file"
    # Open the generated MP3 file (using xdg-open for Linux)
    xdg-open "$output_file"
else
    echo "Error: The audio file was not created."
fi

