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