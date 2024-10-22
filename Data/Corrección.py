"""
Program to label 20% of the reviews
"""

import os
import random


def joinReviews(sourceDirectoryName, fileName):
    
    sourcePath = sourceDirectoryName + os.sep + fileName
    destinationFile = "Pío XII.csv"
    
    #Open the files
    file = open(sourcePath, "r", encoding="utf-8")
    destination = open(destinationFile, "a", encoding="utf-8")
    
    for line in file:
        if line != "" and line != "\n":
            #Split the line when a , is found
            textList = line.split(',')
            
            if(",".join(textList[1:]) != '""' and ",".join(textList[1:]) != '""\n'):
                destination.write(",".join(textList[1:]))
                
    
    file.close()
    destination.close()
    
joinReviews("Google Maps Reviews", "Pío XII.csv")