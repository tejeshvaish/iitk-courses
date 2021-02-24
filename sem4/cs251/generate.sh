#!/bin/bash
# it takes number of test cases and Standard deviation as an argurement
# as our program usually revolves around the small value so we can choose any type of 
cd test/
echo ""> T.txt;
n="$1";  #integer n
# str=($(cat "$2"));  // inputted program 

python3 test_cases.py $n

# cat $1 | grep "short" 
