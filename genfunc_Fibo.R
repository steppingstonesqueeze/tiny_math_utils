# x / (1-x-x^2)

library(ggplot2)

x_seq <- seq(-10, 10, 0.01)
f <- x_seq / (1.0 - x_seq - x_seq*x_seq)

df <- data.frame(
  x = x_seq,
  f = f
)

ggplot(
  data = df
) + geom_point(aes(x = x, y = f), colour = "red", size = 0.1) + 
  geom_line(aes(x = x, y = f), colour = "black")

# whwre is this blowing up
df_max <- subset(df, abs(f) > 25)

df_max