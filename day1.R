# Advent of Code 2022 -----------------------------------------------------

# Part One ----------------------------------------------------------------

input <- as.numeric(readLines("input.txt"))
calories <- split(input, cumsum(is.na(input)))
sum_cals <- sapply(calories, sum, na.rm = TRUE)
max(sum_cals)

# Part Two ----------------------------------------------------------------

sum(sort(sum_cals, decreasing = TRUE)[1:3])
