data <- scan("review_decay_data", sep="\n")

pdf("review_decay_data.pdf")

plot(1:19, data, type="l", main="Average Score per Year After First Review", xlab="Year After First Review", ylab="Normalized Average Score",cex=0.3, cex.lab=1.3, cex.axis=1.3, cex.main=1.3, cex.sub=1.3)
