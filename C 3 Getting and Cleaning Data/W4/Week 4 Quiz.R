# Community Survey distributes downloadable data about United States communities. microdata survey about housing for the state of Idaho

fileUrl <- 'https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv'
download.file(fileUrl, destfile = paste0(getwd(), '/idaho_housing.csv'), method = 'curl', quiet = T)

idaho_housing <- read.csv('idaho_housing.csv')

strsplit(names(idaho_housing), split = 'wgtp')[123]


# Gross Domestic Product data for the 190 ranked countries

fileUrl <- 'https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv'
download.file(fileUrl, destfile = paste0(getwd(), '/GCData.csv'), method = 'curl', quiet = T)

GCData <- read.csv('GCData.csv', skip = 4, nrows = 190)

mean(as.numeric(gsub(pattern = ',', replacement = '', x=GCData$X.4)))


# regular expression that would allow you to count the number of countries whose name begins with "United"
GCData <- GCData[c(-99, -186), c(1, 2, 4, 5)]
colnames(GCData) <- c('Code', 'Rank', 'countryNames', 'GDP')
grep(pattern = '^United', x = GCData$countryNames) #<<<this is the pattern


# Load the Gross Domestic Product data for the 190 ranked countries in this data set:

fileUrl <- 'https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv'
download.file(fileUrl, destfile = './GDP.csv', method = 'curl', quiet = T)

# Load the educational data from this data set:
fileUrl <- 'https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv'
download.file(fileUrl, destfile = './EducationalData', method = 'curl', quiet = T)


             
GDPData <- read.csv('GDP.csv', skip = 4, nrows = 190)
GDPData <- GDPData[, c(1, 2, 4, 5)]
colnames(GDPData) <- c('CountryCode', 'Rank', 'countryNames', 'GDP')


educationData <- read.csv('EducationalData')
educationData <- educationData[, c(1, 10)]

colnames(educationData) <- c('CountryCode', 'Notes')
mergData <- merge(GDPData, educationData, by = 'CountryCode')
length(grep('Fiscal year end: June', mergData$Notes))


library(quantmod)
amzn = getSymbols("AMZN",auto.assign=FALSE)
sampleTimes = index(amzn)



# values were collected in 2012? How many values were collected on Mondays in 2012?

table(grepl('2012', strsplit(as.character(sampleTimes), split = '-')))
collectedValues <- as.data.frame(sampleTimes)

library(data.table)
length(collectedValues[(year(collectedValues$sampleTimes) == 2012) & (weekdays(collectedValues$sampleTimes) == 'Monday'), ])



  

