#prepare the date
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
#change date format
NEI$year <- as.list(NEI$year)


#plot2
baltimore <- subset(NEI,NEI$fips =="24510")
baltimorebyyear <- aggregate(baltimore$Emissions,by=list(baltimore$year),sum)
options(scipen = 9)
barplot(baltimorebyyear$x,baltimorebyyear$Group.1,main = "Total emissions in Baltimore by year", names.arg=baltimorebyyear$Group.1,xlab = "Year",ylab = "Total emissions")

#Have total emissions from PM2.5 decreased in the Baltimore City, Maryland (fips == "24510") from 1999 to 2008?
#No

#Copy plot to a png file and save
dev.copy(png,file="plot2.png")
dev.off()
