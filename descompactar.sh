#!/bin/bash

# Directory containing the zip files
zip_dir="data/zip"
save_dir="data/arquivo"
# Check if the directory exists
if [ ! -d "$zip_dir" ]; then
    echo "Directory '$zip_dir' does not exist."
    exit 1
fi

# Iterate over all zip files in the directory
for zip_file in "$zip_dir"/*.zip; do
    if [ -f "$zip_file" ]; then
        
        salvar_em=$save_dir/$(basename "${zip_file%.zip}")
        mkdir -p $salvar_em
        unzip $zip_file -d ${salvar_em}
        rm  ${salvar_em}/*.imgbu
        rm  ${salvar_em}/*.vscmr
        rm  ${salvar_em}/*.bu
        rm  ${salvar_em}/*.rdv
        find ${salvar_em}/ -type f ! -name 'o00406-18236001601*' -delete

    fi
done
