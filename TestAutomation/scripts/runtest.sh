#!/bin/bash

# This runs a single test case

TESTCASEEXECDIR=/TestCasesExecutables/

#echo Enter the test case you would like to run: Format like testCase#
#
#read file

#read file

if [ $# -eq 0 ]; then
    echo Enter the test case you would like to run: Format like testCase#
    read testcase
else
  # cut off the extension when running the full script
  testcase=`eval "echo $1 | cut -d'.' -f1"`
  fi

echo "Doing $testcase..."

input=../testCases/$testcase.txt

echo ""

cat $input

echo ""

# This reads and echos each line of the file
#while IFS= read line
#do
#    echo "$line"
#done < "$input"

#Save the arguments to a variable
LINE5=`cat $input | head -5 | tail -1`
ARGS=`eval "echo ${LINE5:10}"`
#echo $ARGS

cd ../$TESTCASEEXECDIR/$testcase

#Compile all the java files in the noted executables directory
find . -name "*.java" > sources.txt
javac @sources.txt
# echo compiled

#Run the testCase file
java $testcase $ARGS

# Remove the things you made to run the test
rm sources.txt
rm $(find . -type f -name "*.class")

echo "---------------------------"