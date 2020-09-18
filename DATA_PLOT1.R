# Importing Data
storm <- read.csv('/Users/joe/Downloads/repdata-data-StormData.csv.bz2', header=T)

# Duplicate dataset
dmg <- storm

# Changing invalid PROPDMGEXP and CROPDMGEXP to 0
dmg$PROPDMGEXP <- ifelse(dmg$PROPDMGEXP %in% c("B", "h", "H", "K", "m", "M"),  as.character(dmg$PROPDMGEXP), "NONE")
dmg$CROPDMGEXP <- ifelse(dmg$CROPDMGEXP %in% c("B", "k", "K", "m", "M"),  as.character(dmg$CROPDMGEXP), "NONE")

# Multiplying PROPDMG by factor of 10 based on EXP letter
dmg$PROPDMG <- dmg$PROPDMG * (10^9 * (dmg$PROPDMGEXP == "B") + 10^6 *(dmg$PROPDMGEXP %in% c("m", "M")) + 10^3 * (dmg$PROPDMGEXP %in% c("k", "K")) + 100 * (dmg$PROPDMGEXP %in% c("h", "H")))

dmg$CROPDMG <- dmg$CROPDMG * (10^9 * (dmg$CROPDMGEXP == "B") + 10^6 *(dmg$CROPDMGEXP %in% c("m", "M")) + 10^3 * (dmg$CROPDMGEXP %in% c("k", "K")) + 100 * (dmg$CROPDMGEXP %in% c("h", "H")))

# Making combination of PROP and CROP damage
dmg$PROPandCROP <- dmg$PROPDMG + dmg$CROPDMG

# Get total number of fatalites (by event type)
total_fatalities <- by(storm$FATALITIES, storm$EVTYPE, sum)

# Set up plots
layout(matrix(c(1,2,1,2), 2, 2, byrow=T))

# barplot of total fatalities by event type

par(mar=c(5, 12, 4, 2))
barplot(sort(by(storm$FATALITIES, storm$EVTYPE, sum), decreasing=T)[20:1], horiz=T, las=1, cex.names=0.7, xlab="Total Number of Fatalities Per Event Type")
mtext("Total Number of Fatalities By Event Type (top 20)", side=3, line=1, cex=1, at=1500, font=2)

# Get average number of fatalities per event (by event type) For top 20
mean_fatalities <- by(storm$FATALITIES, storm$EVTYPE, mean)

# barplot of top mean fatalities per event
par(mar=c(5, 12, 4, 2))
barplot(sort(by(storm$FATALITIES, storm$EVTYPE, mean), decreasing=T)[20:1], horiz=T, las=1, cex.names=0.7, xlab="Mean Number of Fatalities Per Event")
mtext("Mean Number of Fatalities Per Event (top 20)", side=3, line=1, cex=1, at=8, font=2)