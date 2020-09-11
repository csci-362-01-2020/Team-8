import os
start_path = '.' # current directory
print(os.listdir(start_path)) # prints everything in the given directory

##
# for path,dirs,files in os.walk(start_path): #prints everything in the directory and all subdirectories
#     for filename in files:
#         print(os.path.join(path,filename))