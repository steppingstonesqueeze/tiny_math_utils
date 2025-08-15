# some log functions

library(ggplot2)

x <- seq(0.1, 100, 0.1)
inv_x <- 1.0 / x
inv_x_2 <- inv_x^2
log_inv_x <- log(inv_x)
log_inv_x_2 <- log(inv_x_2)

df <- data.frame(x = x, 
                 inv_x = inv_x, 
                 log_inv_x = log_inv_x,
                 log_inv_x_2 = log_inv_x_2)

ggplot(
  data = df
) + geom_point(aes(x = x, y = log_inv_x), colour = "red") + 
  geom_line(aes(x = x, y = log_inv_x), colour = "black") +
  geom_point(aes(x = x, y = log_inv_x_2), colour = "green") + 
  geom_line(aes(x = x, y = log_inv_x_2), colour = "black") + 
  labs(y = "log inv x and x^2", x = "x")