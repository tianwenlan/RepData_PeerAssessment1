library(dplyr)
#step 0: downlaod files

zipFile <- "activity.zip"
# unzip zip file containing data if data directory doesn't already exist
dataPath <- "activity.csv"
if (!file.exists(dataPath)) {
    unzip(zipFile)
}


#read the file
data <- read.csv(dataPath)

data$date <- as.Date(as.character(data$date))

#Histogram of the total number of steps taken each day
barplot(tapply(data$steps, data$date, FUN=sum, default = 0))