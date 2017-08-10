# Question: Compare emissions from motor vehicle sources in Baltimore City with emissions from motor vehicle sources in Los Angeles County, California (fips == "06037"). Which city has seen greater changes over time in motor vehicle emissions?
#
# The resulting plot shows that emissions from motor vehicle sources in Baltimore City have decreased overall while those in Los Angeles County have increased overall. However, measurements in Baltimore City were superior in intermediate years. Notably, from 2002 to 2005, measurements wer similar except more lower measurements were made in 2002. In Los Angeles County, measurements were far worse in intermediate years. While the overall measurement of PM2.5 emissions in 2008 is higher than that of 1999, the measurement is an improvement over those made in 2002 and 2005. Finally, we see that while the PM2.5 emissions from motor vehicle sources in Baltimore City improved and those in Los Angeles County have worsened, the raw measurement of emissions in Los Angeles is far greater so the absolute change in emissions in Los Angeles County is both larger and more significant.

# install.packages('gridExtra)
require(gridExtra)
require(ggplot2)
require(scales)

# Read the given data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")[,c(1,4)]

# Extract measurements of emissions from motor vehicle sources and calculate total emissions by year
mv_sources <- SCC[grepl('Mobile', as.character(SCC$EI.Sector)),1]
bcE <- NEI[NEI['fips']=='24510', c(2,4,6)]
bcE <- subset(bcE, SCC %in% mv_sources)
bcE$City <- "Baltimore.City"
bcE1 <- tapply(bcE$Emissions, bcE$year, sum)
for (i in 4:2) {
    bcE1[i] <- bcE1[i] - bcE1[i-1]
}
bcE1 <- bcE1[-1]
laE <- NEI[NEI['fips']=='06037', c(2,4,6)]
laE <- subset(laE, SCC %in% mv_sources)
laE$City <- "LA.County"
laE1 <- tapply(laE$Emissions, laE$year, sum)
for (i in 4:2) {
    laE1[i] <- laE1[i] - laE1[i-1]
}
laE1[-1]

# Merge the results and plot them
df <- data.frame(rbind(bcE, laE))
df[,'year'] <- as.factor(df[,'year'])
plot1 <- ggplot(df, aes(x=Emissions, color=year)) + geom_density() + scale_x_log10() + facet_grid(.~City) + ggtitle('PM2.5 Emissions from Motor Vehicle Sources in Baltimore City and LA County') + theme(plot.title = element_text(hjust = 0.5)) + ylab("Approximate Probability Density")

df1 <- data.frame(Year=rep(as.factor(c('1999-2002', '2002-2005', '2005-2008')),2), City=c(rep('Baltimore.City',3), rep('LA.County',3)), Change.In.Emissions=c(as.vector(bcE1), as.vector(laE1)))
plot2 <- ggplot(df1, aes(Year, Emissions)) + geom_bar(stat='identity', width=.5) + ggtitle('PM2.5 Emissions from Motor Vehicle Sources in Baltimore City and LA County') + theme(plot.title = element_text(hjust = 0.5)) + facet_wrap(~City, scales='free')

plot3 <- ggplot(df1, aes(Year, Emissions, fill=City)) + geom_bar(stat='identity', width=.5, position='dodge') + ggtitle('PM2.5 Emissions from Motor Vehicle Sources in Baltimore City and LA County') + theme(plot.title = element_text(hjust = 0.5))

grid.arrange(plot1, plot2, plot3, nrow=3)

dev.copy(png, 'plot6.png', width=640, height=960)
dev.off()
