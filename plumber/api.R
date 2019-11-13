library(plumber)
library(jsonlite)

#' @get /hello
#' @html
function(){
  "50,50,25,25"
}

#' Echo the parameter that was sent in
#' @param msg The message to echo back.
#' @get /echo
function(msg=""){
  list(msg = paste0("The message is: '", msg, "'"))
}

#' Plot out data from the iris dataset
#' @param spec If provided, filter the data to only this species (e.g. 'setosa')
#' @get /plot
#' @png
function(spec){
  myData <- iris
  title <- "All Species"

  # Filter if the species was specified
  if (!missing(spec)){
    title <- paste0("Only the '", spec, "' Species")
    myData <- subset(iris, Species == spec)
  }

  plot(myData$Sepal.Length, myData$Petal.Length,
       main=title, xlab="Sepal Length", ylab="Petal Length")
}

#' Add the numbers that were sent in
#' @param body The numbers to add
#' @post /sumall
#' @json
function(body="[[1,3],[3,4]]"){
  
  my_matrix <- fromJSON(body)
  # my_df <- as.data.frame(my_matrix)
  
  my_matrix <- my_matrix*2
  
  toJSON(my_matrix)
  
}
