"""
Program to label 20% of the reviews
"""

import os
import random


def joinReviews(sourceDirectoryName, fileName, destinationFile):
    
    sourcePath = sourceDirectoryName + os.sep + fileName
    
    #Open the files
    file = open(sourcePath, "r", encoding="utf-8")
    destination = open(destinationFile, "a", encoding="utf-8")
    
    for line in file:
        if line != "" and line != "\n":
            if random.random() <= 0.2:
                print("Estación: " +  fileName + "\n")
                print("Reseña: \n" + line + "\n")
                
                label = input()
                
                #Add line to the csv
                destinationLine = fileName.strip() + "," + line.strip() + "," + label.strip() + "\n"
                destination.write(destinationLine)
                
    
    file.close()
    destination.close()
    
stationNamesFile = open("NombreEstacionesMetroMadridIbon.txt", "r", encoding="utf-8")

for line in stationNamesFile:
    joinReviews("Google Maps Reviews", line.strip() + ".csv", "LabeledReviews.csv")
 