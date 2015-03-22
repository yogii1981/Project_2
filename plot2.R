# Loading the  RDS into Exploratory data in /Users/yogeshsharma/Documents/Data_Scientist/Exploratory_Data_Analysis/Project_2
# and open the terminal in Project_2
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Samples data for testing and sample Data:
NEIsample <- NEI[sample(nrow(NEI), size = 5000, replace = F), ]

# Subsets data and appends two years in one data frame
MD <- subset(NEI, fips == '24510')

png(filename = 'plot2.png')
barplot(tapply(X = MD$Emissions, INDEX = MD$year, FUN = sum), main = 'Total Emission in Baltimore City, MD', xlab = 'Year', ylab = expression('PM'[2.5]))
dev.off()
