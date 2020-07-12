#Using R to Access data from GitHub
install.packages("jsonlite")
library(jsonlite)
install.packages("httpuv")
library(httpuv)
install.packages("httr")
library(httr)


ClientID <- '8e61de95882635af052b'
ClientSecret <- 'cd024d160efa2cc867c6dd2870771da20c59d89b'

myApp <- oauth_app(appname =  'github', key = ClientID, secret = ClientSecret)


# get oauth
github_token <- oauth2.0_token(oauth_endpoints('github'), myApp)


# use API
githubtoken <- config(token = github_token)

req <- GET("https://api.github.com/users/khalidm1/repos", githubtoken)

# incase of ERRor ouccuring
stop_for_status(req)
content(req)


# Another option
# Extract content from the API link https://api.github.com/users/khalidm1/repos
req <- with_config(githubtoken, GET("https://api.github.com/users/khalidm1/repos"))
stop_for_status(req)
content(req)


# For the Quiz
githubtoken <- config(token = github_token)
req <- GET("https://api.github.com/users/jtleek/repos", githubtoken)
stop_for_status(req)
content(req)

# Result
# [[29]]$created_at
# [1] "2013-11-21T15:07:59Z"






install.packages("sqldf")
library(sqldf)
fileUrl <- 'https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06pid.csv'
download.file(fileUrl, destfile = paste0(getwd(), '/American_Community_Survey.csv'), method = 'curl', quiet = T)

acs <- read.csv('American_Community_Survey.csv')


# Query select only the data for the probability weights pwgtp1 with ages less than 50

sqldf('select pwgtp1 from acs where AGEP < 50')


# equivalent function to unique(acs$AGEP)
unique(acs$AGEP)
sqldf("select distinct AGEP from acs")


# How many characters are in the 10th, 20th, 30th and 100th lines of HTML

characterNum <- readLines('http://biostat.jhsph.edu/~jleek/contact.html')

c(nchar(characterNum[10]), nchar(characterNum[20]), nchar(characterNum[30]), nchar(characterNum[100]))


# Fixed width Format fwf
fwfdata <- read.fwf(url('https://d396qusza40orc.cloudfront.net/getdata%2Fwksst8110.for'), widths = c(10, 9, 9, 4, 5, 8, 5, 8, 5), skip = 4)

# sum of the numbers in the fourth of the nine columns
sum(fwfdata[, 4])
