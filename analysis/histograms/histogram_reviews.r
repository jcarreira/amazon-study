reviews <- scan("reviews_per_user", sep="\n")
pdf("histogram_reviews.pdf")

#hist(reviews, main="Histogram of reviews per user", xlab="# Reviews")
data <- hist(reviews, plot=FALSE)
print (data)
plot(data$count, log="y")
dev.off()
