
import os
design = "test"
src_dir = "fpu"
path = "/home/alfonso/librelane/designs/" + design + "/" + src_dir

count = 0
with open('sources.txt', 'w') as file:
    sources = os.listdir(path)
    for s in sources:
        if s[-2:] == ".v" or s[-3:] == ".sv":
            file.write("- dir::" + src_dir + "/" + s + "\n")
            count+=1
print("source files: ", count)