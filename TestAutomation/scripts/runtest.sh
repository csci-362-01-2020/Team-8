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

TESTCASEEXECDIR=/testCasesExecutables/
TESTDRIVER=`cat $testfile | head -4 | tail -1`
TANAGURUFILE=`cat $testfile | head -5 | tail -1`
TESTMETHOD=`eval "echo $TESTDRIVER | cut -d'.' -f1"`
ARGS=`cat $testfile | head -7 | tail -1`
ORACLE=`cat $testfile | head -8 | tail -1`
TANAGURUFILEDIR=/project/src

echo ""

cat $testfile

echo ""

# go to the tanaguru file
cd ../$TANAGURUFILEDIR/

#compile the file into the directory with the driver
javac -d ../../$TESTCASEEXECDIR $TANAGURUFILE

# go to the folder that has the driver
cd ../../$TESTCASEEXECDIR/

#compile the driver
javac $TESTDRIVER

echo compiled 

#Run the testCase file
java  $TESTMETHOD $ARGS > output.txt

echo "Their result: `cat output.txt`"
echo "Expected result: $ORACLE"

OUTPUT=$(cat output.txt | tail -1)

if [[ "$OUTPUT" == "$ORACLE" ]]; then
	echo "The test passed."
else
	echo "The test failed."
fi


# Remove the things you made to run the test
# go to testautomation directory and in every subfolder delete .class files and the output.txt file
cd ../..
rm $(find . -type f -name "*.class")
rm $(find . -type f -name "output.txt")

echo "---------------------------"
