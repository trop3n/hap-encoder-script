#!/bin/bash

#configure input/output folders
input_dir="./input"
output_dir="./output_hap"

mkdir -p "$output_dir"

for file in "$input_dir"/.mov; do
  if [ -f "$file" ]; then
    filename=$(basename "$file")
    echo "Processing $filename"
    ffmpeg - "$file" -vcodec hap -format hap_q -y "$output_dir/${filename%.mov}_HAP.mov"
    echo "Finished encoding ${filename%.mov}"
  fi
done

echo "All files encoded to HAP."