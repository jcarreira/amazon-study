data <- scan("users_lifetime")
pdf("users_lifetime.pdf")

hist(data, main="Histogram of Users Life Span", xlab="Time (Days)",cex=0.3, cex.lab=1.3, cex.axis=1.3, cex.main=1.3, cex.sub=1.3)
dev.off()
