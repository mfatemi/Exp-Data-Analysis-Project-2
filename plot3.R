library(plyr) 
library(plyr) 
library(ggplot2)


#load data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# filter data using dplyr
BaltimoreData <- filter(NEI,fips == "24510")

#aggregate data
EmiByYear<-aggregate( Emissions ~ year+ type, data=BaltimoreData, FUN=sum)


## create png file
png("plot3.png", width = 480, height = 480)

gp<- ggplot(EmiByYear,aes(x=year, y=Emissions))  + geom_bar(stat="identity") +
    facet_grid(type~.) +
    labs(x="year", y=expression("Total PM"[2.5]*" Emission")) +
    labs(title=expression("PM"[2.5]*" Emissions, Baltimore City 1999-2008 by Source Type"))

print(gp)
##close file
dev.off()
