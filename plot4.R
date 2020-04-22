#prepare the date
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
#change date format
NEI$year <- as.list(NEI$year)


#plot4

library(ggplot2)
tempSCC <- SCC[grep('?Coal',SCC$Short.Name),]
tempplot4 <- merge(NEI,tempSCC,by.x = "SCC",by.y = "SCC",all=FALSE)
ggplot(tempplot4,aes(x=as.factor(year),y=Emissions))+geom_bar(stat="sum",width = 0.5)+ theme(legend.position = "none") +
  labs(title = "Coal related emissions across the U.S. from 1999-2008")+theme(plot.title = element_text(hjust = 0.5))+
  labs(x="year")

#Across the United States, how have emissions from coal combustion-related sources changed from 1999–2008?
#Decrease

#Copy plot to a png file and save
dev.copy(png,file="plot4.png")
dev.off()
