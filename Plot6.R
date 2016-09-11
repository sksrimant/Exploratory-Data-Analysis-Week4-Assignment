

setwd("C:/Users/srimasr/Desktop/Cousera/Assignment/Exploratory_Analysis/Week4 Assignment/Files")

# Reading the files 
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")


# Filtering only the Baltimore City data
NEI_fip  = subset(NEI,NEI$fips == "24510"|NEI$fips == "06037")

NEI_fip$fips[NEI_fip$fips == "24510"] <- "Baltimore"
NEI_fip$fips[NEI_fip$fips == "06037"] <- "Los Angeles"


# Filtering only the Motor Vechicle related data.
SCC_Motor_Vechile = SCC[grep("On-Road",SCC$EI.Sector),]

# Joining to get only Motor Vechicle related data.
NEI_Motor_Vechile <- merge(NEI_fip,SCC_Motor_Vechile)

#  Aggregating the data to find only the total emmission per Year
NEI_Motor_Vechile_aggr <- aggregate(NEI_Motor_Vechile$Emissions, by=list(NEI_Motor_Vechile$year,NEI_Motor_Vechile$fips), FUN= sum)


# Column  aliasing 
colnames(NEI_Motor_Vechile_aggr)[1] <- "Year"
colnames(NEI_Motor_Vechile_aggr)[2] <- "Fips"
colnames(NEI_Motor_Vechile_aggr)[3] <- "Emmission"



# Ploting the graph
library(ggplot2)
ggplot(data=NEI_Motor_Vechile_aggr,aes(x=NEI_Motor_Vechile_aggr$Year,y=NEI_Motor_Vechile_aggr$Emmission,fill= Fips))+geom_bar(position='dodge',stat="identity")+ scale_x_continuous(breaks=c(1999,2002,2005,2008))+ggtitle(" Baltimore Vs Los Angeles ")+ xlab("Year") + ylab("Emmission")



# Copying the Plot to PNG file
dev.copy(png,file= "Plot6.png")
dev.off()




