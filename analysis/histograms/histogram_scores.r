scores <- scan("scores")
pdf("histogram_scores.pdf")

--mydata_hist <- hist(scores, plot=FALSE)
--plot(mydata_hist$counts, log="y")

hist(scores)
dev.off()
