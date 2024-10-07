"""
Program to check if any of the downloaded data from Google Maps has any error (not a csv format)
"""

import os

def checkErrorOnFile(fileName, errorFileName):
    
    #Open the files
    file = open(fileName, "r", encoding="utf-8")
    errorFile = open(errorFileName, "a")
    
    #Write into the error file
    errorFile.write(fileName + '\n')
    
    lineCount = 0
    errorFound = False
    
    #Read a file line by line
    for line in file:
        
        #Split the line when a , is found
        textList = line.split(',')
        
        #Check if the first element is correct
        if textList[0][0] != '"' and textList[0][0:6] != 'https:' and textList[0][0:3] != "URL":
            errorFile.write("\tError on line: " + str(lineCount + 1) + '\n')
            errorFound = True
        
        lineCount += 1
        
    if not errorFound:
        errorFile.write("\tCorrect\n")
        
    file.close()
    errorFile.close()
    
stationNamesFile = open("NombreEstacionesMetroMadrid.txt", "r", encoding="utf-8")

for line in stationNamesFile:
    checkErrorOnFile("Google Maps Original" +  os.sep + line.strip() + ".csv", "Errores.txt")
        
stationNamesFile.close()
        