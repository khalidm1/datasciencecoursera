complete <- function(directory, id = 1:332)
 {
   #Create a list of file
   files_full <- list.files(directory, full.names= TRUE)
   # Create empty data frame
   dat <- data.frame()
   for (i in id)
   {
     # Read files
     temp <- read.csv(files_full[i])
     # nobs are sum of all complete cases
     nobs <-sum(complete.cases(temp))
     # Enamurtates complete cass by index
     dat <-rbind(dat, data.frame(i, nobs))

   }
   colnames(dat) <- c("id", "nobs")
   return(dat)
 }
###########################################################
###########################################################
###################Another Function#########################
###########################################################
# complete <- function(directory, id = 1:332) {
#   ##reads a directory full of files and reports the number of 
#   ##completely observed cases in each data file
#   monitorId <- c()
#   completeCases <- c()
#   for (i in id) {
#     monitorId <- append(monitorId, i)
#     filePath <- paste(directory, '/', formatC(i, width = 3, flag = "0"), '.csv', sep = "")
#     fileData <- read.csv(filePath)
#     completeCount <- sum(complete.cases(fileData))
#     completeCases <- append(completeCases, completeCount)
#   }
#   #  print(MonitorId)
#   #  print(CompleteCases)
#   return(as.data.frame(cbind(monitorId, completeCases)))
# }
###########################################################
###########################################################

complete("specdata", 1)
complete("specdata", c(2, 4, 8, 10, 12))
complete("specdata", 30:25)
complete("specdata", 3)
complete(directory = 'C:/Users/khali/Desktop/Data Science/Big Data/R Programming coursera/W2/Assignment 1 Air Pollution/specdata', id = 30:25)

cc <- complete("specdata", c(6, 10, 20, 34, 100, 200, 310))
print(cc$nobs)

cc <- complete("specdata", 54)
print(cc$nobs)


RNGversion("3.5.1")  
set.seed(42)
cc <- complete("specdata", 332:1)
use <- sample(332, 10)
print(cc[use, "nobs"])


cr <- corr("specdata")                
cr <- sort(cr)   
RNGversion("3.5.1")
set.seed(868)                
out <- round(cr[sample(length(cr), 5)], 4)
print(out)

cr <- corr("specdata", 129)                
cr <- sort(cr)                
n <- length(cr)    
RNGversion("3.5.1")
set.seed(197)                
out <- c(n, round(cr[sample(n, 5)], 4))
print(out)

cr <- corr("specdata", 2000)                
n <- length(cr)                
cr <- corr("specdata", 1000)                
cr <- sort(cr)
print(c(n, round(cr, 4)))
