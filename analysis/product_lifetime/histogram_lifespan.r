data <- scan("lifetime_data")
pdf("lifetime_data.pdf")

hist(data, main="Histogram of Product Lifetime", xlab="# Days")
dev.off()
