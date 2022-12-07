# Advent of Code 2022 -----------------------------------------------------

# Part One ----------------------------------------------------------------

input <- read.table("input2.txt")
combinations <- c("CZ" = 3,"BY" = 3, "AX" = 3, 
                  "AZ" = 0, "CY" = 0, "BX" = 0,
                  "BZ" = 6, "AY" = 6, "CX" = 6)
scores <- c("X" = 1, "Y" = 2,"Z" = 3)

input$combo <- paste0(input$V1, input$V2)
input$hand_score <- scores[input$V2]
input$outcome <- combinations[input$combo]

sum(input$outcome + input$hand_score)


# Part Two ----------------------------------------------------------------

outcome <- \(type, letter) {
  
  if (type == "X") combo <- switch(letter, C = "CY", B = "BX", A = "AZ")
  if (type == "Y") combo <- switch(letter, C = "CZ", B = "BY", A = "AX")
  if (type == "Z") combo <- switch(letter, C = "CX", B = "BZ", A = "AY")
  
  combo
  
}

input$combo <- sapply(seq(nrow(input)), \(x) outcome(input$V2[x], input$V1[x]))
input$V2 <- sapply(strsplit(input$combo, ""), \(x) x[[2]])
input$hand_score <- scores[input$V2]
input$outcome <- combinations[input$combo]

sum(input$outcome + input$hand_score)



