data <- scan("reviews_cluster_data2", sep="\n")

pdf("review_cluster_data.pdf")

plot(1:12, data, type="l", main="Normalized Number of Reviews per Year After First Review", xlab="Year After First Review", ylab="Normalized Number of Reviews",cex=0.3, cex.lab=1.3, cex.axis=1.3, cex.main=1.3, cex.sub=1.3)
