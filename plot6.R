library(plyr) 
library(plyr) 
library(ggplot2)


#load data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#filter vehicales
SSCfiltered <-  filter(SCC, grepl("vehicles", SCC$EI.Sector, ignore.case=TRUE))
NEIfiltered <- NEI[NEI$SCC %in% SSCfiltered$SCC,]

# filter data using dplyr
filteredData <- filter(NEIfiltered,fips %in% c("24510",  "06037"))

# add a new column city  / with deplyr it would be easier
filteredData$city <- rep(NA, nrow(filteredData))
# set city values ( no join)
filteredData[filteredData$fips == "06037", ][, "city"] <- "Los Angles County"
filteredData[filteredData$fips == "24510", ][, "city"] <- "Baltimore City"

#aggregate data by year and city
filteredData<-aggregate( Emissions ~ year+ city, data=filteredData, FUN=sum)


## create png file
png("plot6.png", width = 700, height = 480)

gp<- ggplot(filteredData,aes(x=year, y=Emissions,  colour=city)) +
    geom_point() + 
    geom_smooth(method="loess")+
    labs(x="year", y=expression("Total PM"[2.5]*" Emission")) +
    labs(title=expression("PM"[2.5]*" Motor Vehicle Source Emissions in  LA & Baltimore from 1999-2008"))

print(gp)
##close file
dev.off()

