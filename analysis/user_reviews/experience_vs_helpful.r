pdf("experience_vs_helpful.pdf")

data <- read.table("experience_vs_helpful_data", header=TRUE)

plot (data$experience, data$helpfulness, xlab="Experience (# reviews)", ylab="Helpfulness (%)", main="Reviewer Experience vs Helpfulness", pch=16,cex=0.3, cex.lab=1.3, cex.axis=1.3, cex.main=1.3, cex.sub=1.3, log="x")

cor(data$experience, data$helpfulness)
dev.off()
