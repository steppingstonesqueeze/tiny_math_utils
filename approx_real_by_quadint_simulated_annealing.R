### approximation of a real number w arbitrary precision by quadratic integers ###

# Code for Euler problem 591 -- using some niftiness other than constrained brute force line search #

library(ggplot2)
options(digits = 20) # useful for this problem because of the large range of values

distance_func <- function(quadint, desired_num, exponent) {
  return((abs(quadint - desired_num))**exponent) # Euclidean minus the square root as doesnt matter
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

initialize <- function(a0, b0, ab_range=10^13, num_T_steps=100, T_dec_rate=0.95,
                       desired_num = pi,
                       d = 2) {
  return(c(a0=a0, b0=b0, ab_range=ab_range,
           num_T_steps=num_T_steps, T_dec_rate=T_dec_rate,
           desired_num=desired_num,
           d=d))
}

make_quadint <- function(a, b, d) {
  return( a + b * sqrt(d))
}
# start #

#params <- initialize(
#  0, 0 # rest use defaults
#)

params <- initialize(
  0,
  0,
  10^13,
  500,
  0.95,
  pi,
  2
)

a0 <- params["a0"]
b0 <- params["b0"]
ab_range <- params["ab_range"]
num_T_steps <- params["num_T_steps"]
T_dec_rate <- params["T_dec_rate"]
desired_num <- params["desired_num"]
d <- params["d"]

# start off with many initial conditions -- for each see what we find

num_init_conditions <- 20000

init_cond_ctr <- 1


many_solns_df <- data.frame(
  a0=rep(NA, num_init_conditions),
  b0=rep(NA, num_init_conditions),
  a_best=rep(NA, num_init_conditions),
  b_best=rep(NA, num_init_conditions),
  best_obj=rep(NA, num_init_conditions),
  desired_num=rep(NA, num_init_conditions),
  quad_int=rep(NA, num_init_conditions)
)

for (j in 1:num_init_conditions) {

  cat("j = ", j, "\n")

  a0 <- sample(ab_range, 1, replace = F)

  a0_sign <- ifelse(runif(1) <= 0.5, -1, 1)

  a0 <- a0*a0_sign
  b0 <- ceiling((desired_num - a0) / sqrt(d))

  a0_orig <- a0
  b0_orig <- b0

# per step, accept 10 configs then reduce temp for now

num_accept <- 10

# step size - ma possible set to ab_range / 2
step_size <- ab_range

# choose initial temp to be arbitrary

T1 <- 20.0

T1_orig <- T1

# initial best configs are the initial a,b
a_best <- a0
b_best <- b0

# compute the initial distance (obj func)
obj_init <- distance_func(make_quadint(a0, b0, d), desired_num, 1)

best_obj <- obj_init

for (i in 1:num_T_steps) {
#  cat("Step : ", i, "; temp : ", T1)

  accepted_configs <- 0
  tried_configs <- 0

  # try a new config at random

  while (accepted_configs < 100 && tried_configs < 400) {

  a_step <- sample(step_size, 1, replace = FALSE)

  a_step_sign <- ifelse(runif(1) <= 0.5, -1, 1)

  a_step <- a_step * a_step_sign

  # update
  a1 <- a0 + a_step

  # ensure its in range

  a1 <- abs(a1) %% ab_range

  a1 <- a1 * a_step_sign

  # derive b completely from a by demanding that (desired_num - a) / sqrt(d) = b - then
  # take the ceiling to get b1
  b1 <- ceiling((desired_num - a1) / sqrt(d))
  b1_sign <- sign(b1)

  b1 <- abs(b1) %% ab_range
  b1 <- b1 * b1_sign

  b1f <- b1 - 1

  if (b1f < -ab_range) {
    b1f <- -ab_range
  }

  b1t <- b1 + 1

  if (b1t > ab_range) {
    b1t <- ab_range
  }
  # new objective func w b1

  new_obj_1 <- distance_func(make_quadint(a1, b1, d), desired_num, 1)

  new_obj <- new_obj_1 # default obj func as one wants

  # with b1f
  new_obj_2 <- distance_func(make_quadint(a1, b1f, d), desired_num, 1)

  # with b1t

  new_obj_3 <- distance_func(make_quadint(a1, b1t, d), desired_num, 1)

  # make the lower of the two the b1 value etc
  if (new_obj_2 < new_obj_1) {
    new_obj <- new_obj_2
    b1 <- b1f
  }

  if (new_obj_3 < new_obj) {
    new_obj <- new_obj_3
    b1 <- b1t
  }

  prob1 <- exp(-(new_obj - obj_init) / T1)

  accep_prob <- min(1.0, prob1)

  if (runif(1) <= accep_prob) {
    # if this is less than olbder obj, this is a new best
    if (new_obj < best_obj) {
      a_best <- a1
      b_best <- b1
      best_obj <- new_obj
    }
    # accept this new config
    a0 <- a1
    b0 <- b1
    obj_init <- new_obj

    accepted_configs <- accepted_configs + 1
    tried_configs <- tried_configs + 1
  } else {
    tried_configs <- tried_configs + 1
  }

  } # while loop for accepted and tried configs ends here

#  cat("Best a : ", a_best, "; best b : ", b_best, "; best obj : ", best_obj,
#      "; Temp : ", T1, "\n")

  #cat("accepted :", accepted_configs, "; tried :", tried_configs, "\n")

  quad_int <- a_best + b_best * sqrt(d)

  #lower temp

  T1 <- T1 * T_dec_rate

  if (i %% (num_T_steps+40) == 0) {
    T1 <- T1_orig # a reset from the current best all over again
    a0 <- a_best
    b0 <- b_best
  }
} # loop on T steps done

qq <- a_best + b_best * sqrt(d)

many_solns_df[init_cond_ctr, ] <- c(
  a0_orig,
  b0_orig,
  a_best,
  b_best,
  best_obj,
  desired_num,
  qq
)

init_cond_ctr <- init_cond_ctr + 1
}# done or something

many_solns_df <-
  many_solns_df[with(many_solns_df, order(best_obj)), ]
