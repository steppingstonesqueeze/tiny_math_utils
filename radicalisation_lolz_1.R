### Radical related problem

# Solve for x,y,z in Z

# x - sqrt(y*z) = 42
# y - sqty(x*z) = 16
# z - sqrt(x*z) = -30

# can reduce to

# sqrt(x*y*z) = x**1.5 - 42*sqrt(x) = y**1.5 - 30*sqrt(y) = z**1.5 + 30*sqrtt(z)

# x,y,z are squares

# run a lame loop just for x, note when these quantities are all same

n <- seq(0, 100, by = 1)
len_n <- length(n)

x_vals <- n*n

x_vals

df1 <- data.frame(
  ctr = rep(NA, len_n),
  term1 = rep(NA, len_n),
  term2 = rep(NA, len_n),
  term3 = rep(NA, len_n)
)

ctr <- 1

for (x in x_vals) {
  term1 <- x**1.5 - 42*sqrt(x)
  term2 <- x**1.5 - 16*sqrt(x)
  term3 <- x**1.5 + 30*sqrt(x)
  
  df1[ctr,1] <- ctr
  df1[ctr,2] <- term1
  df1[ctr,3] <- term2
  df1[ctr,4] <- term3
  ctr <- ctr + 1
  
}


