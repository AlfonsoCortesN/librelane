
import os
version = 'b'
path = "/home/alfonso/librelane/designs/rocket/src_" + version

count = 0
with open('sources_' + version + '.txt', 'w') as file:
    sources = os.listdir(path)
    for s in sources:
        if s[-2:] == ".v" or s[-3:] == ".sv":
            file.write("- dir::src_" + version + "/" + s + "\n")
            count+=1
print("source files: ", count)