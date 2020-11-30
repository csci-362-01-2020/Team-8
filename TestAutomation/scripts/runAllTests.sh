# !/bin/bash
# runAllTests.sh
# script that loops through all tests in testCases folder
# displays test results in a browser

cd oracles

# set up html to display in browser
cat >> "results.html" << EOF 
<!DOCTYPE html>
  <html>
    <head>
      <title>Results</title>
      <meta charset="utf-8">
      <meta name="viewport" content="width=device-width, initial-scale=1">
      <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
      <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
      <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
      <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    </head>
    <body>
EOF

# print title with time and date of test
DATETIME=`date`
echo "<div class=\"container pt-3\"><h3>Tanaguru Contrast-Finder Automated Testing</h3><h3>Test Results at $DATETIME</h3></div>" >> "results.html"

cd ../testCases

# loop through test cases
for file in *
do
  echo $file
  ./../scripts/runtest.sh $file
done
cd ../oracles
# print results to html file
echo "</body>" >> "results.html"
echo "</html>" >> "results.html"

# open in browser
xdg-open "results.html"
sleep 10s

# remove results file after displaying them in the browser so a failed test run does not result in an old results page
rm $(find . -type f -name "results.html")
