"""
Program to delete the emojis from all the files
"""

import emoji
import os

def deleteEmoijis(sourceDirectoryName, destinationDirectoryName, fileName): 
    sourcePath = sourceDirectoryName + os.sep + fileName
    destinationPath = destinationDirectoryName + os.sep + fileName
    
    #Open the files
    sourceFile = open(sourcePath, "r", encoding="utf-8")
    destinationFile = open(destinationPath, "w", encoding="utf8")
    
    #Replace any emoji for an ampty space in every line of the file
    for line in sourceFile:
        newLine = emoji.replace_emoji(line, replace = '')
        if newLine != '""':
            destinationFile.write(newLine)
        
    sourceFile.close()
    destinationFile.close()
    
def deleteEmojisFromFile(fileName):
    linesChanged = open("LinesChanged.txt", "w")
    cont = 1
    
    #Open the files
    sourceFile = open(fileName, "r", encoding="utf-8")
    destinationFile = open("NoEmoji" + fileName, "w", encoding="utf8")
    
    #Replace any emoji for an ampty space in every line of the file
    for line in sourceFile:
        newLine = emoji.replace_emoji(line, replace = '')
        destinationFile.write(newLine)
        
        if newLine != line:
            linesChanged.write("line: " + str(cont) + "\n")
        
        cont += 1
        
    sourceFile.close()
    destinationFile.close()
    linesChanged.close()
    
    
    

deleteEmojisFromFile("AllLabeledReviews.csv")
        

'''
stationNamesFile = open("NombreEstacionesMetroMadrid.txt", "r", encoding="utf-8")

for line in stationNamesFile:
    deleteEmoijis("2. Google Maps Reviews" , "3. Google Maps Reviews Without Emojis", line.strip() + ".csv")
        
stationNamesFile.close()
'''