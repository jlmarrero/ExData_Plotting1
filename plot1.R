# The following script assumes the "Individual household electric power consumption Data Set" resides in your working directory.

# Load data
df <- read_csv2("household_power_consumption.txt", n_max = 100000)

# Subset the data 
df$Date <- as.Date(df$Date, format = "%d/%m/%Y")
new_df <- subset(df, df$Date == "2007/02/01" | df$Date == "2007/02/02")

# Open graphics device and set layout param
png(filename = "plot1.png", width = 480, height = 480)

# Plot data

hist(as.numeric(new_df$Global_active_power), breaks = 15, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")

# Close graphics device

dev.off()