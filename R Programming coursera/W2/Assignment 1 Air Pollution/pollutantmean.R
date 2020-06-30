pollutantmean <- function(directory, pollutant, id = 1:332)
{
  #create a list of files
  files_full <- list.files(directory, full.names = TRUE) 
  # create an empty data frame
  dat <- data.frame()
  for (i in id)
  {
    #add files to main data
    dat <- rbind(dat, read.csv(files_full[i]))
    
  }
  #Calulate mean
  mean_data <- mean(dat[, pollutant], na.rm = TRUE)
  return(mean_data)
}

pollutantmean <- function(directory, pollutant, id = 1:332) {
  
  # Format number with fixed width and then append .csv to number
  fileNames <- paste0(directory, '/', formatC(id, width=3, flag="0"), ".csv" )
  
  # Reading in all files and making a large data.table
  lst <- lapply(fileNames, data.table::fread)
  dt <- rbindlist(lst)
  
  if (c(pollutant) %in% names(dt)){
    return(dt[, lapply(.SD, mean, na.rm = TRUE), .SDcols = pollutant][[1]])
  } 
}



###################Another Function#########################
###########################################################
# pollutantmean <- function(directory, pollutant, id = 1:332) {
#   
#   #path <- file.path(getwd(),directory)
#   #setwd(file.path(getwd(),directory))
#   
#   path <- paste0(getwd(),"/", directory) #this one is more general
#   
#   data <- data.frame()
#   for (i in id) {
#     if (i < 10) {
#       dat <- read.csv(paste(path,"/00", as.character(i),".csv", sep = ""), 
#                       as.is = T, 
#                       header = T)
#       data <- rbind(data,dat)
#     }
#     else if (i < 100) {
#       dat <- read.csv(paste(path,"/0", as.character(i),".csv", sep = ""), 
#                       as.is = T, 
#                       header = T)
#       data <- rbind(data,dat)
#     }
#     else {
#       dat <- read.csv(paste(path,"/", as.character(i),".csv", sep = ""), 
#                       as.is = T, 
#                       header = T)
#       data <- rbind(data,dat)
#     }
#     
#   }
#   return(mean(data[,pollutant], na.rm = T))
# }
###########################################################
###########################################################


###################Another Function#########################
#############################################################
# pollutantmean <- function(directory, pollutant, id = 1:332){
#   measurements <- c() #make an empty vector
#   
#   for (i in id) {
#     filePath <- paste(directory, '/', formatC(i, width = 3, flag = "0"), '.csv', sep = "")
#     #make id number all the same length (3 digits)
#     fileData <- read.csv(filePath) #read the file
#     measurements <- append(measurements, fileData[, pollutant])
#   }
#   
#   return(mean(measurements, na.rm = T))
# }
#############################################################
#############################################################



###################Another Function#########################
###########################################################
# pollutantmean <- function(directory, pollutant, id = 1:332)
# {
#   #create a list of files
#   files_full <- list.files(directory, full.names = TRUE) 
#   # create an empty data frame
#   dat <- data.frame()
#   for (i in id)
#   {
#     #add files to main data
#     dat <- rbind(dat, read.csv(files_full[i]))
#     
#   }
#   #Calulate mean
#   mean_data <- mean(dat[, pollutant], na.rm = TRUE)
#   return(mean_data)
# }
#########################################################
########################################################




# Use the function
pollutantmean("specdata", "sulfate", 1:10)
pollutantmean("specdata", "nitrate", 70:72)
pollutantmean("specdata", "nitrate", 23)
pollutantmean("specdata", "sulfate", 34)
pollutantmean("specdata", "nitrate")

