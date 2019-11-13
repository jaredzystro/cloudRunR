library(plumber)
library(jsonlite)
if (!require("lme4")) install.packages("lme4")

echoIt <- function (input_matrix) {
  
    output_matrix <- input_matrix
  
    return (output_matrix)
  
  }

doubleIt <- function (input_matrix) {
  
    output_matrix <- input_matrix * 2
  
    return (output_matrix)
  
  }


#' Double the numbers that were sent in
#' @param body The numbers to add
#' @post /doubleIt
#' @json
function(body){
  
  body_matrix <- fromJSON(body)
  
  output_matrix <- doubleIt(body_matrix)
  
  toJSON(output_matrix)
  
}

#' ANOVA
#' @param body The numbers to add
#' @post /echoIt
#' @json
function(body){
  
  body_matrix <- fromJSON(body)
  
  output_matrix <- echoIt(body_matrix)
  
  toJSON(output_matrix)
  
}

