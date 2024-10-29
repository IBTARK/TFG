"""
Program to generate to files: one with the valid reviews and another with the non valid reviews

The input file is a csv in which each line has three elements: original csv file, review, label
"""

def separteReviews(inputFilePath, destinationFileValid, destinationFileInvalid):
    #Open the file
    sourceFile = open(inputFilePath, "r", encoding="utf-8")
    validFile = open(destinationFileValid, "w", encoding="utf-8")
    invalidFile = open(destinationFileInvalid, "w", encoding="utf-8")
    
    #Ignore the first line of the csv
    next(sourceFile)
    
    
    #Process the rest of the lines of the csv
    for line in sourceFile:
        
        #Split the line when a , is found
        textList = line.split(',')
        
        #Remove the first element (original csv file)
        textList.pop(0)
        #Remove the las element (label)
        label = textList.pop(len(textList) - 1)
        
        #Write each review into its corresponding file
        if label.strip() == 'v':
            validFile.write(",".join(textList) + "\n")
        elif label.strip() == 'n':
            invalidFile.write(",".join(textList) + "\n")
        else:
            print("Error in line: label: " + label + "review" + ",".join(textList) + "\n")
        
    
    sourceFile.close()
    validFile.close()
    invalidFile.close()


'''Separate the reviews'''
separteReviews("4. Labeled Reviews\\2. Without Emojis\\AllLabeledReviews.csv", "4. Labeled Reviews\\2. Without Emojis\\ValidReviews.txt", "4. Labeled Reviews\\2. Without Emojis\\InvalidReviews.txt")
        