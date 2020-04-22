#prepare the date
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
#change date format
NEI$year <- as.list(NEI$year)


#plot3
##qplot(x=year,y=Emissions,data=baltimore,facets = .~ type)
library(ggplot2)
baltimore <- subset(NEI,NEI$fips =="24510")
ggplot(baltimore, aes(x=as.factor(year), y=Emissions))+
  geom_bar(stat = "sum")+
  facet_wrap(~type)+
  labs(title = "Emissions trend in Baltimore City from 1999-2008")+theme(plot.title = element_text(hjust = 0.5))+theme(legend.position = "none") 

#Of the four types of sources indicated by the type (point, nonpoint, onroad, nonroad) variable, 
#Which of these four sources have seen decreases in emissions from 1999–2008 for Baltimore City?
#Which have seen increases in emissions from 1999–2008? 
#Increase: Point
#Decrease: Nonroad, Nonpoint, onroad

#Copy plot to a png file and save
dev.copy(png,file="plot3.png")
dev.off()
