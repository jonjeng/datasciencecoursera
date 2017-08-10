# Question: Have total emissions from PM2.5 decreased in the United States from 1999 to 2008? Using the base plotting system, make a plot showing the total PM2.5 emission from all sources for each of the years 1999, 2002, 2005, and 2008.
#
# This plot shows that yes, it appears that total emissions from PM2.5 have decreased in the United States from 1999 to 2008. The numerical sum of emissions measurements decreases substantially each year, despite more measurements being recorded each year. The latter can be seen from the fact that the number of rows (observations) increases year over year, as can be seen from running table(NEI$year).

# First read in the data that will be used and store it in the variable NEI
NEI <- readRDS("summarySCC_PM25.rds")

# Calculate the sum of emission measurements per year using tapply and sum()
totals <- tapply(NEI$Emissions, NEI$year, sum)

# Plot the results on a background that provides contrast
barplot(totals, col='#222991', xlab='Year', ylab='Total Emissions', main='Total Emissions from PM2.5 in the U.S. from 1999 to 2008', yaxt ='n')
yTicks = axTicks(2)
axis(2, at = yTicks, labels = formatC(yTicks, format = 'd'))

dev.copy(png, 'plot1.png', height=960)
dev.off()
