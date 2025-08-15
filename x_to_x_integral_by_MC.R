# MC for integrals

# x^(x+1) between epsilon to 1, epsilon = 1e-3

# Monte Carlo estimation of ∫_{ε}^{1} x^(x+1) dx
set.seed(123)  # for reproducibility

# Define parameters
epsilon <- 1e-3
N <- 1e8  # number of random samples

# Generate uniform random samples in [ε, 1]
x_vals <- runif(N, min = epsilon, max = 1)

# Evaluate f(x) = x^(x+1)
fx_vals <- x_vals^(x_vals + 1)

# Compute average and scale by interval length
mc_estimate <- (1 - epsilon) * mean(fx_vals)

# integral est
delta_x <- 1.0 / N

trapexzium_area <- fx_vals * delta_x
integ_estimate <- sum(trapexzium_area)


# Print result
cat("Monte Carlo estimate of the integral is:", mc_estimate, "\n")

cat("Integral estimate is ", integ_estimate, "\n")
