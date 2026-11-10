# tenniscareer

An R package for analyzing professional tennis players' career matches and age differences between opponents.

This package builds on my earlier tennis data analysis project for STAT 159 at UC Berkeley.

## Overview

The package provides two main functions:

- `get_career_matches()`: downloads and processes a player's career match records from Tennis Abstract.
- `plot_age_gap()`: creates a scatter plot showing player age, age difference, and match results.

The package supports both WTA and ATP players, whose raw match records use different formats for opponent ages.

## Installation

Install the package directly from GitHub:

```r
install.packages("devtools")
devtools::install_github("UCB-stat159-f26/hw03-3-zhecen-zhou0309")
library(tenniscareer)
```

## Usage

Get Serena Williams' career match data:

```r
serena <- get_career_matches("Serena Williams")
head(serena)
```

Create the age gap scatter plot:

```r
p <- plot_age_gap(serena)
print(p)
```

Save the plot:

```r
ggplot2::ggsave(
  "serena_age_gap.png",
  plot = p,
  width = 10,
  height = 6,
  dpi = 150
)
```

The same functions can be used for other players:

```r
nadal <- get_career_matches("Rafael Nadal")
plot_age_gap(nadal)
```

## Data and reproducibility

Career match data comes from Tennis Abstract.

The package retrieves data from the website when `get_career_matches()` is called. As a result, match counts may change when the source data is updated.

WTA records provide opponents' birth dates, while ATP records provide opponents' ages directly. These differences are handled during data processing.

Automated tests use local mock data and do not contact live servers.

To run the tests from the package directory:

```r
devtools::test()
```

## Personal Reflections

## Personal Reflections

One of the biggest challenges in HW03 was turning my previous Serena Williams analysis from HW02 into an R package that could work with different players. In HW02, I mainly focused on cleaning one dataset and producing the final visualization. This time, I needed to separate the process into smaller functions so that other people could reuse the code.

The first problem I encountered was the difference between WTA and ATP match records. In the Tennis Abstract JavaScript files, female players' records store their opponents' dates of birth, while male players' records provide opponent ages directly. My original approach could not handle both formats in the same way. I eventually wrote `parse_opponent_age()` to distinguish between the two cases, which helped me understand why data processing functions need to account for differences in the source data.

Another challenge was retrieving each player's date of birth. I initially tried reading the information from Tennis Abstract profile pages, but the format was different from what I expected. After inspecting the actual JavaScript files, I found that the dates were stored in a `dob` variable. I also ran into a regular expression error while working on this part. These problems taught me that checking the actual data structure is more useful than assuming how a website stores its information.

I also learned more about reproducibility through testing. Instead of downloading data from Tennis Abstract every time I ran a test, I used mock data to check the functions locally. By the time I finished the main functions, I had 40 passing unit tests. I also tried to keep functions short, use consistent naming conventions, and write comments that explain important processing decisions.

Compared with HW02, this assignment made me think more about how someone else would understand and run my code. I realized that reproducibility is not just about getting the same result on my own computer, but also about making the process clear, testable, and easier for others to reuse.

## AI Documentation

To be completed.
