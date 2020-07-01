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
