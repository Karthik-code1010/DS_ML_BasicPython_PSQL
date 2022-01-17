#text file, binary file(image, audio)
# open, read/write, close
try:
    f = open("d:\\fileowrite.txt","rt") #w is write
    print(type(f))
    print("file is opened")

#s = input("Give first line")
#f.write(s+"\n")

#s = input("Give Second line")
#f.write(s+"\n")

#l = f.readline()
#print(l)
#l = f.readline()
#print(l)
    for l in f:
     print(l)
    f.close()
except:
    print("some issue in opening the file")
finally:
    print("File is Done")
print("program ended")
