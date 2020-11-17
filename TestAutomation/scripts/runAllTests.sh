cd oracles
echo "" > "results.html"

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

DATETIME=`date`
echo "<div class=\"container pt-3\"><h3>Test Results at $DATETIME</h3></div>" >> "results.html"

cd ../testCases

for file in *
do
  echo $file
  ./../scripts/runtest.sh $file
done
cd ../oracles
echo "</body>" >> "results.html"
echo "</html>" >> "results.html"
open "results.html"
