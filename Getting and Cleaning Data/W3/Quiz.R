install.packages("jpeg")
library(jpeg)
fileUrl <- 'https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv'
download.file(fileUrl, destfile = paste0(getwd(), '/idaho_housing.csv'), method = 'curl', quiet = T)

idaho_housing <- read.csv('idaho_housing.csv')
# 
# Create a logical vector that identifies the households on greater than 10 acres
# who sold more than $10,000 worth of agriculture products. 
# Assign that logical vector to the variable agricultureLogical. 
# Apply the which() function like this to identify the rows of the data frame 
# where the logical vector is TRUE.

agricultureLogical <- idaho_housing$ACR == 3 & idaho_housing$AGS == 6
which(agricultureLogical)[1:3]



# What are the 30th and 80th quantiles of the resulting data? 

fileUrl <- 'https://d396qusza40orc.cloudfront.net/getdata%2Fjeff.jpg'
download.file(fileUrl, 'picture.jpg', mode='wb' )

picture <- jpeg::readJPEG('picture.jpg'
                          , native=TRUE)

# Get Sample Quantiles corressponding 30th and 80th to given prob
quantile(picture, probs = c(0.3, 0.8) )




########################################
# Load the Gross Domestic Product data for the 190

fileUrl <- 'https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv'
download.file(fileUrl, destfile = paste0(getwd(), '/Gross_Domestic_Product.csv'), method = 'curl', quiet = T)

GDPData <- read.csv('Gross_Domestic_Product.csv', stringsAsFactors = F, 
                    skip = 4, na.strings = NA)[1:190, c(1, 2, 4, 5)] #only the first 190 countries!
GDPData$X.1 <- as.numeric(GDPData$X.1)
download.file('https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv', 
              destfil = paste0(getwd(), '/GDEdu.csv'), 
              method = 'curl', quiet = T)
GDEdu <- read.csv('GDEdu.csv')
GDEData <- GDPData[GDPData$X %in% GDEdu$CountryCode, ]
nrow(GDEData)
GDEData <- GDEData[order(GDEData$X.1, decreasing = T), ]
GDEData[13, ]

# 
# nrow(GDEData)
# [1] 189
# > GDEData <- GDEData[order(GDEData$X.1, decreasing = T), ]
# > GDEData[13, ]
# X X.1                 X.3   X.4
# 179 KNA 178 St. Kitts and Nevis  767 
# Sort the data frame in descending order by GDP rank (so United States is last)


colnames(GDEData) <- c('Code', 'Rank', 'Name', 'Income')
GDEData$Income <- as.numeric(gsub(",", "", GDEData$Income))
#convert the income data into numbers
GDEData2 <- GDEData[, 1:3]
colnames(GDEData2) <- c('Code', 'Name', 'Group')
GrossData <- merge(GDEData, GDEData2, by = 'Code')
unique(GrossData$Group)
mean(GrossData[GrossData$Group == 'High income: OECD', ]$Rank)
mean(GrossData[GrossData$Group == 'High income: nonOECD', ]$Rank)


install.packages("Hmisc")
library(Hmisc)
GDEData3 <- GrossData[, c(2, 4:6)]
GDEData3$RankGroup <- cut2(GDEData3$Rank, g = 5)

table(GDEData3$RankGroup, GDEData3$Group)
