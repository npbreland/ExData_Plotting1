# Create plot 3, a line chart of energy sub metering over the selected time.
# There's one line for each type of sub metering.

source("dataSetup.R")

thu <- as.numeric(as.POSIXct("2007-02-01 00:00:00 BST"))
fri <- as.numeric(as.POSIXct("2007-02-02 00:00:00 BST"))
sat <- as.numeric(as.POSIXct("2007-02-03 00:00:00 BST"))

png(filename = "plot3.png")
plot(
  data$DateTime,
  data$Sub_metering_1,
  axes = FALSE,
  type = "n",
  xlab = NA,
  ylab = "Energy sub metering"
)
axis(side = 1, at = c(thu, fri, sat), labels = c("Thu", "Fri", "Sat"))
axis(side = 2)
lines(data$DateTime, data$Sub_metering_1)
lines(data$DateTime, data$Sub_metering_2, col = "red")
lines(data$DateTime, data$Sub_metering_3, col = "blue")
legend(
  "topright",
  lty = 1,
  col = c("black", "red", "blue"),
  legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
)
box()
dev.off()
