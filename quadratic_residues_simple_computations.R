### Some simple number theory
# Quadratic residue and whatnot

# only primes
library(numbers)
library(partitions)
library(primes)

N <- 1000

allprimes_N <- generate_primes(0, N)

allprimes_N <- allprimes_N[allprimes_N > 2] # no need for 2

halfvals <- (allprimes_N - 1)/2
#df <- data.frame(
#
#)

len1 <- length(allprimes_N)

df <- data.frame(
  prime_val = rep(NA, len1),
  half_prime_val = rep(NA, len1),
  num_q_r = rep(NA, len1),
  q_r_coverage = rep(NA, len1),
  num_cubic_r = rep(NA, len1),
  cubic_r_coverage = rep(NA, len1)
)

for (i in seq(allprimes_N)) {

  cat("Prime is : ", allprimes_N[i], "\n")
  prime_val <- allprimes_N[i]
  half_prime_val <- halfvals[i]

  seq1 <- seq(1, half_prime_val, by = 1) # 1 - (p-1)/2

  seq2 <- seq1

  # quadratic
  seq1 <- seq1 * seq1

  # mod p

  seq1 <- seq1 %% prime_val

  # unique
  seq1 <- unique(seq1)

  # how many ?
  len_seq1 <- length(seq1)

  # cubic

  seq2 <- seq2 * seq2 * seq2

  # mod p

  seq1 <- seq1 %% prime_val

  # unique
  seq2 <- unique(seq2)

  # how many ?
  len_seq2 <- length(seq2)

  df[i,] <- c(prime_val,
              half_prime_val,
              len_seq1,
              len_seq1 / (prime_val - 1),
              len_seq2,
              len_seq2 / (prime_val - 1))

}


