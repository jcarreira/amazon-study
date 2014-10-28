pdf("lifetime_score.pdf")

data <- read.table("product_id_lifetime_average_score", header=TRUE)

plot (data$score, data$lifetime, xlab="Score", ylab="Life Span (days)", pch=16,cex=0.3, cex.lab=1.5, cex.axis=1.5, cex.main=1.5, cex.sub=1.5)

#cor(data$score, data$lifetime)
dev.off()
