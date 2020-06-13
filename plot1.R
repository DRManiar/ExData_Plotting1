# ----------------------------------------------------
# Download the zip file from:
# https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip
# 
# Extract household_power_consumption.txt and copy it in your working directory
# ----------------------------------------------------
#
# Reading household_power_consumption.txt file
df<-read.table(file="household_power_consumption.txt",header=TRUE,sep=";")
#
# Subset the data for the required dates
df.f<-subset(df,Date=="1/2/2007" | Date=="2/2/2007")
#
# Since the large dataset is not required, remove it from the memory
rm(df)
#
# Replace "?" with NA in df.f
df.f[df.f=="?"]<-NA
#
# Concatenate Date and Time, then convert to date class, then store it as Date
df.f$Date<-strptime(paste(df.f$Date,df.f$Time), "%d/%m/%Y %H:%M:%S")
#
# Convert data columns from char to numeric
df.f[,3:9]<-lapply(df.f[,3:9],as.numeric)
#
# Plot 1
png(filename = "plot1.png",width = 480, height = 480, units = "px")
hist(df.f$Global_active_power,col="red",
     xlab="Global Active Power (killowatts)",
     ylab="Frequency", main = "Global Active Power")
dev.off()
#
# End of Script