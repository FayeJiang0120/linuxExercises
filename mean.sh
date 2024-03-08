#!/bin/bash

# Check if the correct number of arguments was passed
if [ $# -lt 1 ] || [ $# -gt 2 ]; then
    echo "usage: ./mean.sh <column> [file.csv]" >&2
    exit 1
fi

column=$1
file=${2:-/dev/stdin}


{ sum=0; line_count=0; }
while read line
do
    line=$(echo $line | cut -d "," -f $column )
    if [ $line_count -gt 0 ]
    then
        sum=$((sum + line))
    fi
    ((line_count++))
done < $file
((line_count--))

echo $((sum/line_count))