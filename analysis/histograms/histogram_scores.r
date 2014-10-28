scores <- scan("scores")
pdf("histogram_scores.pdf")

hist(scores,cex=0.3, cex.lab=1.3, cex.axis=1.3, cex.main=1.3, cex.sub=1.3)
dev.off()
