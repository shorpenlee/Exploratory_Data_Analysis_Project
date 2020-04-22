#prepare the date
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
#change date format
NEI$year <- as.list(NEI$year)


#plot6

library(ggplot2)
tempMotor <- SCC[grep('?vehicle',SCC$Short.Name,ignore.case = T),]
la_baltimore <- subset(NEI,NEI$fips %in% c("06037","24510") )
tempplot6 <- merge(la_baltimore,tempMotor,by.x = "SCC",by.y = "SCC",all=FALSE)
#boxplot
ggplot(tempplot6,aes(x=as.factor(year),y=Emissions,fill=fips))+geom_bar(stat="sum",width = 0.5,position="dodge")+ guides(size=FALSE)+
  labs(title = "Vehicle related emissions comparision in Baltimore City and L.A. from 1999-2008")+theme(plot.title = element_text(hjust = 0.5))+
  labs(x="year")+scale_fill_discrete(name="City",labels=c("Los Angeles","Baltimore City"))

#Compare emissions from motor vehicle sources in Baltimore City 
#with emissions from motor vehicle sources in Los Angeles County, California (fips == "06037")
#Which city has seen greater changes over time in motor vehicle emissions?
#Los Angeles

#Copy plot to a png file and save
dev.copy(png,file="plot6.png")
dev.off()
