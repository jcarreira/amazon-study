data <- scan("lifetime_data")
pdf("cdf_lifespan.pdf")

#hist(data, main="Histogram of Product Lifetime", xlab="# Days")

plot.ecdf(data, main="CDF of Product Life Span", xlab="Time (Days)", ylab="CDF")
dev.off()
