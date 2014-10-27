prices <- scan("product_price")
pdf("histogram_prices.pdf")
hist(prices, main="Histogram of Product Prices", xlab="Price")
dev.off()
