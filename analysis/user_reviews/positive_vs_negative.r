pdf("positive_vs_negative.pdf")

#data <- read.table("positive_negative_reviews", header=TRUE)
#data <- read.table("positive_fraction");
data <- scan("positive_fraction");

#plot (data$positive, data$negative, xlab="Positive (%)", ylab="Negative (%)")
hist(data, main="Histogram of fraction of positive reviews")

#cor(data$score, data$lifetime)
dev.off()
