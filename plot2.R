library(dplyr)
library(plyr) 
library(ggplot2)



#load data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# filter data using dplyr
BaltimoreData <- filter(NEI,fips == "24510")

# aggregate data 
EmiByYear<-aggregate( Emissions ~ year, data=BaltimoreData, FUN=sum)



## create png file
png("plot2.png", width = 480, height = 480)

plot(EmiByYear$year, EmiByYear$Emissions,xlab="Year",ylab=expression("Total PM"[2.5]*" Emission"),main=" total emissions from PM2.5  in the Baltimore City");



##close file
dev.off()

