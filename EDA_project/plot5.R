# Question: How have emissions from motor vehicle sources changed from 1999–2008 in Baltimore City?
#
# The resulting plots show that emissions from motor vehicle sources in Baltimore City have decreased from 1999 to 2008. The first subplot shows that total emissions have decreased substantially, whereas the second subplot shows that in addition, variance in measurement has decreased dramatically.

# Note: any "Mobile" emissions source (e.g., non-road equipment and aircraft) is assumed to be a motor vehicle

# install.packages('gridExtra)
require(gridExtra)
require(ggplot2)
require(scales)

# Read the given data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")[,c(1,4)]

# Extract measurements of emissions from "Mobile" sources
mv_sources <- SCC[grepl('Mobile', as.character(SCC$EI.Sector)),1]
n2 <- NEI[NEI[,'SCC'] %in% mv_sources,]
n2[,'year'] <- as.factor(n2[,'year'])

# Create a data frame with the sum of emissions per year
ytotals <- tapply(n2$Emissions, n2$year, sum)
ytotals <- data.frame(Years=as.numeric(names(ytotals)), Emissions=ytotals)
ytotals[,1] <- as.factor(ytotals[,1])

# Plot the results and obtain a .png file of these. The y values in the second subplot exceed 1, at times, because the values are approximate probability densities
plot1 <- ggplot(ytotals, aes(Years, Emissions)) + geom_bar(stat='identity', fill='#222991') + ggtitle('Total Per Year') + theme(plot.title = element_text(hjust = 0.5, size=10)) + scale_y_continuous(labels = comma) + coord_cartesian(ylim=range(ytotals$Emissions))
plot2 <- ggplot(n2, aes(x=Emissions, color=year)) + geom_density() + scale_x_log10() + ggtitle('Individual Data') + theme(plot.title = element_text(hjust = 0.5, size=10)) + ylab("Approximate Probability Density")

grid.arrange(plot1, plot2, ncol=2, top='PM2.5 Emissions from Motor Vehicle Sources in Baltimore City (1999-2008)')

dev.copy(png, 'plot5.png', width=640)
dev.off()
