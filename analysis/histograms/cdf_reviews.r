reviews <- scan("reviews_per_user", sep="\n")
#reviews <- read.table("reviews_per_user")
pdf("cdf_reviews.pdf")

#reviews
#data = hist(reviews$score, plot=F)
#data
#data_counts = log10(data$counts)
#data
#replace(data_counts, data_counts<=0.0, 1)
#plot(1:26, data_counts, ylab='log10(Frequency)')

cdf_data <-ecdf(reviews)
#summary(cdf_data)
plot(cdf_data, log="x", xlim=c(1, 1e3), main="CDF of # Reviews per User", xlab="# Reviews", ylab="CDF", cex=0.3, cex.lab=1.3, cex.axis=1.3, cex.main=1.3, cex.sub=1.3)

#plot.ecdf(reviews, main="CDF of Reviews per User", xlab="# Reviews", ylab="CDF", cex=0.3, cex.lab=1.3, cex.axis=1.3, cex.main=1.3, cex.sub=1.3)#

#hist(reviews, main="Histogram of reviews per user", xlab="# Reviews")
#data <- hist(reviews, plot=FALSE)
#print (data)
#plot(data$count, log="y")
dev.off()