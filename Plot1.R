
setwd("C:/Users/srimasr/Desktop/Cousera/Assignment/Exploratory_Analysis/Week4 Assignment/Files")

# Reading the source files
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Aggregating the Emmission by year
NEI_agg <- aggregate(NEI$Emissions, by=list(NEI$year), FUN= sum)

# Plotting the Gragh using Base Plotting 
barplot(NEI_agg[,2], width = .2, space = NULL,names.arg = c("1999","2002","2005","2008"),
        legend.text = NULL, beside = FALSE,
        horiz = FALSE, density = NULL, angle = 45,
        col = NULL, border = par("fg"),
        main = "Emission/YR", sub = NULL, xlab = "Source", ylab = "Emission",
        xlim = NULL, ylim = NULL, xpd = TRUE, log = "",
        axes = TRUE, axisnames = TRUE,
        cex.axis = par("cex.axis"), cex.names = par("cex.axis"),
        inside = TRUE, plot = TRUE, axis.lty = 0, offset = 0,
        add = FALSE, args.legend = NULL)

# Saving the graph in PNG
dev.copy(png,file= "Plot1.png")
dev.off()







#NEI1999 = subset(NEI,NEI$year==1999)
#NEI2002 = subset(NEI,NEI$year==2002)
#NEI2005 = subset(NEI,NEI$year==2005)
#NEI2008 = subset(NEI,NEI$year==2008)


