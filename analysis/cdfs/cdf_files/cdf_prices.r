pdf("cdf_category_prices.pdf")

data1 <-scan("1")
data2 <-scan("2")
data3 <-scan("3")
data4 <-scan("4")
data5 <-scan("5")
data6 <-scan("6")
data7 <-scan("7")
data8 <-scan("8")
data9 <-scan("9")
data10 <-scan("10")
#data <- t(data)

#summary(data)

#data <- data.frame(data)

plot.ecdf(data1, main="CDF of Product Prices By Category", xlab="Price")
plot.ecdf(data2, main="CDF of Product Prices By Category", xlab="Price")
plot.ecdf(data3, main="CDF of Product Prices By Category", xlab="Price")
plot.ecdf(data4, main="CDF of Product Prices By Category", xlab="Price")
plot.ecdf(data5, main="CDF of Product Prices By Category", xlab="Price")
plot.ecdf(data6, main="CDF of Product Prices By Category", xlab="Price")


dev.off()


