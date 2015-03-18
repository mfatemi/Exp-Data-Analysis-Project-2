library(plyr) 
library(ggplot2)



#load data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# aggregate data by year
EmiByYear<-aggregate( Emissions ~ year, data=NEI, FUN=sum)


## create png file
png("plot1.png", width = 480, height = 480)


plot(EmiByYear$year, EmiByYear$Emissions,xlab="Year",ylab=expression("Total PM"[2.5]*" Emission"),main=" total PM2.5 emission from all sources");

##close file
dev.off()

