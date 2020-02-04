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

#What is the average daily activity pattern?
#Time series plot of the average number of steps taken
steps_per_interval <- tapply(data$steps, data$interval, FUN=mean, na.rm=TRUE)
plot(steps_per_interval, type='l', xlab='5 min interval')

#Which 5-minute interval, on average across all the days in the dataset, 
#contains the maximum number of steps?
max_interval <- which.max(steps_per_interval)

#Imputing missing values