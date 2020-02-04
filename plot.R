library(dplyr)
#step 0: downlaod files

zipFile <- "activity.zip"
# unzip zip file containing data if data directory doesn't already exist
dataPath <- "activity.csv"
if (!file.exists(dataPath)) {
    unzip(zipFile)
}


#rLoading and preprocessing the data
data <- read.csv(dataPath)

data$date <- as.Date(as.character(data$date))

#Histogram of the total number of steps taken each day
steps_per_day <- tapply(data$steps, data$date, FUN=sum, na.rm=TRUE)
barplot(steps_per_day)

#Mean and median number of steps taken each day
avg_steps_per_day <- mean(steps_per_day)
median_steps_per_day <- median(steps_per_day)

