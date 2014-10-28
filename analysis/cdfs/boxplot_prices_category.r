pdf("prices_per_category.pdf")

data <-read.table("category_prices", header=FALSE, fill=TRUE, colClasses=rep(NA, max(count.fields("category_prices"))))

#summary(data)

#df <- as.data.frame(t(data))
data <- t(data)
#dim(data)
#dim(t(data))
#summary (t(data))

boxplot(data, outline=FALSE, main="Boxplot of Price of Products by Category", xlab="Category", ylab="Price ($)", cex=0.3, cex.lab=1.3, cex.axis=1.3, cex.main=1.3, cex.sub=1.3)

dev.off()
