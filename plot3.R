# The following script assumes the "Individual household electric power consumption Data Set" resides in your working directory.

# Load data

df <- read_csv2("household_power_consumption.txt", n_max = 100000)

# Subset the data 

df$Date <- as.Date(df$Date, format = "%d/%m/%Y")
new_df <- subset(df, df$Date == "2007/02/01" | df$Date == "2007/02/02")

# Open graphics device and set layout param

png(filename = "plot3.png", width = 480, height = 480)

# Plotting Sub_metering data

plot(new_df$Sub_metering_1 , type = "l", ylab = "Energy sub metering", xlab = "", xaxt = "n")
lines(new_df$Sub_metering_2, col = "red")
lines(new_df$Sub_metering_3, col = "blue")

# Label the x-axis

v1 <- c(0,length(new_df$Date)/2,length(new_df$Date))
axis(1, at= v1, labels=c("Thur", "Fri", "Sat"))

# Adding a legend 

legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=c(1,1,1), col = c("black", "red", "blue"))

# Close device

dev.off()

