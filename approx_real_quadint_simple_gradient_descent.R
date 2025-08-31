### approximation of a real number w arbitrary precision by quadratic integers ###

# Simple gradient descent here #

# The cost function is : C = (a + b* sqrt(d) - desired_num)**2
# del C / del a = -2*(desired_num - a) + 2*b*sqrt(d)
# del C / del b = 2*d*b - 2*(desired_num-a)*sqrt(d)

# Given a guess (a0,b0) then :
# a1 = a0 - learning_rate * delC / del a
# b1 = b0 - learning_rate * del C / del b

# and so on

# Code for Euler problem 591 -- using some niftiness other than constrained brute force line search #

EPS <- 0

library(ggplot2)
options(digits = 20) # useful for this problem because of the large range of values

distance_func <- function(quadint, desired_num, exponent) {
  return((abs(quadint - desired_num))**exponent) # Euclidean minus the square root as doesnt matter
}

partial_derivative_a <- function(desired_num,
                                 a0,
                                 b0,
                                 d) {
  return(-2*(desired_num-a0) + 2*b0*sqrt(d))
}

partial_derivative_b <- function(desired_num,
                                 a0,
                                 b0,
                                 d) {
  return(2*d*b0 - 2*(desired_num-a0)*sqrt(d))
}

non_sqr <- function(N) {
  # rturns all non-square numbers from 1-N

  nsq <- rep(NA, N)

  ctr <- 1

  for (i in 1:N) {
    if ((sqrt(i) - floor(sqrt(i))) > 1.0e-12) {
      nsq[ctr] <- i
      ctr <- ctr + 1

    }
  }

  nsq <- nsq[!is.na(nsq)]

  return(nsq)
}

initialize_values <- function(a0, b0,
                              ab_range=10^13,
                       desired_num = pi,
                       d = 2,
                       learning_rate = 2) {
  return(c(a0=a0, b0=b0,ab_range=ab_range,
           desired_num=desired_num,
           d=d, learning_rate=learning_rate))
}

make_quadint <- function(a, b, d) {
  return( a + b * sqrt(d))
}
# start #

#params <- initialize(
#  0, 0 # rest use defaults
#)

params <- initialize_values(
  0,
  0,
  10^13,
  pi,
  2,
  10^10
)

a0 <- params["a0"]
b0 <- params["b0"]
ab_range <- params["ab_range"]
desired_num <- params["desired_num"]
d <- params["d"]
learning_rate <- params["learning_rate"]

a0 <- sample(ab_range, 1, replace = F)
a0_sign <- ifelse(runif(1) <= 0.5, -1, 1)

a0 <- a0*a0_sign

b0 <- ceiling((desired_num-a0) / sqrt(d))

a0_orig <- a0
b0_orig <- b0

initial_quad_int <- make_quadint(a0, b0, d)

initial_objective_func <- distance_func(
  initial_quad_int,
  desired_num,
  2 # this has to be 2 for the partial derivatives computed above else that needs to be changed too
)

tot_steps <- 10000

grad_desc_df <- data.frame(
  step=rep(NA, tot_steps),
  a_guess=rep(NA, tot_steps),
  b_guess=rep(NA, tot_steps),
  pd_a=rep(NA, tot_steps),
  pd_b=rep(NA, tot_steps),
  qint=rep(NA, tot_steps),
  desired_num=rep(NA, tot_steps),
  obj_func=rep(NA, tot_steps)
)

ctr <- 1

initial_pd_a <- partial_derivative_a(desired_num, a0, b0, d)
initial_pd_b <- partial_derivative_b(desired_num, a0, b0, d)

grad_desc_df[ctr,] <- c(1, a0, b0, initial_pd_a, initial_pd_b, initial_quad_int, desired_num, initial_objective_func)

a_best <- a0
b_best <- b0
obj_best <- initial_objective_func

ctr <- ctr + 1
for (t in 1:(tot_steps-1)) {

  cat("Step:", t, "\n")

  pd_a <- partial_derivative_a(desired_num, a0+EPS, b0+EPS, d)
  pd_b <- partial_derivative_b(desired_num, a0+EPS, b0+EPS, d)


  # new guess
  a1 <- a0 - learning_rate * pd_a
  b1  <- b0 - learning_rate * pd_b

  a1 <- ceiling(a1)

  a1_sign <- sign(a1)

  # restrict to the range allowed
  a1 <- abs(a1) %% ab_range

  a1 <- a1 * a1_sign

  # compute b1 instead of using its gradient!
  b1 <- ceiling((desired_num - a1) / sqrt(d))

  # new guess on the
  new_quad_int <- make_quadint(a1, b1, d)

  new_objective_func <- distance_func(new_quad_int, desired_num, 2)

  grad_desc_df[ctr, ] <- c(ctr, a1, b1, pd_a, pd_b, new_quad_int, desired_num, new_objective_func)

  a0 <- a1
  b0 <- b1

  if (new_objective_func < initial_objective_func) {
    a_best <- a1
    b_best <- b1
    obj_best <- new_objective_func
  }

  ctr <- ctr + 1
}

# plot

ggplot(data = grad_desc_df, aes(x = log(step), y = log(obj_func))) + geom_point(colour = "blue")

# plot the partial derivative of a

ggplot(data = grad_desc_df, aes(x = step, y = pd_a)) + geom_point(colour = "red")

