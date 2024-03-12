#!/bin/bash

# Directory containing the zip files
zip_dir="data"

# Check if the directory exists
if [ ! -d "$zip_dir" ]; then
    echo "Directory '$zip_dir' does not exist."
    exit 1
fi

# Iterate over all zip files in the directory
for zip_file in "$zip_dir"/*.zip; do
    if [ -f "$zip_file" ]; then
        # Unzip the file
        unzip -q "$zip_file" -d "${zip_file%.zip}"
        rm  "${zip_file%.zip}"/*.imgbu
    fi 
    
done

echo "All zip files in '$zip_dir' have been unzipped."
