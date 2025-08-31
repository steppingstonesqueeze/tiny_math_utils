### Some simple number theory
# Quadratic residue and whatnot

# all numbers -- thats where we get away from having (p-1)/2 QRs and stuff!

library(numbers)
library(partitions)
library(primes)

N <- 1000

allprimes_N <- seq(3, N, by = 1) # MISNOMER : this is all numbers including primes

halfvals <- ifelse(allprimes_N %%2 == 1, (allprimes_N - 1)/2, (allprimes_N/2))
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

# REMEMBER : allprimes contains both primes AND non-primes!!!

for (i in seq(allprimes_N)) {

  cat("Number is : ", allprimes_N[i], "\n")

  # not prime value -- all values below.
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

# try plotting?
ggplot(data = df) + geom_point(aes(x = log(prime_val), y = log(q_r_coverage)), colour = "red") +
  geom_line(aes(x = log(prime_val), y = log(cubic_r_coverage)), colour = "blue")


