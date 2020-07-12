---
        title: "Untitled"
author: "Khalid"
date: "7/12/2020"
output: html_document
---
        
        ### Your data analysis must address the following questions:
        
        1. Across the United States, which types of events (as indicated in the color red verb  variable) are most 
harmful with respect to population health?
        2. Across the United States, which types of events have the greatest economic consequences?
        
        Consider writing your report as if it were to be read by a   
government or municipal manager who might be responsible for 
preparing for severe weather events and will need to 
prioritize resources for different types of events. However, 
there is no need to make any specific recommendations in your 
report.
### Load the libraries

```{r}
library("data.table")
library("ggplot2")
```


### Download and extract the data into a dataframe.Then convert to a data.table

```{r}
fileUrl <- "https://d396qusza40orc.cloudfront.net/repdata%2Fdata%2FStormData.csv.bz2"
download.file(fileUrl, destfile = paste0(getwd(), '/Storm.csv.bz2'), method = 'curl', quiet = T)
storm_DB <- read.csv('Storm.csv.bz2', stringsAsFactors = F)

```
### Converting data.frame to data.table
```{r}
storm_DB <- as.data.table(storm_DB)

```
### Examining DATA
```{r}
names(storm_DB)
```
### OR 
```{r}
colnames(storm_DB)
```


### Subset the dataset on the parameters that we need and remove unneeded columns.

- EVTYPE: event type  
- FATALITIES: number of fatalities  
- INJURIES: number of injuries  
- PROPDMG: property damage (dollars)  
- PROPDMGEXP: magnitude of property damage (K = thousands, M =       millions, B = billions)  
- CROPDMG: crop damage (dollars)  
- CROPDMGEXP: magnitude of crop damage (H = hundreds, K =    
                                                thousands, M = millions, B = billions)  
```{r}

```

```{r}

```

```{r}

```

```{r}

```

```{r}

```

```{r}

```

```{r}

```

```{r}

```

```{r}

```

```{r}

```

```{r}

```

```{r}

```

```{r}

```

```{r}

```

```{r}

```

```{r}

```

```{r}

```

```{r}

```


