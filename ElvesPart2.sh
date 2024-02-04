#!/usr/bin/bash

# Using only every nth line from input file, starting with the nth line
nth_lines=3

if [ -z "$1" ]; then
    echo "Usage: ./ElvesPart2.sh <input file>"
    exit -1
fi

in_file=$1
line_num=1 # line numbering starts at 1
sum=0
while IFS='' read -r line
do
    if [ $((line_num%nth_lines)) -ne 0 ]; then
        let line_num++
        continue
    fi

    # It would be more computationally efficient to simply loop through the characters
    # in the line once to find first and last occurence of a number. Future optimization
    first_digit=$(echo $line | sed 's/^[^0-9]*//' | cut -b 1)
    last_digit=$(echo $line | rev | sed 's/^[^0-9]*//' | cut -b 1)

    combined_number="${first_digit}${last_digit}"
    sum=$((sum+combined_number))
    let line_num++
done < $in_file

echo "The calibration values sum to $sum"
