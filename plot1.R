# Create plot 1, a histogram of global active power.

source("dataSetup.R")

png(filename = "plot1.png")
hist(
  data$Global_active_power,
  col = "red",
  xlab = "Global Active Power (kilowatts)",
  main = "Global Active Power",
)
dev.off()
