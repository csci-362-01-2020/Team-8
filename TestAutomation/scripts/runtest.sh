#!/bin/bash

# This runs test cases 1

TESTCASEEXECDIR=/TestCasesExecutables/

echo Enter the test case you would like to run: Format like testCase#

read file

echo "Doing $file..."

input=../testCases/$file.txt

# This reads and echos each line of the file
while IFS= read line
do
    echo "$line"
done < "$input"

echo " "

cd ../$TESTCASEEXECDIR/$file

# x=`pwd`
#
# echo "$x"
#
# x=`ls`
#
# echo "$x"

javac DistanceCalculator.java
javac $file.java

# These are the arguments for testCase1 - need to figure out how to parse from the text file to find arguments
java $file 000 000 000 255 255 255