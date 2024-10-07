"""
Program to join the non empty review on a single file
"""

import os


def joinReviews(sourceDirectoryName, fileName, destinationFile):
    
    sourcePath = sourceDirectoryName + os.sep + fileName
    
    #Open the files
    file = open(sourcePath, "r", encoding="utf-8")
    destination = open(destinationFile, "a", encoding="utf-8")
    
    cont = 0
    
    for line in file:
        if line != "" and line != "\n":
            destination.write(line)
            cont += 1
    
    file.close()
    destination.close()
    
    return cont


count = 0

stationNamesFile = open("NombreEstacionesMetroMadrid.txt", "r", encoding="utf-8")

for line in stationNamesFile:
    count += joinReviews("Google Maps Reviews", line.strip() + ".csv", "AllReviews.txt")
 

print("There are " + str(count) + " reviews in total\n");        
stationNamesFile.close()