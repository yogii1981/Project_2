# Loading the  RDS into Exploratory data in /Users/yogeshsharma/Documents/Data_Scientist/Exploratory_Data_Analysis/Project_2
# and open the terminal in Project 2
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Samples data for testing purpose
NEIsample <- NEI[sample(nrow(NEI), size = 1000, replace = F), ]

# Aggregates of Emissions and Emissions$PM
Emissions <- aggregate(NEI[, 'Emissions'], by = list(NEI$year), FUN = sum)
Emissions$PM <- round(Emissions[, 2] / 1000, 2)

png(filename = "plot1.png")
barplot(Emissions$PM, names.arg = Emissions$Group.1, main = expression('Total Emission of PM'[2.5]), xlab = 'Year', ylab = expression(paste('PM', ''[2.5], ' in Kilotons')))
dev.off()
