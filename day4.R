# Advent of Code 2022 -----------------------------------------------------

# Part One ----------------------------------------------------------------

input <- readLines("input4.txt")
input_split <- strsplit(gsub("-", ":", input), ",")

eval_expr <- \(x) {
  
  list(eval(parse(text = x[1])),
       eval(parse(text = x[2])))
  
} 

find_overlaps <- \(x) {
  
  first <- all(x[[1]] %in% x[[2]])
  second <- all(x[[2]] %in% x[[1]])
  first | second
  
}

input_list <- lapply(input_split, eval_expr)
sum(sapply(input_list, find_overlaps))

# Part Two ----------------------------------------------------------------

find_overlaps <- \(x) {
  
  first <- any(x[[1]] %in% x[[2]])
  second <- any(x[[2]] %in% x[[1]])
  first | second
  
}

sum(sapply(input_list, find_overlaps))

