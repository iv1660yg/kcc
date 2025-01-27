#!/bin/bash

# Define the ingest and output directories
INGEST_DIR="/ingest"
OUTPUT_DIR="/output"

# Check if there are any files in the ingest directory
if [ "$(ls -A $INGEST_DIR)" ]; then
    echo "Files found in the ingest directory. Starting conversion..."

    # Loop through each file in the ingest directory
    for file in "$INGEST_DIR"/*; do
        # Run the KCC script for each file
        python kcc-c2e.py -p KV -m -q -2 -w --ts 100 --output "$OUTPUT_DIR" "$file"
    done

    echo "Conversion completed."
else
    echo "No files found in the ingest directory."
fi
