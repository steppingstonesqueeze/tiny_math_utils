# spiraling a very simple arithmetic spiral

a <- 1.0
b <- 1.0

theta_bias <- 0.0
theta_vals <- seq(0, 10*pi, by = 0.01)

theta_vals <- theta_vals + theta_bias

r <- a + b*theta_vals

x <- r * cos(theta_vals)
y <- r * sin(theta_vals)

df <- data.frame(x=x, y=y)

ggplot(
  data = df
) + geom_point(aes(x = x, y = y), colour = "red")