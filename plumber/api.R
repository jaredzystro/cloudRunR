library(plumber)
library(jsonlite)
library(lme4)

echoIt <- function (input_matrix) {
  
    output_matrix <- input_matrix
  
    return (output_matrix)
  
  }

doubleIt <- function (input_matrix) {
  
    output_matrix <- input_matrix * 2
  
    return (output_matrix)
  
  }


AnovaIt <- function (input_matrix) {
  
#  data <- as.data.frame(input_matrix)
#  colnames(data) <- data[1, ] # first row is header
#  data <- data[-1, ] 
  
  output_matrix <- input_matrix
  
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
#' @post /AnovaIt
#' @json
function(body){
  
  body_matrix <- fromJSON(body)
  
  output_matrix <- AnovaIt(body_matrix)
  
  toJSON(output_matrix)
  
}
