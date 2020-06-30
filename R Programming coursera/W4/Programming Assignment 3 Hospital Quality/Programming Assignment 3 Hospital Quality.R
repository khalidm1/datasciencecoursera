# Plot the 30-day mortality rates for heart attack
outcome <- read.csv("C:/Users/khali/Desktop/Data Science/Big Data/datasciencecoursera/R Programming coursera/W4/Programming Assignment 3 Hospital Quality/ProgAssignment3-data/outcome-of-care-measures.csv", colClasses = "character")
head(outcome)

outcome[, 11] <- as.numeric(outcome[, 11])
hist(outcome[, 11])


# Finding the best hospital in a state
best <- function(state, outcome) {
   
  D <- read.csv("C:/Users/khali/Desktop/Data Science/Big Data/datasciencecoursera/R Programming coursera/W4/Programming Assignment 3 Hospital Quality/ProgAssignment3-data/outcome-of-care-measures.csv", colClasses = "character")
  
  outcomeData <- D[ ,c(2, 7, 11, 17, 23)]
  colnames(outcomeData) <- c('Hospital', 'State', 'heart attack', 'heart failure', 'pneumonia')
  
  if (state %in% outcomeData[, 2] == FALSE) {
    stop('invalid state')
  }
  if (outcome %in% colnames(outcomeData)[3:5] == FALSE) {
    stop('invalid outcome')
  }
  
   selectData <- outcomeData[outcomeData$State == state, c('Hospital', 'State', outcome)]
   selectData <- selectData[order(selectData$Hospital, decreasing = F), ]
   selectData[, 3] <- suppressWarnings(as.numeric(selectData[, 3]))
   
   return(selectData[which.min(selectData[, 3]), 1]) 
   
}
best("TX", "heart attack")
best("TX", "heart failure")
best("MD", "heart attack")
best("MD", "pneumonia")
best("BB", "heart attack") #ERROR
best("NY", "hert attack") #ERROR


# Ranking hospitals by outcome in a state
rankhospital <- function(state, outcome, num = 'best'){
  D <- read.csv("C:/Users/khali/Desktop/Data Science/Big Data/datasciencecoursera/R Programming coursera/W4/Programming Assignment 3 Hospital Quality/ProgAssignment3-data/outcome-of-care-measures.csv", colClasses = "character")
  
  outcomeData <- D[ ,c(2, 7, 11, 17, 23)]
  colnames(outcomeData) <- c('Hospital', 'State', 'heart attack', 'heart failure', 'pneumonia')
  
  if (state %in% outcomeData[, 2] == FALSE) {
    stop('invalid state')
  }
  if (outcome %in% colnames(outcomeData)[3:5] == FALSE) {
    stop('invalid outcome')
  }
  
  selectData <- outcomeData[outcomeData$State == state, c('Hospital', 'State', outcome)]
  selectData <- selectData[order(selectData$Hospital, decreasing = F), ]
  selectData[, 3] <- suppressWarnings(as.numeric(selectData[, 3]))
  
  
  selectData <- selectData[complete.cases(selectData), ]
  selectData <- selectData[order(selectData[, 3], decreasing = F), ]
  
  if (num == 'best') {
    rank <- 1
    
  }
  
  else if (num == 'worst') {
    rank <- nrow(selectData)
    
  }
  else if (num > nrow(selectData)) {
    return(NA)
    
  }
  else  
    rank <- num
  

return(selectData[rank, 1])
}
rankhospital("TX", "heart failure", 4)
rankhospital("MD", "heart attack", "worst")
rankhospital("MN", "heart attack", 5000)



# Ranking hospitals in all states
rankall <- function(outcome, num = "best"){
    D <- read.csv("C:/Users/khali/Desktop/Data Science/Big Data/datasciencecoursera/R Programming coursera/W4/Programming Assignment 3 Hospital Quality/ProgAssignment3-data/outcome-of-care-measures.csv", colClasses = "character")
    
    outcomeData <- D[ ,c(2, 7, 11, 17, 23)]
    colnames(outcomeData) <- c('Hospital', 'State', 'heart attack', 'heart failure', 'pneumonia')
    
    
    if (outcome %in% colnames(outcomeData)[3:5] == FALSE) {
      stop('invalid outcome')
    }
    
    selectData <- outcomeData[, c('Hospital', 'State', outcome)]
    selectData[, 3] <- suppressWarnings(as.numeric(selectData[, 3]))
    
    
    
    selectData <- selectData[complete.cases(selectData), ]
    
    
    selectData <- selectData[order(selectData[, 3], decreasing = F), ]
    
    if (num == 'best') {
      selectData <- selectData[order(selectData[, 3], decreasing = F), ]
      rank <- 1
      
    }
    
    else if (num == 'worst') {
      selectData <- selectData[order(selectData[, 3], decreasing = T), ]
      rank <- nrow(selectData)
      
    }
    
    else {
      selectData <- selectData[order(selectData[, 3], decreasing = F), ]
      rank <- num
    }
      
    splitData <- split(selectData[, c(1,3)], selectData$State)
    
    hospital <- sapply(splitData, function(x) x[rank, 1])
    
    hospital <- data.frame(hospital)
    hospital$state <- row.names(hospital)
    
    return(hospital)
}

head(rankall("heart attack", 20), 10)
tail(rankall("pneumonia", "worst"), 3)
tail(rankall("heart failure"), 10)
