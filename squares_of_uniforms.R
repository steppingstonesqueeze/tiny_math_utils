# Square of a uniform rv

library(ggplot2)
N <- 10000
x <- runif(N, 0, 1)
x_2 <- x*x

hist(x_2, breaks = 20)

# CDF og x_2
# P(X <= sqrt(u)) = u where u ~ Unif(0,1)

x_sqrt <- sqrt(x)

df2 <- data.frame(x_sqrt = x_sqrt,
                  x = x)

ggplot(
  data = df2, aes(x = x_sqrt, y = x)
) + geom_point(colour = "red") + geom_line(colour = "black")