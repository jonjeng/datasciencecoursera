# Question: Of the four types of sources indicated by the type (point, nonpoint, onroad, nonroad) variable, which of these four sources have seen decreases in emissions from 1999–2008 for Baltimore City? Which have seen increases in emissions from 1999–2008? Use the ggplot2 plotting system to make a plot answer this question.
#
# The resulting figure shows that there were overall decreases in nonpoint, non-road, and on-road sources of pollution in Baltimore City. Emissions from point sources of pollution were not consistent but overall, an increase occurred.

# install.packages('gridExtra)
require(gridExtra)
require(ggplot2)
require(scales)

# First read in the data that will be used and store it in the variable NEI
NEI <- readRDS("summarySCC_PM25.rds")

# Subset NEI, extracting only measurements taken in Baltimore City, Maryland and convert the column 'type' into a vector of factors
bdata <- NEI[NEI['fips']=='24510', 4:6]
bdata[,2] <- as.factor(bdata$type)
bdata[,3] <- as.factor(bdata$year)

# Plot the results. The following plots all have y-axis limits decreased substantially, removing one or more outliers, in order to better see differences at the arguably more telling levels
ldata <- split(bdata, bdata$type)
plot1 <- ggplot(ldata[[1]], aes(x=year, y=Emissions)) + geom_boxplot() + coord_cartesian(ylim=c(0,400)) + ggtitle('Nonpoint Sources') + theme(plot.title = element_text(hjust = 0.5, size=11))
plot2 <- ggplot(ldata[[2]], aes(x=year, y=Emissions)) + geom_boxplot() + coord_cartesian(ylim=c(0,12)) + ggtitle('Non-Road Sources') + theme(plot.title = element_text(hjust = 0.5, size=11))
plot3 <- ggplot(ldata[[3]], aes(x=year, y=Emissions)) + geom_boxplot() + coord_cartesian(ylim=c(0,6)) + ggtitle('On-Road Sources') + theme(plot.title = element_text(hjust = 0.5, size=11))
plot4 <- ggplot(ldata[[4]], aes(x=year, y=Emissions)) + geom_boxplot() + coord_cartesian(ylim=c(0,100)) + ggtitle('Point Sources') + theme(plot.title = element_text(hjust = 0.5, size=11))
grid.arrange(plot1, plot2, plot3, plot4, ncol=4, top='Total PM2.5 Emissions In Baltimore City, Maryland from 1999 to 2008')

# Obtain a .png file of the plot
dev.copy(png, 'figure3.png', width=640)
dev.off()

# The following plot does not have axes modified to render outliers nonvisible. This is left for reference
# ggplot(bdata, aes(x=year, y=Emissions)) + geom_boxplot() + facet_wrap(~type, scales='free') + ggtitle('Total Emissions from PM2.5 in Baltimore City, Maryland from 1999 to 2008') + theme(plot.title = element_text(hjust = 0.5))