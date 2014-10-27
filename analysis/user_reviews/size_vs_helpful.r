pdf("size_vs_helpful.pdf")

data <- read.table("size_vs_helpful", header=TRUE)
#data <- read.table("positive_fraction");
#data <- scan("size_vs_helpful");

plot (data$size, data$helpfulness, xlab="Size (# words)", ylab="Helpfulness (%)", main="Size vs Helpfulness")
#hist(data, main="Review Size vs Helpfulness")

#cor(data$size, data$helpfulness)
dev.off()
