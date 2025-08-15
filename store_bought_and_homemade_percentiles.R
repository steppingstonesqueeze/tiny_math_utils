N <- 100
sample_space <- seq(1, N, by = 1)

num_pts <- 5000 

data <- sample(sample_space, num_pts, replace = TRUE)

head(data, 100)

# sort this bad boy

sorted_data <- sort(data)

head(sorted_data, 100)

prob_vec <- seq(0.1, 0.9, by = 0.1)
q_std_package <- quantile(sorted_data, probs = prob_vec)

q_std_package

# Super naive homemade percentiles without even an if condition to match up equals!
percentile_posns <- round(prob_vec*num_pts)


percentile_posns

sorted_data[percentile_posns]

# new data rnorm

data_2 <- rnorm(num_pts)

sorted_data_2 <- sort(data_2)

q_std_package_2 <- quantile(sorted_data_2, probs = prob_vec)

q_std_package_2

# Super naive homemade percentiles without even an if condition to match up equals!

percentile_posns <- round(prob_vec*num_pts)

sorted_data_2[percentile_posns]



