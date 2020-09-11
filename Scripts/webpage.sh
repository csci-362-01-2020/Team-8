#!/bin/bash

# This is the javascript for the webpage

x=`ls --format=comma` #this puts the directories in a varible

cat << _EOF_

<!doctype html>
<html>

<head>
	<title> Tanaguru Contrast Finder top-level directory by Team Gr8 </title>

</head>

<body>
	The following are the directories in the Tanaguru Contrast Finder directory:
<br>
<br> <var> $x </var>
<br>
<br> This will also have the scripts we are running displayed as well

</body>
</html>

_EOF_

