corr <- function(directory, threshold = 0)
{
  #create list of all files
  list <- list.files(directory, full.names= TRUE)
  # create empty data set
  dat <- vector(mode = "numeric", length = 0)
  for(i in 1:length(list))
  {
    # Read File
    tmp <- read.csv(list[i])
    
    #Calculate csum    
    csum <- sum((!is.na(tmp$sulfate)) & (!is.na(tmp$nitrate)))
    if (csum > threshold)
    {
      #Extract data of niteate and sulfate and calculate correlation between them
      sul <- tmp[which(!is.na(tmp$sulfate)), ]
      nit <- sul[which(!is.na(sul$nitrate)), ]
      dat <- c(dat, cor(nit$sulfate, nit$nitrate))
    }
  }
  
  return(dat)
}

cr <- corr("specdata", 150)
head(cr)
summary(cr)
cr <- corr("specdata", 400)
head(cr)
summary(cr)
cr <- corr("specdata", 5000)
summary(cr)
length(cr)
cr <- corr("specdata")
summary(cr)
length(cr)
