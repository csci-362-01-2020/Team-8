cd ../testCases

for file in *
do
  echo $file
  ./../scripts/runtest.sh $file
done