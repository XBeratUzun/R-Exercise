data <- read.csv("World Trends Data.csv")

# Filter the data frame
data1960 <- data[data$Year==1960,]
data2013 <- data[data$Year==2013,]

# Check row counts
nrow(data1960) # 187 rows
nrow(data2013) # 187 rows. Equal split.

# Create the additionals dataframes
add1960 <- data.frame(Code=Country_Code, Life.Exp=Life_Expectancy_At_Birth_1960)
add2013 <- data.frame(Code=Country_Code, Life.Exp=Life_Expectancy_At_Birth_2013)

# Merge the pairs of dataframes
merged1960 <- merge(data1960, add1960, by.x="Country.Code", by.y="Code")
merged2013 <- merge(data2013, add2013, by.x="Country.Code", by.y="Code")

# Delete columns 
merged1960$Year <- NULL
merged2013$Year <- NULL

# Visualization
library(ggplot2)

# Visualize the datasets
qplot(data=merged1960, x=Fertility.Rate, y=Life.Exp,
      color=Region, size=I(5), alpha=I(0.6),
      main="Life Expectancy vs Fertility (1960)")

qplot(data=merged2013, x=Fertility.Rate, y=Life.Exp,
      color=Region, size=I(5), alpha=I(0.6),
      main="Life Expectancy vs Fertility (2013)")
