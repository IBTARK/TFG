import os

def extractReviews(sourceDirectoryName, destinationDirectoryName, fileName):
    
    sourcePath = sourceDirectoryName + os.sep + fileName
    destinationPath = destinationDirectoryName + os.sep + fileName
    
    #Open the files
    file = open(sourcePath, "r", encoding="utf-8")
    reviewFile = open(destinationPath, "w", encoding="utf8")
    
    first = True
    
    for line in file:
        
        #Ignore the first line
        if not first:
            #Split the line when a , is found
            textList = line.split(',')
            
            #Ibons files
            if fileName <= "Ciudad del Cine":
                
                #The first four elements are information that is not desired, the rest is the review
                review = ",".join(textList[3:])
            
            #Frans files
            elif fileName >= "Ciudad Lineal" and fileName <= "La Latina":
                #The first three elements are information that is not desired, the rest is the review
                review = ",".join(textList[4:])
            
            #Danis files
            elif fileName >= "La Moraleja" and fileName <= "Prado del Espino":
                #The first three elements are information that is not desired, the rest is the review
                review = ",".join(textList[3:])
            
            #Chemas files
            else:
                #The first three elements are information that is not desired, the rest is the review
                review = ",".join(textList[3:])
                
                
            
            #The review is not empty
            if review != '""\n' and review != '""' and review != '\n':
                #Write the review to the corresponding file
                reviewFile.write(review)
        else:
            first = False
    
    file.close()
    reviewFile.close()
    
    



stationNamesFile = open("Estaciones.txt", "r", encoding="utf-8")

for line in stationNamesFile:
    extractReviews("Google Maps Original" , "Google Maps Reviews", line.strip() + ".csv")
        
stationNamesFile.close()