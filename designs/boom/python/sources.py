
import os
path = "/home/alfonso/librelane/designs/boom/src"

count = 0
with open('sources.txt', 'w') as file:
    sources = os.listdir(path)
    for s in sources:
        file.write("- dir::src/" + s + "\n")
        count+=1
print("source files: ", count)