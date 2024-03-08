#!/bin/bash
sum=0

for ((i=1000; i<=2000; i++)); do
    if [[ $(echo $i | grep -E '^[01]+$') ]]; then
        sum=$((sum + i))
    fi
done

echo "The sum is: $sum"