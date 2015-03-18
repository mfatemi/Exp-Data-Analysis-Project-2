library(plyr) 
library(plyr) 
library(ggplot2)


#load data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#filter vehicales
SSCfiltered <-  filter(SCC, grepl("vehicles", SCC.Level.Two, ignore.case=TRUE))
NEIfiltered <- NEI[NEI$SCC %in% SSCfiltered$SCC,]

# filter data using dplyr
BaltimoreData <- filter(NEIfiltered,fips == "24510")



## create png file
png("plot5.png", width = 600, height = 480)

gp<- ggplot(BaltimoreData,aes(x=factor(year), y=Emissions))  + geom_bar(stat="identity") +
   
    labs(x="year", y=expression("Total PM"[2.5]*" Emission")) +
    labs(title=expression("PM"[2.5]*" Motor Vehicle Source Emissions in Baltimore from 1999-2008"))

print(gp)
##close file
dev.off()
