import os
start_path = '.' # current directory
dirs = os.listdir(start_path) #prints everything in the directory in two lines
print(dirs)
print(os.listdir(start_path)) # prints everything in the given directory in one line

# Writing to an html file
html_file = open("myList.html", 'w')
html_str = '''
<html>
<body>
<p>'''
html_file.write(html_str)
html_str = ''
for x in dirs:
    html_str += x
    html_str += '<br>'
html_file.write(html_str)
html_str = '''
</p>
</body>
</html>
'''
html_file.write(html_str)

## Opening the html file in a browser

import webbrowser
webbrowser.open_new_tab("myList.html")

##
# for path,dirs,files in os.walk(start_path): #prints everything in the directory and all subdirectories
#     for filename in files:
#         print(os.path.join(path,filename))
#         print(os.path.join(path,filename))
