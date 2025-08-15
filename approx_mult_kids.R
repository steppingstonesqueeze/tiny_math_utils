#v approximate multiplication # 

# Idea is very simple --

# Given two numbers A and B, find closest multiples of 10 that are above and below each

# say for A we have Aminus_10, Aplus_10
# for B we have Bminus_10, Bplus10

# We then compute
# Aminus_10 * Bminus_10, Aminus_10 * Bplus_10, Aplus_10 * Bminus_10, Aplus_10 * Bplus_10
# and order these in increasing value

# return the two values that encapsulates the actual product A * B tightest is returned

# for now assume numbers are positive as this is for a 7 year old

approx_mult_vals <- function(a, b) {
  actual_prod <- a * b
  rem_a <- a %% 10
  aminus_10 <- a - rem_a
  aplus_10 <- a + 10 - rem_a
  
  rem_b <- b %% 10
  bminus_10 <- b - rem_b
  bplus_10 <- b + 10 - rem_b
  
  sorted_prods <- sort(c(aminus_10 * bminus_10, aminus_10 * bplus_10, aplus_10 * bminus_10,
                       aplus_10 * bplus_10))
  
  low <- sorted_prods[1]
  
  for (val in sorted_prods[2:length(sorted_prods)]) {
    if (low <= actual_prod && val >= actual_prod) {
      output <- list(low_approx = low, high_approx = val)
      return (output)
    } else {
      low <- val
    }
    
  }
  
  return (output)
  
}

approx_mult_vals(14, 51)

