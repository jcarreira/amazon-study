prices <- scan("product_price")
pdf("cdf_prices.pdf")

prices[prices > 0]
#prices2 = prices[t]

plot.ecdf(xlim=c(1, 1e4), prices[prices>0.0], main="CDF of Product Prices", xlab="Price ($)", ylab="CDF", log="x")
dev.off()
