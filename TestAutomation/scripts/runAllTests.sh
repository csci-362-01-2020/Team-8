cd oracles
echo "" > "results.html"
DATETIME=`date`
echo "<h1 style=background-color:#000000;color:#FFFFFF>Test Results at $DATETIME</h1><br>" >> "results.html"
cat >> "results.html" << EOF 
<!DOCTYPE html>
<html>
<head>
<title>Results</title>
</head>
<body>
EOF

cd ../testCases

for file in *
do
  echo $file
  ./../scripts/runtest.sh $file
done
cd ../oracles
echo "</body>" >> "results.html"
echo "</html>" >> "results.html"
xdg-open "results.html"
