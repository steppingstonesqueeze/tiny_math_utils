# Tiny Math Utils

A collection of small mathematical explorations, computational experiments, and visualization tools in R. These utilities demonstrate various mathematical concepts through code, ranging from geometric visualizations to numerical analysis and statistical simulations.

## Overview

This repository contains bite-sized implementations of mathematical ideas that are too small for standalone projects but valuable for learning, teaching, or quick experimentation. Each script focuses on a specific mathematical concept with clear, readable code.

## Contents

### Geometric Visualizations

**Spiral Generators**
- `simple_arithmetic_spiral.R`: Linear spiral with r = a + b×θ
- `simple_logarithmic_spiral.R`: Exponential spiral with r = a + e^(b×θ)  
- `spiralisation_v1.R`: Advanced spiral variations including Kuramoto oscillator-inspired patterns
- `simple_computation_Spiral_of_Theodorus.R`: Classical geometric spiral with verification that overlapping begins after the 17th triangle

**Circle and Ellipse Studies**
- `perturbed_circle.R`: Parametric circles with harmonic perturbations r = 1 + ε×cos(k×θ)
- `morph_ellipse_into_circle.R`: Animated transformation showing ellipse-to-circle morphing with aspect ratio changes

### Probability and Statistics

**Distribution Analysis**
- `squares_of_uniforms.R`: Distribution of squared uniform random variables with CDF verification
- `multinomial_prob_vec_lengths_distribs.R`: Length distributions of probability vectors on the k-dimensional simplex
- `store_bought_and_homemade_percentiles.R`: Comparison between built-in quantile functions and naive percentile calculations

**Monte Carlo Methods**
- `x_to_x_integral_by_MC.R`: Monte Carlo integration of x^(x+1) with comparison to analytical methods
- `mono_dec_n_n2_func_sum_int.R`: Discrete vs continuous integration for monotonic decreasing functions, including Monte Carlo estimation

### Hash Functions and Algorithms

**Basic Hashing**
- `linear_hashing.R`: Simple linear hash functions with collision analysis
- Multiple hash function implementations for educational purposes

### Mathematical Problem Solving

**Computational Experiments**
- `radicalisation_lolz_1.R`: Solving radical equations with integer constraints
- `approx_mult_kids.R`: Child-friendly multiplication approximation using nearest multiples of 10
- `genfunc_Fibo.R`: Generating function visualization for Fibonacci sequence: x/(1-x-x²)

**Function Analysis**
- `some_log_funcs.R`: Visualization of logarithmic function families
- `inter_rater_agreements_2ways.R`: Framework for inter-rater agreement analysis (placeholder for Bayesian methods)

## Usage Examples

### Creating Spirals
```r
source("simple_logarithmic_spiral.R")
# Generates a logarithmic spiral with customizable parameters
# Output: ggplot visualization in red
```

### Monte Carlo Integration
```r
source("x_to_x_integral_by_MC.R")
# Estimates ∫[ε to 1] x^(x+1) dx using Monte Carlo
# Compares with numerical integration
```

### Distribution Experiments
```r
source("squares_of_uniforms.R")
# Demonstrates the distribution of U² where U ~ Uniform(0,1)
# Includes histogram and theoretical CDF verification
```

### Geometric Animations
```r
source("morph_ellipse_into_circle.R")
# Creates animated MP4 showing ellipse morphing to circle
# Requires: gganimate, av packages
```

## Key Features

### Educational Focus
- Clear, readable code suitable for teaching
- Mathematical concepts illustrated through computation
- Minimal dependencies (mostly base R + ggplot2)

### Visualization Heavy
- Most utilities produce plots or animations
- ggplot2-based graphics with clean styling
- Some animated visualizations using gganimate

### Computational Mathematics
- Numerical integration techniques
- Statistical simulation and verification
- Algorithm implementation and analysis

## Dependencies

**Core Requirements**
```r
install.packages(c("ggplot2", "dplyr"))
```

**Animation (optional)**
```r
install.packages(c("gganimate", "av", "gifski"))
```

**Additional Utils**
```r
install.packages("tibble")  # For some data manipulation
```

## Mathematical Concepts Covered

### Geometry and Topology
- Parametric curves and spirals
- Circle packing and perturbations  
- Classical geometric constructions (Spiral of Theodorus)

### Probability Theory
- Transformation of random variables
- Simplex sampling and probability vectors
- Monte Carlo estimation techniques

### Analysis
- Integration methods (analytical, numerical, Monte Carlo)
- Function behavior and singularities
- Series convergence and generating functions

### Computational Methods
- Hash function design
- Approximation algorithms
- Statistical estimation and comparison

## File Organization

Each file is self-contained and can be run independently. Files follow the naming convention:
- `simple_*`: Basic implementations of mathematical concepts
- `*_spiral*`: Spiral-related geometric functions
- `*_integral*` or `*_MC*`: Integration and Monte Carlo methods
- `*_distribs*`: Probability distribution studies

## Usage Patterns

### Quick Exploration
```r
# Most files can be run directly
source("perturbed_circle.R")  # Immediately shows plot
```

### Parameter Modification
```r
# Edit parameters at top of files
epsilon <- 0.3  # Change perturbation strength
k <- 5          # Change number of wave crests
# Then run the script
```

### Function Extraction
```r
# Many files contain reusable functions
source("approx_mult_kids.R")
result <- approx_mult_vals(23, 47)  # Use the function
print(result)
```

## Educational Applications

### Teaching Contexts
- **Calculus**: Integration techniques and Monte Carlo methods
- **Probability**: Random variable transformations
- **Geometry**: Parametric curves and classical constructions
- **Computer Science**: Hash functions and algorithms

### Research Applications  
- Quick prototyping of mathematical ideas
- Visualization of complex mathematical relationships
- Computational verification of analytical results

## Contributing

These utilities are designed to be:
- **Modular**: Each file focuses on one concept
- **Extensible**: Easy to modify parameters and add features
- **Educational**: Clear code with mathematical context

Potential extensions:
- More advanced Monte Carlo techniques
- Interactive visualizations with Shiny
- Connections between different mathematical areas
- Performance optimization for larger computations

---

*Mathematical exploration through computational experimentation - where small code snippets illuminate big mathematical ideas.*