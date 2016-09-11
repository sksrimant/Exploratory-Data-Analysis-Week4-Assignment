setwd("C:/Users/srimasr/Desktop/Cousera/Assignment/Exploratory_Analysis/Week4 Assignment/Files")

# Reading the files 
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Filtering only the coal related data.
SCC_coal = SCC[grep("Coal",SCC$EI.Sector),]

# Joining to get only the coal related data.
NEI_Coal <- merge(NEI,SCC_coal)

#  Aggregating the data to find only the total emmission per Year
NEI_Coal <- aggregate(NEI_Coal$Emissions, by=list(NEI_Coal$year), FUN= sum)


# Column  aliasing 
colnames(NEI_Coal)[1] <- "Year"
colnames(NEI_Coal)[2] <- "Emmission"


# Ploting the graph
library(ggplot2)
ggplot(data=NEI_Coal,aes(x=NEI_Coal$Year,y=NEI_Coal$Emmission))+geom_bar(stat="identity",position='dodge')+ scale_x_continuous(breaks=c(1999,2002,2005,2008))+ggtitle(" United States Coal Emmission Analysis")+ xlab("Year") + ylab("Emmission")


# Copying the Plot to PNG file
dev.copy(png,file= "Plot4.png")
dev.off()
