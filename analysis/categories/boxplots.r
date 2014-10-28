pdf("life_expectancy_category_boxplot.pdf")

data <-read.table("boxplot_data3", header=FALSE, fill=TRUE, colClasses=rep(NA, max(count.fields("boxplot_data3"))))

#summary(data)

#df <- as.data.frame(t(data))
data <- t(data)
#dim(data)
#dim(t(data))
#summary (t(data))

boxplot(data, outline=FALSE, main="Boxplot of Life Expectancy of Products by Category", xlab="Category", ylab="Life Expectancy (# days)", cex=0.3, cex.lab=1.3, cex.axis=1.3, cex.main=1.3, cex.sub=1.3)

dev.off()
