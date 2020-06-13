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
#Plot 4
png(filename = "plot4.png",width = 480, height = 480, units = "px")
par(mfrow=c(2,2))
#Plot 4(1,1)
plot(df.f$Date,df.f$Global_active_power,type="l",
     xlab="", ylab="Global Active Power (killowatts)")
#Plot 4(1,2)
plot(df.f$Date,df.f$Voltage,type="l",
     xlab="datetime", ylab="Voltage")
#Plot 4(2,1)
plot(df.f$Date,df.f$Sub_metering_1,type="n",
     xlab="", ylab="Energy sub metering")
lines(df.f$Date,df.f$Sub_metering_1,col="black")
lines(df.f$Date,df.f$Sub_metering_2,col="red")
lines(df.f$Date,df.f$Sub_metering_3,col="blue")
legend("topright",lty=c(1,1,1),col=c("black","red","blue"),bty = "n",
       legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
#Plot 4(2,2)
plot(df.f$Date,df.f$Global_reactive_power,type="l",
     xlab="datetime", ylab="Global_reactive_power")
dev.off()
#
# End of Script