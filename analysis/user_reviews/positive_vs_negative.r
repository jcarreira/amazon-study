pdf("positive_vs_negative.pdf")

#data <- read.table("positive_negative_reviews", header=TRUE)
#data <- read.table("positive_fraction");
data <- scan("positive_fraction");

#plot (data$positive, data$negative, xlab="Positive (%)", ylab="Negative (%)")
hist(data, main="Histogram of Fraction of Positive Reviews",cex=0.3, cex.lab=1.3, cex.axis=1.3, cex.main=1.3, cex.sub=1.3)

#cor(data$score, data$lifetime)
dev.off()
