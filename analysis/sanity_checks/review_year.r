data <- scan("review_year")

pdf("review_year.pdf")

hist(data, main="Histogram of Reviews per Year", xlab="Year")

dev.off()
