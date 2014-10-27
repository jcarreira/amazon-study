data <- scan("users_lifetime2")
pdf("users_lifetime.pdf")

hist(data, main="Histogram of Users Lifetime", xlab="# Days")
dev.off()
