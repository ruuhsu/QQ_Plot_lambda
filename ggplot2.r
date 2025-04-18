```
library(ggplot2)

# Clean and sort p-values
pvals <- result$Meta_P
pvals <- pvals[!is.na(pvals) & pvals > 0]
n <- length(pvals)
expected <- -log10(ppoints(n))
observed <- -log10(sort(pvals))

# Calculate lambda
chisq <- qchisq(1 - pvals, df = 1)
lambda <- median(chisq, na.rm = TRUE) / qchisq(0.5, df = 1)

# Create data frame
qq_df <- data.frame(Expected = expected, Observed = observed)

# Plot
ggplot(qq_df, aes(x = Expected, y = Observed)) +
  geom_point(size = 1.5, alpha = 0.65, color = "#2C73B9") +
  geom_abline(slope = 1, intercept = 0, linetype = "dashed", color = "firebrick") +
  labs(
    title = "QQ Plot of Meta_P",
    subtitle = bquote(lambda == .(round(lambda, 3))),
    x = expression(Expected ~ -log[10](italic(P))),
    y = expression(Observed ~ -log[10](italic(P)))
  ) +
  theme_classic(base_size = 14) +
  theme(
    plot.title = element_text(face = "bold"),
    plot.subtitle = element_text(size = 12),
    axis.line = element_line(color = "black"),
    panel.grid = element_blank()
  ) +
  coord_fixed(ratio = 0.8)
