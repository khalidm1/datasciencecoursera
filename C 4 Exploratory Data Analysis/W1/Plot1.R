download.file('https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip',
              destfile = './Data_Plotting.zip', method = 'curl', quiet = T)
unzip(zipfile = 'Data_Plotting.zip')



# We will only be using data from the dates 2007-02-01 and
# 2007-02-02. One alternative is to read the data from just those dates
# rather than reading in the entire dataset and subsetting to those
# dates.
# You may find it useful to convert the Date and Time variables to
# Date/Time classes in R using the `strptime()` and `as.Date()`
# functions.

D1 <- read.table('household_power_consumption.txt', header = T, stringsAsFactors = F, na.strings = "?", sep = ';', quote = "", skip = 66636, nrows = 2880)
tail(D1)

# convert the Date and Time variables to Date/Time
colnames(D1) <- c('Date', 'Time', 'GlobalActivePower', 'GlobalReactivePower', 'Voltage',
                       'GlobalIntensity', 'SubMetering1', 'SubMetering2', 'SubMetering3')
D1$DateTime <- strptime(paste(D1$Date, D1$Time), format = '%d/%m/%Y %H:%M:%S')

#histogram
hist(D1$GlobalActivePower, col = 'red',
     main = 'Global Active Power',
     xlab = 'Global Active Power (kilowatts)')


