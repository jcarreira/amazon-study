pdf("lifetime_score.pdf")

data <- read.table("product_id_lifetime_average_score", header=TRUE)

plot (data$score, data$lifetime, xlab="Score", ylab="Life Span (days)")

#cor(data$score, data$lifetime)
dev.off()
