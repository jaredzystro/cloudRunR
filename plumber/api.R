library(plumber)
library(jsonlite)

doubleIt <- function (input_matrix) {
  
    output_matrix <- input_matrix * 2
  
    return (output_matrix)
  
  }

#' Double the numbers that were sent in
#' @param body The numbers to add
#' @post /doubleIt
#' @json
function(){
  
  body_matrix <- fromJSON(body)
  
  output_matrix <- doubleIt(body_matrix)
  
  toJSON(output_matrix)
  
}
