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
steps_per_interval <- data.frame(key=names(steps_per_interval), value=steps_per_interval)
plot(steps_per_interval$key, steps_per_interval$value, type='l', xlab='5 min interval')
names(steps_per_interval) <- c('interval', 'steps')

#Which 5-minute interval, on average across all the days in the dataset, 
#contains the maximum number of steps?
max_idx <- which.max(steps_per_interval$steps)
max_interval <- steps_per_interval[max_idx,]$interval

#Imputing missing values
total_missing_value <- table(is.na(data$steps))['TRUE']

#Devise a strategy for filling in all of the missing values in the dataset. 
#For example, you could use the mean/median for that day, or the mean for that
#5-minute interval, etc.
new_data<- data
for(i in as.numeric(names(table(data$interval)))){
    new_data[new_data$interval==i,]$steps <- steps_per_interval[steps_per_interval$interval==i,]$steps
}

#Make a histogram of the total number of steps taken each day and Calculate 
#and report the mean and median total number of steps taken per day. 
#Do these values differ from the estimates from the first part of the assignment?
#What is the impact of imputing missing data on the estimates of the total daily 
#number of steps?

steps_per_day_new <- tapply(data$steps, data$date, FUN=sum, na.rm=TRUE)
barplot(steps_per_day_new)
avg_steps_per_day_new <- mean(steps_per_day_new)
median_steps_per_day_new <- median(steps_per_day_new)


