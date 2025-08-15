library(ggplot2)
pi <- 3.14159
t <- seq(0, 10*pi, by = 0.001)
EPS <- 1.0e-5

head(t, 100)

omega <- 2
omega_2 <- 2

exponent_param <- 0.1
exponent_param_2 <- -0.1

#Kurmura packet spirals! BELOW
#x <- exp(exponent_param*t) * (log(t+EPS) + cos(omega*t))
#y <- exp(exponent_param*t) * (log(t+EPS) + sin(omega*t))

# normal spirals!

#x <- exp(exponent_param*t) * (cos(omega*t))
#y <- exp(exponent_param*t) * (sin(omega*t))

# Smoothed rectangle patterns going outwards! BELOW
#x <- exp(exponent_param*t) * sqrt(abs(cos(omega*t)))
#y <- exp(exponent_param*t) * sqrt(abs(sin(omega*t)))

#Kurmura packet spirals! BELOW
x <- (log(t+EPS) + cos(omega*t))
y <- (log(t+EPS) + sin(omega*t))

head(y, 100)

df <- data.frame(
  t = t, 
  x = x,
  y = y
)


ggplot(
  data = df
) + geom_line(aes(x = t, y = y), colour = "red")

ggplot(
  data = df
) + geom_path(aes(x = x, y = y), colour = "blue")

