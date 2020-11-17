#!/bin/bash

# This runs a single test case
cd ../oracles/
cd ../scripts/
TOPLEVEL="oracles"
ONEDOWN="../oracles"
TWODOWN="../../oracles"

echo "" >> "$ONEDOWN/results.html"

if [ $# -eq 0 ]; then
    echo Enter the test case you would like to run: Format like testCase#
    read testcase
else
  # cut off the extension when running the full script
  testcase=`eval "echo $1 | cut -d'.' -f1"`
  fi

if [ "$testcase.txt" == "README.txt" ]; then
  # cat $testcase.txt
  # echo "---------------------------"
  exit
  fi

# echo "Doing $testcase..."

testfile=../testCases/$testcase.txt

TESTCASEEXECDIR=/testCasesExecutables/
TESTCASEID=`cat $testfile | head -1 | tail -1`
COMPONENT=`cat $testfile | head -2 | tail -1`
REQUIREMENT=`cat $testfile | head -3 | tail -1`
TESTDRIVER=`cat $testfile | head -4 | tail -1`
TANAGURUFILE=`cat $testfile | head -5 | tail -1`
TESTMETHOD=`eval "echo $TESTDRIVER | cut -d'.' -f1"`
ARGS=`cat $testfile | head -7 | tail -1`
ORACLE=`cat $testfile | head -8 | tail -1`
TANAGURUFILEDIR=/project/src

echo "" >> "$ONEDOWN/results.html"

# cat $testfile >> "$ONEDOWN/results.html"

echo "<b>Test Case ID:</b> "$TESTCASEID"<br>" >> "$ONEDOWN/results.html"
echo "<b>Component:</b> "$COMPONENT"<br>" >> "$ONEDOWN/results.html"
echo "<b>Requirement:</b> "$REQUIREMENT"<br>" >> "$ONEDOWN/results.html"
echo "<b>Arguments:</b> "$ARGS"<br>" >> "$ONEDOWN/results.html"


echo "" >> "$ONEDOWN/results.html"

# go to the tanaguru file
cd ../$TANAGURUFILEDIR/

#compile the file into the directory with the driver
javac -d ../../$TESTCASEEXECDIR $TANAGURUFILE

# go to the folder that has the driver
cd ../../$TESTCASEEXECDIR/

#compile the driver
javac $TESTDRIVER

# echo compiled 

#Run the testCase file
java  $TESTMETHOD $ARGS > output.txt

OUTPUT=$(cat output.txt | tail -1)

# echo "Their result: `cat output.txt`" >> "$ONEDOWN/results.html"
# echo "Expected result: $ORACLE" >> "$ONEDOWN/results.html"
echo "<b>Their result:</b> "$OUTPUT"<br>" >> "$ONEDOWN/results.html"
echo "Their result: $OUTPUT"
echo "<b>Expected result:</b> "$ORACLE >> "$ONEDOWN/results.html"
echo "Expected result: $ORACLE"

OUTPUT=$(cat output.txt | tail -1)

if [[ "$OUTPUT" == "$ORACLE" ]]; then
	echo "<h3 style=background-color:#008000;color:#FFFFFF>  The test passed.  </h3>" >> "$ONEDOWN/results.html"
  echo "passed"
else
	echo "<h3 style=background-color:#FF0000;color:#FFFFFF>  The test failed.  </h3>" >> "$ONEDOWN/results.html"
  echo "failed"
fi

echo "<br>" >> "$ONEDOWN/results.html"
# Remove the things you made to run the test
# go to testautomation directory and in every subfolder delete .class files and the output.txt file
cd ../..
rm $(find . -type f -name "*.class")
rm $(find . -type f -name "output.txt")

echo "---------------------------"
