cd oracles
echo "" > "results.html"
cat >> "results.html" << EOF 
<!DOCTYPE html> > "results.html"
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
