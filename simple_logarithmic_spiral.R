# logarithmic spiral


a <- 0.1
b <- 0.1

theta_bias <- 0.0
theta_vals <- seq(0, 20*pi, by = 0.01)

theta_vals <- theta_vals + theta_bias

r <- a + exp(b*theta_vals)

x <- r * cos(theta_vals)
y <- r * sin(theta_vals)

df <- data.frame(x=x, y=y)

ggplot(
  data = df
) + geom_point(aes(x = x, y = y), colour = "red")