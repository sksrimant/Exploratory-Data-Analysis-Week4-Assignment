setwd("C:/Users/srimasr/Desktop/Cousera/Assignment/Exploratory_Analysis/Files")
# Reading the file

NEI <- readRDS("summarySCC_PM25.rds")

# Filtering only the Baltimore City data
NEI_Flip = subset(NEI,NEI$fips == 24510)

#Aggregating the data for Year and Type
NEI_year_type <- aggregate(NEI$Emissions, by=list(NEI$year,NEI$type), FUN= sum)

# Performing Order By
NEI_year_type_order <- NEI_year_type[order(NEI_year_type$Group.1,NEI_year_type$Group.2),] 


# Column Aliasing
colnames(NEI_year_type_order)[1] <- "Year"
colnames(NEI_year_type_order)[2] <- "Type"
colnames(NEI_year_type_order)[3] <- "Emmission"

# Performing Plotting
ggplot(NEI_year_type_order,aes(x=NEI_year_type_order$Year,y=NEI_year_type_order$Emmission, fill=Type))+ geom_bar(position='dodge',stat="identity")+ scale_x_continuous(breaks=c(1999,2002,2005,2008))+ggtitle(" Baltimore City Emmission Analysis")+ xlab("Year") + ylab("Emmission")

# Copying the Plot to PNG file
dev.copy(png,file= "Plot3.png")
dev.off()

#+scale_y_continuous(breaks=c(200000000,40000000,60000000,80000000))
# Proper Y axis scaling is required.


