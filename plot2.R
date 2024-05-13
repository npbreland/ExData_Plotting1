# Create plot 2, a line chart of global active power over the selected time.

source("dataSetup.R")

thu <- as.numeric(as.POSIXct("2007-02-01 00:00:00 BST"))
fri <- as.numeric(as.POSIXct("2007-02-02 00:00:00 BST"))
sat <- as.numeric(as.POSIXct("2007-02-03 00:00:00 BST"))

png(filename = "plot2.png")
plot(
  data$DateTime,
  data$Global_active_power,
  axes = FALSE,
  type = "n",
  xlab = NA,
  ylab = "Global Active Power (kilowatts)"
)
axis(side = 1, at = c(thu, fri, sat), labels = c("Thu", "Fri", "Sat"))
axis(side = 2)
lines(data$DateTime, data$Global_active_power)
box()
dev.off()
