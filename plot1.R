household_power_consumption <- read.csv("D:/Courses/data/household_power_consumption.txt", sep=";", na.strings="?")
household_power_consumption<-cbind(paste(household_power_consumption$Date,household_power_consumption$Time), household_power_consumption)
names(household_power_consumption)[1]<-"DateTime"
household_power_consumption$Date<-as.Date(household_power_consumption$Date,"%d/%m/%Y")
household_power_consumption$DateTime<-strptime(household_power_consumption$DateTime, "%d/%m/%Y %H:%M:%S")
data<-household_power_consumption[c(household_power_consumption$Date==as.Date("2007/02/01")|household_power_consumption$Date==as.Date("2007/02/02")),]
hist(data$Global_active_power, col=2, main="Global Active Power", xlab= "Global Active Power (kilowatts)")
png(file="plot1.png", bg="transparent")
dev.off()