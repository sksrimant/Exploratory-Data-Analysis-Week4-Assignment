setwd("C:/Users/srimasr/Desktop/Cousera/Assignment/Exploratory_Analysis/Week4 Assignment/Files")




# Reading the source files and filtering only the Baltimore data.
NEI <- readRDS("summarySCC_PM25.rds")
NEI_FLIP_24510 = subset(NEI,NEI$fips ==24510)

# Aggregating the Emmission data  and Year level
NEI_agg <- aggregate(NEI_FLIP_24510$Emissions, by=list(NEI_FLIP_24510$year), FUN= sum)


# Plotting the graph use Base Plotting System
barplot(NEI_agg[,2], width = .2, space = NULL,names.arg = c("1999","2002","2005","2008"),
        legend.text = NULL, beside = FALSE,
        horiz = FALSE, density = NULL, angle = 45,
        col = NULL, border = par("fg"),
        main = "Baltimore City Emmission/YR", sub = NULL, xlab = "Source", ylab = "Emission",
        xlim = NULL, ylim = c(0,max(NEI_agg[,2])), xpd = TRUE, log = "",
        axes = TRUE, axisnames = TRUE,
        cex.axis = par("cex.axis"), cex.names = par("cex.axis"),
        inside = TRUE, plot = TRUE, axis.lty = 0, offset = 0,
        add = FALSE, args.legend = NULL)


# Saving the graph in PNG.
dev.copy(png,file= "Plot2.png")
dev.off()



