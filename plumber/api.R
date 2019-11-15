install.packages("lme4")

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
  
  data_set <- data.frame(input_matrix[-1, ], stringsAsFactors=FALSE)
  
  colnames(data_set) <- input_matrix[1,] # the first row will be the header

  data_set$Entry <- as.factor(data_set$Entry)
  data_set$Rep <- as.factor(data_set$Rep)
  data_set[, !names(data_set) %in% c("Entry", "Rep")]  <- as.numeric(data_set[, !names(data_set) %in% c("Entry", "Rep")])
  
  l_model <- lm(Height ~ Entry + Rep, data=data_set)
  anova_data <- anova(l_model)
  output_df <- as.data.frame(anova_data)
  output_matrix <- as.matrix(output_df)
  dimnames(output_matrix) <- list(rownames(output_df),colnames(output_df))
  
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

#' Echo
#' @param body The numbers to echo
#' @post /echoIt
#' @json
function(body){
  
  body_matrix <- fromJSON(body)
  
  output_matrix <- echoIt(body_matrix)
  
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
