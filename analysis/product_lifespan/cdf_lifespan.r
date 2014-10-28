data <- scan("lifetime_data")
pdf("cdf_lifespan.pdf")

#hist(data, main="Histogram of Product Lifetime", xlab="# Days")

plot.ecdf(data, main="CDF of Product Life Span", xlab="Time (Days)", ylab="CDF", cex=0.3, cex.lab=1.3, cex.axis=1.3, cex.main=1.3, cex.sub=1.3)
dev.off()
