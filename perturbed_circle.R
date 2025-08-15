# perturbed circle

library(ggplot2)

# Parameters
epsilon <- 0.6  # Amplitude of the perturbation
k <- 2     # Number of wave crests

# Generate theta values
theta <- seq(0, 2 * pi, length.out = 1000)

# Parametric equations
r <- 1 + epsilon * cos(k * theta)
x <- r * cos(theta)
y <- r * sin(theta)

# Create data frame
df <- data.frame(x = x, y = y)

# Plot using ggplot2
ggplot(df, aes(x = x, y = y)) +
  geom_path(color = "steelblue", size = 1) +
  coord_equal() +
  theme_minimal() +
  ggtitle(paste("Perturbed Circle: ε =", epsilon, ", k =", k)) +
  theme(plot.title = element_text(hjust = 0.5))
