```

library(qqman)
qq(result$PVALUE, main = "QQ Plot of {{Project_name}}")

# Add lambda
chisq <- qchisq(1 - result$P_VALUE, df = 1)
lambda <- median(chisq, na.rm = TRUE) / qchisq(0.5, df = 1)
legend("topleft", legend = bquote(lambda == .(round(lambda, 3))), bty = "n")
