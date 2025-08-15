# animate an ellipse morphing continuously into a circle
# as the ratio of semi minor / semi major axis goes from some small value to 1

library(ggplot2)
library(gganimate)
library(dplyr)
library(tibble)

# Generate points for ellipses with different aspect ratios
n_points <- 200
r_values <- seq(0.2, 2, length.out = 50)
theta <- seq(0, 2 * pi, length.out = n_points)

ellipse_data <- lapply(r_values, function(r) {
  tibble(
    x = r * cos(theta),
    y = sin(theta),
    frame = sprintf("a/b = %.2f", r)
  )
}) %>% bind_rows()

# Plotting
p <- ggplot(ellipse_data, aes(x, y)) +
  geom_path(color = "steelblue", linewidth = 1.5) +
  coord_fixed() +
  theme_minimal(base_size = 16) +
  labs(title = "Ellipse to Circle Morphing", subtitle = "{closest_state}") +
  transition_states(frame, transition_length = 2, state_length = 1)

# Animate
#animate(p, fps = 10, duration = 5, width = 500, height = 500, renderer = gifski_renderer("ellipse_to_circle.gif"))

# use ffpmeg for effective rendering
animate(p, fps = 10, duration = 5, width = 600, height = 600,
        renderer = av_renderer("ellipse_to_circle.mp4"))