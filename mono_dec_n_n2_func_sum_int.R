
# sum to 100 discrete
n_seq <- seq(1, 100, by = 1)
n_seq_2 <- n_seq * n_seq

discrete_terms <- n_seq / ((n_seq_2+1)**2)

discrete_sum <- sum(discrete_terms)

# tail errors in discrete sum
n_seq <- seq(100, 1e6, by = 1)
n_seq_2 <- n_seq * n_seq
discrete_terms_tail <- n_seq / ((n_seq_2 + 1)^2)
discrete_sum_error <- sum(discrete_terms_tail)

# the integral done simply
step_size <- 0.001
n_seq <- seq(1, 100, by = step_size)
n_seq_2 <- n_seq * n_seq
integral_terms <- 0.0
integral_terms <- (n_seq / ((n_seq_2+1)**2))*step_size

integral <- sum(integral_terms)

# beautiful how the discrete sum is much more - 0.397 - than integral - 0.25
# since the function is monotonic decreasing and the discrete sum assumes constant
# values between n and n+1 :)


# Monte Carlo estimate of this

# Gen x <- Runif(0,1)
# Gen y <- Runif(0,1)
# if y <= x / ((x^2)+1)^2 -- incl it in sum, else reject
# if in sum, update counter
# sum / counter as the final answer

# this is naive MC - so limits way smaller implying integral value lesser too

min_v <- 0
max_v <- 5

x <- runif(100000, min_v, max_v)
y <- runif(100000, min_v, max_v)

func_val <- x / ((x^2+1)^2)

counter <- ifelse(y <= func_val, 1, 0)

func_val <- func_val * counter # only retains accepted

sum_counter <- sum(counter)

sum_func_val <- sum(func_val)

sum_func_val
sum_counter

naive_MC_integral <- sum_func_val / sum_counter
cat("Approximate integral from doing naive MC is ", naive_MC_integral, "\n\n")

### Much cleverer -- take the uniform distribution and 
# apply variable transformations so we can directly sample from
# p ~ x / (x^2+1)^2

# turns out given random variates U, sqrt(U / (1.0 - U)) ~ p

# so on to more cuteness

#u <- runif(10000, 0, 1)
#EPS <- 1e-8 # prevent overflows

#x <- sqrt(u / (1.0 - u + EPS))

#sum(x)


