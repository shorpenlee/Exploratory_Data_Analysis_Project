#prepare the date
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
#change date format
totalbyyear <- aggregate(NEI$Emissions,by=list(NEI$year),sum)

#plot1
#set the precision
options(scipen = 9)
barplot(totalbyyear$x,totalbyyear$Group.1,main = "Total emissions in U.S. by year", names.arg=totalbyyear$Group.1,xlab = "Year",ylab = "Total emissions")

#Have total emissions from PM2.5 decreased in the United States from 1999 to 2008?
#Yes

#Copy plot to a png file and save
dev.copy(png,file="plot1.png")
dev.off()
