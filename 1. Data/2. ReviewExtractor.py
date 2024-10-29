"""
Program to extract the non empty reviews from each csv file corresponding to each subway station
"""

import os


def extractReviews(sourceDirectoryName, destinationDirectoryName, fileName):
    
    #name of the file without the .csv
    name = fileName[:-4]
    
    sourcePath = sourceDirectoryName + os.sep + fileName
    destinationPath = destinationDirectoryName + os.sep + fileName
    
    #Open the files
    file = open(sourcePath, "r", encoding="utf-8")
    reviewFile = open(destinationPath, "w", encoding="utf8")
    
    next(file)
    
    for line in file:
        #Split the line when a , is found
        textList = line.split(',')
        
        #Ibons files
        if name <= "Ciudad del Cine" or name == "Cocheras":

            #The first four elements are information that is not desired, the rest is the review
            review = ",".join(textList[3:])
        
        #Frans files
        elif name >= "Ciudad Lineal" and name <= "La Latina":
            #The first three elements are information that is not desired, the rest is the review
            review = ",".join(textList[4:])
        
        #Danis files
        elif name >= "La Moraleja" and name <= "Prado del Espino":
            #The first four elements are information that is not desired, the rest is the review
            review = ",".join(textList[4:])
        
        #Chemas files
        else:
            #The first three elements are information that is not desired, the rest is the review
            review = ",".join(textList[3:])
            
            
        
        #The review is not empty
        if review != '""\n' and review != '""' and review != '\n':
            #Write the review to the corresponding file
            reviewFile.write(review)

    
    
    file.close()
    reviewFile.close()
    
    



stationNamesFile = open("NombreEstacionesMetroMadrid.txt", "r", encoding="utf-8")

for line in stationNamesFile:
    extractReviews("Google Maps Original" , "Google Maps Reviews2", line.strip() + ".csv")
        
stationNamesFile.close()