# Question: Have total emissions from PM2.5 decreased in the Baltimore City, Maryland (fips == "24510") from 1999 to 2008? Use the base plotting system to make a plot answering this question.
#
# The resulting figure shows that yes, the total emissions from Pm2.5 have decreased in Baltimore City, Maryland from 1999 to 2008. The sum of emissions does not monotonically decrease but overall, there is a substantial decrease in emissions totals over the period.

# First read in the data that will be used and store it in the variable NEI
NEI <- readRDS("summarySCC_PM25.rds")

# Subset NEI, extracting only measurements taken in Baltimore City, Maryland
bdata <- NEI[NEI['fips']=='24510', c(4,6)]

# Calculate the sums of emission measurements per year using tapply and sum()
btotals <- tapply(bdata$Emissions, bdata$year, sum)

# Plot the results on a background that provides contrast
par(bg='#F7FBFB')
barplot(btotals, col='#222991', xlab='Year', ylab='Total Emissions', main='Total Emissions from PM2.5 in Baltimore City, Maryland from 1999 to 2008')

dev.copy(png, 'figure2.png', width=640, height=480)
dev.off()
