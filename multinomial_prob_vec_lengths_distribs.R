
# picking uniformly from a k-dim simplex - ie, Sum_i=1 to k = x_i = 1
# want to see length distributions of the prob vecs here

# clearly min is when equidsistributedd probability
#@ For N-dim multinomial, that vec is (1,N,1,N,..,1/N) of length N and its
# length is simply 1/sqrt(N)

# max val of course is 1 dim = 1, all else 0 for 1

K <- 10

EPSILON <- 1.0e-10

min_val <- 0
max_val_ORIG <- 1.0 - EPSILON
max_val <- max_val_ORIG

N <- 100000

all_lengths <- numeric(length = N)

for (i in 1:N) {
  min_val <- 0.0
  max_val <- 1.0
  for (d in 1:(K-1)) {
    s <- runif(1, min_val, max_val)
    all_lengths[i] <- all_lengths[i] + (s-min_val)**2
    min_val <- s
    
  }
  
  all_lengths[i] <- all_lengths[i] + (max_val_ORIG - min_val)**2
  
  all_lengths[i] <- sqrt(all_lengths[i])
}

hist(all_lengths, breaks = 100, col = "red")