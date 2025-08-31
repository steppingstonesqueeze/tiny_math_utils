# A simple elliptic curve #
options(digits = 6)
# y^2 = x * (x+1) * (2x+1) / 6

x <- seq(-5, 5, by = 0.001)

len_x <- length(x)

df <- data.frame(
  val = numeric(len_x),
  pos_y = numeric(len_x),
  neg_y = numeric(len_x)
)

i <- 1
for (val in x) {
  qty <- val * (val+1) * (2*val+1) / 6
  
  if (qty >= 0) {
    pos_y <- sqrt(qty)
    neg_y <- -pos_y
    
    df[i,] <- c(val, pos_y, neg_y)
    
  } else {
    df[i,] <- c(NA, NA, NA)
  }
  
  i <- i + 1
  
}

df <- df[complete.cases(df), ]

# plot this

plot(df$val, df$pos_y, col = "red", pch = 1, cex = 0.2, ylim = c(-15,15))
points(df$val, df$neg_y, col = "blue", pch = 1, cex = 0.2)