household_power_consumption <- read.csv("D:/Courses/data/household_power_consumption.txt", sep=";", na.strings="?")
household_power_consumption<-cbind(paste(household_power_consumption$Date,household_power_consumption$Time), household_power_consumption)
names(household_power_consumption)[1]<-"DateTime"
household_power_consumption$Date<-as.Date(household_power_consumption$Date,"%d/%m/%Y")
household_power_consumption$DateTime<-strptime(household_power_consumption$DateTime, "%d/%m/%Y %H:%M:%S")
data<-household_power_consumption[c(household_power_consumption$Date==as.Date("2007/02/01")|household_power_consumption$Date==as.Date("2007/02/02")),]
with(data, plot(DateTime, Sub_metering_1, type="l", ylim=c(0,38), ylab= "Energy Sub metering", xlab=""))
par(new=TRUE)
with(data, plot(DateTime, Sub_metering_2, type="l", col="red", ylim=c(0,38), xlab=NA,ylab=NA,frame=FALSE))
par(new=TRUE)
with(data, plot(DateTime, Sub_metering_3, type="l", col="blue", ylim=c(0,38), xlab=NA,ylab=NA,frame=FALSE))
legend("topright", lty=1, col=c("black","red","blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), cex=1)
png(file="plot3.png", bg="transparent")
dev.off()