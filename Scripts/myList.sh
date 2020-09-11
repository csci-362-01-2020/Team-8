#!/bin/bash
# This will create, build, and open the webpage with the directory

`./webpage.sh > webpage.html`
echo Enter a brower you have then press enter:

read browser

`$browser webpage.html`

echo done

