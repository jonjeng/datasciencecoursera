# Question: Across the United States, how have emissions from coal combustion-related sources changed from 1999–2008?
#
# The resulting figure shows that while total emissions from coal combustion-related sources have decreased from 1999 to 2008, though the individual measurements have, for the most part, worsened.

#install.packages('gridExtra')
require(gridExtra)
require(ggplot2)
require(scales)

# Read the given data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")[,c(1,4)]

# Extract from NEI only measurements from coal combustion-related sources
cc_sources <- SCC[grepl('[Cc]oal', as.character(SCC[,2])),1]
n2 <- NEI[NEI[,'SCC'] %in% cc_sources,]
n2[,6] <- as.factor(n2[,6])

# Calculate the total emissions per year
ctotals <- tapply(n2$Emissions, n2$year, sum)
ctotals <- data.frame(Years=as.factor(names(ctotals)), Emissions=as.vector(ctotals))

# Plot of total emissions, which are shown to drastically decrease from 1999 to 2008
plot1 <- ggplot(ctotals, aes(Years, Emissions)) + geom_bar(stat='identity', width=.5, fill='#222991') + coord_cartesian(ylim=c(300000,600000)) + scale_y_continuous(labels = comma)

# However, the following show that individual measurements do appear to have increased. While total emissions have decreased, the emitters have, for the most part, worsened.
plot2 <- ggplot(n2, aes(x=Emissions, color=year)) + geom_density(aes(y=..scaled..)) + scale_x_log10() + theme(plot.title = element_text(hjust = 0.5, size=10)) + ylab("Approximate Probability Density")

plot3 <- ggplot(n2, aes(y=Emissions, x=year)) + geom_boxplot() + theme(plot.title = element_text(hjust = 0.5, size=10)) + coord_cartesian(ylim=c(0,25))

grid.arrange(plot1, plot2, plot3, ncol=3, top='PM2.5 Emissions From Coal Combustion-Related Sources In Baltimore City, Maryland (1999-2008)')

dev.copy(png, 'figure4.png', width=960, height=640)
dev.off()
