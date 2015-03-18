library(plyr) 
library(plyr) 
library(ggplot2)


#load data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#filter SSC


SSCfiltered <-  filter(SCC, grepl("comb", SCC.Level.One, ignore.case=TRUE) & grepl("coal", SCC.Level.Four, ignore.case=TRUE))
NEIfiltered <- NEI[NEI$SCC %in% SSCfiltered$SCC,]



## create png file
png("plot4.png", width = 600, height = 480)

gp<- ggplot(NEIfiltered,aes(x=factor(year), y=Emissions))  + geom_bar(stat="identity") +
   
    labs(x="year", y=expression("Total PM"[2.5]*" Emission")) +
    labs(title=expression("PM"[2.5]*" Coal Combustion Source Emissions Across US from 1999-2008"))

print(gp)
##close file
dev.off()
