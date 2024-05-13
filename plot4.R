# Plot 4 contains four different plots arranged in a 2x2 grid.
# Moving clockwise from the top right, the plots are:

# 1. Global active power over time (similar to plot 2)
# 2. Voltage over time
# 3. Energy sub metering over time (similar to plot 3)
# 4. Global reactive power over time

source("dataSetup.R")

thu <- as.numeric(as.POSIXct("2007-02-01 00:00:00 BST"))
fri <- as.numeric(as.POSIXct("2007-02-02 00:00:00 BST"))
sat <- as.numeric(as.POSIXct("2007-02-03 00:00:00 BST"))

png(filename = "plot4.png")
par(mfrow = c(2, 2))

# Top left
plot(
  data$DateTime,
  data$Global_active_power,
  axes = FALSE,
  type = "n",
  xlab = NA,
  ylab = "Global Active Power"
)
axis(side = 1, at = c(thu, fri, sat), labels = c("Thu", "Fri", "Sat"))
axis(side = 2)
lines(data$DateTime, data$Global_active_power)
box()

# Top right
plot(
  data$DateTime,
  data$Voltage,
  axes = FALSE,
  type = "n",
  xlab = "datetime",
  ylab = "Voltage"
)
axis(side = 1, at = c(thu, fri, sat), labels = c("Thu", "Fri", "Sat"))
axis(side = 2)
lines(data$DateTime, data$Voltage)
box()

# Bottom left
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
  bty = "n",
  col = c("black", "red", "blue"),
  legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
)
box()

# Bottom right
plot(
  data$DateTime,
  data$Global_reactive_power,
  axes = FALSE,
  type = "n",
  xlab = "datetime",
  ylab = "Global_reactive_power"
)
axis(side = 1, at = c(thu, fri, sat), labels = c("Thu", "Fri", "Sat"))
axis(side = 2)
lines(data$DateTime, data$Global_reactive_power)
box()
dev.off()
