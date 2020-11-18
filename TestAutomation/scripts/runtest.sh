#!/bin/bash
# This runs a single test case

cd ../oracles/
cd ../scripts/
TOPLEVEL="oracles"
ONEDOWN="../oracles"
TWODOWN="../../oracles"

if [ $# -eq 0 ]; then
    echo Enter the test case you would like to run: Format like testCase#
    read testcase
else
  # cut off the extension when running the full script
  testcase=`eval "echo $1 | cut -d'.' -f1"`
  fi

if [ "$testcase.txt" == "README.txt" ]; then
  exit
  fi

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

# cat $testfile >> "$ONEDOWN/results.html"

echo "<div class=container>" >> "$ONEDOWN/results.html"

# go to the tanaguru file
cd ../$TANAGURUFILEDIR/

#compile the file into the directory with the driver
javac -d ../../$TESTCASEEXECDIR $TANAGURUFILE

# go to the folder that has the driver
cd ../../$TESTCASEEXECDIR/

#compile the driver
javac $TESTDRIVER

#Run the testCase file
java  $TESTMETHOD $ARGS > output.txt

OUTPUT=$(cat output.txt | tail -1)

cat >> $ONEDOWN/results.html << EOL
<table class="table table-bordered table-sm">
  <tbody>
    <thead class="thead-light">
      <tr>
        <th style="width: 20%"> Test Case ID </td>
        <th style="width: 80%">$TESTCASEID</td>
      </tr>
    </thead>
    <tr>
      <td> Component </td>
      <td>$COMPONENT</td>
    </tr>
    <tr>
      <td> Requirement </td>
      <td>$REQUIREMENT</td>
    </tr>
    <tr>
      <td> Arguments </td>
      <td>$ARGS</td>
    </tr>
    <tr>
      <td> Their result </td>
      <td>$OUTPUT</td>
    </tr>
    <tr>
      <td> Expected result </td>
      <td>$ORACLE</td>
    </tr>
EOL

OUTPUT=$(cat output.txt | tail -1)

echo "<tr>" >> "$ONEDOWN/results.html"
echo "<td> Status </td>" >> "$ONEDOWN/results.html"

if [[ "$OUTPUT" == "$ORACLE" ]]; then
	echo "<td class=table-success>  The test passed.  </td>" >> "$ONEDOWN/results.html"
  echo "passed"
else
	echo "<td class=table-danger>  The test failed.  </td>" >> "$ONEDOWN/results.html"
  echo "failed"
fi

echo "</tr>" >> "$ONEDOWN/results.html"


echo "</tbody>" >> "$ONEDOWN/results.html"
echo "</table>" >> "$ONEDOWN/results.html"


echo "</div>" >> "$ONEDOWN/results.html"

# Remove the things you made to run the test
# Go to testautomation directory and in every subfolder delete .class files and the output.txt file
cd ../..
rm $(find . -type f -name "*.class")
rm $(find . -type f -name "output.txt")

echo "---------------------------"
