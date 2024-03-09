#!/bin/bash

if [ $# -lt 1 ]; then
    echo "Usage: $0 <column_number> [csv_file]" >&2
    exit 1
fi

column_number=$1
csv_file=${2:-/dev/stdin}

if [ $# -eq 2 ] && [ ! -f "$csv_file" ]; then
    echo "Error: File does not exist." >&2
    exit 1
fi

awk -v col="$column_number" -F',' 'NR>1 {sum+=$col; count++} END {print sum/count}' "$csv_file"


