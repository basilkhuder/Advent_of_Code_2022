# Advent of Code 2022 -----------------------------------------------------

# Part One ----------------------------------------------------------------

input <- readLines("input3.txt")

points <- 1:52
names(points) <- c(tolower(LETTERS), LETTERS)

find_letter_diff <- \(x) {
  
  letters <- Reduce(c, strsplit(x, ""))
  letters_list <- list(letters[1:(length(letters) / 2)],
                       letters[((length(letters)/2) + 1): length(letters)])
  
  intersect_list <- intersect(letters_list[[1]], letters_list[[2]])
  
  points[intersect_list]
  
} 

sum(sapply(input, find_letter_diff))


# Part Two ----------------------------------------------------------------

input_split <- split(input, rep(1:100, each = 3))

find_letter_diff_three <- \(x) {
  
  letters <- lapply(x, \(i)  Reduce(c, strsplit(i, "")))
  
  letters_int <- intersect(intersect(letters[[1]], letters[[2]]), letters[[3]])
  points[letters_int]
  
} 

sum(sapply(input_split, find_letter_diff_three))
