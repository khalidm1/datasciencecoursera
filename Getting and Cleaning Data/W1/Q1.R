fileUrl <- 'https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv'
download.file(fileUrl, destfile = paste0(getwd(), '/idaho_housing.csv'), method = 'curl', quiet = T)

idaho_housing <- read.csv('idaho_housing.csv')

worth1m <- (idaho_housing$VAL == 24)
table(worth1m)


# Use EXCEL format##################
fileUrl1 <- 'https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FDATA.gov_NGAP.xlsx'
download.file(fileUrl1, destfile = paste0(getwd(), '/Natural_Gas_Aquisition.xlsx'), method = 'curl', quiet = T)
# Use EXCEL format
install.packages("openxlsx")
library(openxlsx)


# Read rows 18-23 and columns 7-15 into R 
dat <- read.xlsx('Natural_Gas_Aquisition.xlsx', sheet = 1, rows = 18:23, cols = 7:15)
sum(dat$Zip*dat$Ext,na.rm=T)




# Use XML Format###############################
fileUrl2 <- 'https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Frestaurants.xml'
download.file(fileUrl2, destfile = paste0(getwd(), '/Baltimore_restaurants.xml'), method = 'curl', quiet = T)
install.packages("XML")
library(XML)


# The link had 'HTTPS' so we can't parse xml directly, we need more steps
xmldat <- xmlTreeParse('Baltimore_restaurants.xml', useInternal = TRUE)
xmlrootNode <- xmlRoot(xmldat)

length(xmlrootNode[xpathSApply(xmlrootNode, '//zipcode', xmlValue) == 21231])


# Microdata survey
fileUrl <- 'https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06pid.csv'
download.file(fileUrl, destfile = paste0(getwd(), '/idaho_housing.csv'), method = 'curl', quiet = T)
install.packages("data.table")
library(data.table)

DT <- fread(input = 'idaho_housing.csv', sep = ',')


DT[,mean(pwgtp15),by=SEX]

