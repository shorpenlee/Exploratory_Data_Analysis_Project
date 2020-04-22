#prepare the date
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
#change date format
NEI$year <- as.list(NEI$year)


#plot5

library(ggplot2)
tempMotor <- SCC[grep('?vehicle',SCC$Short.Name,ignore.case = T),]
baltimore <- subset(NEI,NEI$fips =="24510")
tempplot5 <- merge(baltimore,tempMotor,by.x = "SCC",by.y = "SCC",all=FALSE)
#boxplot
ggplot(tempplot5,aes(x=as.factor(year),y=Emissions))+geom_bar(stat="sum",width = 0.5)+ theme(legend.position = "none") +
  labs(title = "Vehicle related emissions in Baltimore City from 1999-2008")+theme(plot.title = element_text(hjust = 0.5))+
  labs(x="year")

#How have emissions from motor vehicle sources changed from 1999–2008 in Baltimore City?
#Decrease

#Copy plot to a png file and save
dev.copy(png,file="plot5.png")
dev.off()
