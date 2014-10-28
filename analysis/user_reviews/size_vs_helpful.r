pdf("size_vs_helpful.pdf")

data <- read.table("size_vs_helpful", header=TRUE)
#data <- read.table("positive_fraction");
#data <- scan("size_vs_helpful");

plot (data$size, data$helpfulness, xlab="Size (# words)", ylab="Helpfulness (%)", main="Size vs Helpfulness", pch=16,cex=0.3, cex.lab=1.3, cex.axis=1.3, cex.main=1.3, cex.sub=1.3)
#hist(data, main="Review Size vs Helpfulness")

#cor(data$size, data$helpfulness)
dev.off()
