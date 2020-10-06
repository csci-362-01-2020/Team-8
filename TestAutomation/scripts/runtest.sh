#!/bin/bash

# This runs a single test case

if [ $# -eq 0 ]; then
    echo Enter the test case you would like to run: Format like testCase#
    read testcase
else
  # cut off the extension when running the full script
  testcase=`eval "echo $1 | cut -d'.' -f1"`
  fi

if [ "$testcase.txt" == "README.txt" ]; then
  cat $testcase.txt
  echo "---------------------------"
  exit
  fi

echo "Doing $testcase..."

testfile=../testCases/$testcase.txt

TESTCASEEXECDIR=/TestCasesExecutables/
TESTDIR=`cat $testfile | head -4 | tail -1`
TESTMETHOD=`cat $testfile | head -5 | tail -1`
ARGS=`cat $testfile | head -7 | tail -1`

echo ""

cat $testfile

echo ""

# This reads and echos each line of the file
#while IFS= read line
#do
#    echo "$line"
#done < "$input"

cd ../$TESTCASEEXECDIR/$TESTDIR

#Compile all the java files in the noted executables directory
find . -name "*.java" > sources.txt
javac @sources.txt
# echo compiled

#Run the testCase file
java $TESTMETHOD $ARGS

# Remove the things you made to run the test
rm sources.txt
rm $(find . -type f -name "*.class")

echo "---------------------------"