# The following script assumes the "Individual household electric power consumption Data Set" resides in your working directory.

# Load data

df <- read_csv2("household_power_consumption.txt", n_max = 100000)

# Subset the data 

df$Date <- as.Date(df$Date, format = "%d/%m/%Y")
new_df <- subset(df, df$Date == "2007/02/01" | df$Date == "2007/02/02")

# Open graphics device and set layout param

png(filename = "plot2.png", width = 480, height = 480)

# Plot data
plot(as.numeric(new_df$Global_active_power), type = "l", ylab = "Global Active Power (kilowatts)", xlab = "", xaxt = "n")

# Label the x-axis

v1 <- c(0,length(new_df$Date)/2,length(new_df$Date))
axis(1, at= v1, labels=c("Thur", "Fri", "Sat"))

# Close device

dev.off()