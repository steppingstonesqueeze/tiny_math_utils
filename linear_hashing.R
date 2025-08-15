# Trivial linear hashing - pseudo RNG base ideas

library(ggplot2)

p <- 17 # universe of elements = 0 - 16

# hash function 1
k1 <- 2 
q1 <- 5

# hash function 2
k2 <- 3
q2 <- 10

# data
N_elements <- 100 # sure shot collisions
N_max <- 30
data <- sample(N_max, N_elements, replace = T)

# hash functions naively
hash1 <- function(val, k=k1, q=q1, p=p) {
  return ((k1*val+q1) %% p)
}

hash2 <- function(val, k=k2, q=q2, p=p) {
  return ((k2*val+q2) %% p)
}





