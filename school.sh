#!/bin/bash
cat Property_Tax_Roll.csv | grep "MADISON SCHOOLS" | cut -d "," -f 7 | { awk '{s+=$1} END {printf "sum=%.0f average=%d\n", s, s/NR}';  }