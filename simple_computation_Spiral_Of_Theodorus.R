# Simple computation on the Spiral of Theodorus

# The spiral itself is here : 
# https://en.wikipedia.org/wiki/Spiral_of_Theodorus#:~:text=In%20geometry%2C%20the%20spiral%20of,placed%20edge%2Dto%2Dedge.

# Computing and verifying that Theodorus went till 17 as after that, the right angled triangles
# overlap

library(ggplot2)
pi <- 3.14159
pi_2 <- 2.0 * pi

num_seq <- seq(2, 20, by = 1)
hypo_lengths <- sqrt(num_seq)

angle_sums <- 0.0
angles <- asin(1.0 / hypo_lengths)

cumulative_angle_sums <- cumsum(angles)

relevant_cumsum <- ifelse(cumulative_angle_sums < pi_2, cumulative_angle_sums, NA)

relevant_cumsum <- na.omit(relevant_cumsum)

relevant_cumsum
length(relevant_cumsum)
