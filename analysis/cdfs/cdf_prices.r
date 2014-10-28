pdf("cdf_category_prices.pdf")

data <-read.table("category_prices", header=FALSE, fill=TRUE, colClasses=rep(NA, max(count.fields("category_prices"))))
data <- t(data)

#summary(data)

data <- data.frame(data)

plot.ecdf(data$V57, main="CDF of Product Prices By Category", xlab="Price")
dev.off()


