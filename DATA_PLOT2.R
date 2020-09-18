# Set up plots
layout(matrix(c(1,2,1,2), 2, 2, byrow=T))

# barplot of total injuries by event type
total_injuries <- by(storm$INJURIES, storm$EVTYPE, sum)

par(mar=c(5, 12, 4, 2))
barplot(sort(by(storm$INJURIES, storm$EVTYPE, sum), decreasing=T)[20:1], horiz=T, las=1, cex.names=0.7, xlab="Total Number of Injuries Per Event Type")
mtext("Total Number of Injuries By Event Type (top 20)", side=3, line=1, cex=1, at=30000, font=2)


# barplot of top mean injuries per event
mean_injuries <- by(storm$INJURIES, storm$EVTYPE, mean)

par(mar=c(5, 12, 4, 2))
barplot(sort(by(storm$INJURIES, storm$EVTYPE, mean), decreasing=T)[20:1], horiz=T, las=1, cex.names=0.7, xlab="Mean Number of Injuries Per Event")
mtext("Mean Number of Injuries Per Event (top 20)", side=3, line=1, cex=1, at=20, font=2)

layout(matrix(c(1,2,1,2), 2, 2, byrow=T))

# Plotting total damage
total_damage <- by(dmg$PROPandCROP/10e9, dmg$EVTYPE, sum)

par(mar=c(5, 12, 4, 2))
barplot(sort(by(dmg$PROPandCROP/10e9, dmg$EVTYPE, sum), decreasing=T)[20:1], horiz=T, las=1, cex.names=0.7, xlab="Total Cost of Damage By Event Type (Billions of Dollars)")
mtext("Total Cost of Damage By Event Type (top 20)", side=3, line=1, cex=1.5, at=4, font=2)



# Ploting Per event damage
mean_damage <- by(dmg$PROPandCROP/10e6, dmg$EVTYPE, mean)

par(mar=c(5, 12, 4, 2))
barplot(sort(by(dmg$PROPandCROP/10e6, dmg$EVTYPE, mean), decreasing=T)[20:1], horiz=T, las=1, cex.names=0.7, xlab="Cost of Damage Per Event (Millions of Dollars)")
mtext("Cost of Damage Per Event (top 20)", side=3, line=1, cex=1.5, at=50, font=2)