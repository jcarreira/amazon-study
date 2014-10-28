prices <- scan("product_price")
pdf("cdf_prices.pdf")

#prices[prices > 0]
#prices2 = prices[t]

plot.ecdf(xlim=c(1, 1e4), prices[prices>0.0], main="CDF of Product Prices", xlab="Price ($)", ylab="CDF", log="x", cex=0.3, cex.lab=1.3, cex.axis=1.3, cex.main=1.3, cex.sub=1.3)
dev.off()
