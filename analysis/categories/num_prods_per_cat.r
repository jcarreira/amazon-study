data <- read.table("num_prods_per_cat2", header=TRUE)

pdf("num_prods_per_cat.pdf")


par(mar = c(13, 6, 2, 2) ,mgp=c(5,1,0)) #add room for the rotated labels

#barplot(1:nrow(data))#, data$count)
#data
#data <- t(data)
#    data

par(las=2)
barplot(ylab="Product Count", data$count, names.arg=data$category)#, data$count)
#text(cex=1, x=x-.25, y=-1.25, data$category, xpd=TRUE, srt=90)
#axis(1, at=1:59, labels=data$category)
#text(cex=1, x=x-.25, y=-1.25, labs, xpd=TRUE, srt=45)

#x <- barplot(table(data$count), xaxt="n")
#labs <- paste(names(table(data$count)), data$category)
#text(cex=1, x=x-.25, y=-1.25, labs, xpd=TRUE, srt=90)

dev.off()
