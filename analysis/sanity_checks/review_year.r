data <- scan("review_year")

pdf("review_year.pdf")

hist(data, main="Histogram of Reviews per Year", xlab="Year", cex=0.3, cex.lab=1.5, cex.axis=1.5, cex.main=1.5, cex.sub=1.5)

dev.off()
