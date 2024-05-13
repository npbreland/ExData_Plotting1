graphics.off()
library(dplyr)

# Unzip file
unzip("household_power_consumption.zip")

# Load the data from dates 2007-02-01 to 2007-02-02 into a dataframe
data <- read.table(
  "household_power_consumption.txt", sep = ";", skip = 66637, nrow = 2880
)

# Add the column names
colnames(data) <- c(
  "Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage",
  "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3"
)

# Create a dplyr tibble from the data frame.
data <- as_tibble(data)


# Change the Date and Time columns (string) to a single column containing the 
# Date and Time as instances of the POSIXct class.
data <- data %>%
  mutate(DateTime = paste(Date, Time, sep = " ")) %>%
  mutate(DateTime = as.POSIXct(DateTime, format = "%d/%m/%Y %H:%M:%S")) %>%
  mutate(Weekday = weekdays(DateTime, abbreviate = TRUE)) %>%
  select(
    "DateTime", "Weekday", "Global_active_power", "Global_reactive_power",
    "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2",
    "Sub_metering_3"
  )
