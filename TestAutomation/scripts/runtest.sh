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
# echo "<b>Test Case ID:</b> "$TESTCASEID"<br>" >> "$ONEDOWN/results.html"
# echo "<b>Component:</b> "$COMPONENT"<br>" >> "$ONEDOWN/results.html"
# echo "<b>Requirement:</b> "$REQUIREMENT"<br>" >> "$ONEDOWN/results.html"
# echo "<b>Arguments:</b> "$ARGS"<br>" >> "$ONEDOWN/results.html"


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
# echo "<b>Their result:</b> "$OUTPUT"<br>" >> "$ONEDOWN/results.html"
# echo "Their result: $OUTPUT"
# echo "<b>Expected result:</b> "$ORACLE >> "$ONEDOWN/results.html"
# echo "Expected result: $ORACLE"

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

# echo "<table class="table table-bordered">"
#   echo "<tbody>"
#     echo "<tr>"
#       echo "<td> Test Case ID </td>"
#       echo "$TESTCASEID"
#     echo "</tr>"
#     echo "<tr>"
#       echo "<td> Component </td>"
#       echo "$COMPONENT"
#     echo "</tr>"

#     echo "<tr>"
#     echo "<td> Requirement </td>"
#     echo "$REQUIREMENT"
#     echo "</tr>"

#     echo "<tr>"
#     echo "<td> Arguments </td>"
#     echo "$ARGS"

#     echo "</tr>"

#     echo "<tr>"
#     echo "<td> Their result </td>"
#     echo "$OUTPUT"
#     echo "</tr>"

#     echo "<tr>"
#     echo "<td> Expected result </td>"
#     echo "$ORACLE"
#     echo "</tr>"

#   echo "</tbody>"
# echo "</table>"



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

#echo "<br>" >> "$ONEDOWN/results.html"

# Remove the things you made to run the test
# go to testautomation directory and in every subfolder delete .class files and the output.txt file
cd ../..
rm $(find . -type f -name "*.class")
rm $(find . -type f -name "output.txt")

echo "---------------------------"
