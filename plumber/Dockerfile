FROM trestletech/plumber
LABEL maintainer="mark"

RUN ["install2.r", "-r 'https://cloud.r-project.org'", "readr", "lme4", "googleCloudStorageR", "Rcpp", "digest", "crayon", "withr", "mime", "R6", "jsonlite", "xtable", "magrittr", "httr", "curl", "testthat", "devtools", "hms", "shiny", "httpuv", "memoise", "htmltools", "openssl", "tibble", "remotes"]

COPY [".", "./"]

ENTRYPOINT ["R", "-e", "pr <- plumber::plumb(commandArgs()[4]); pr$run(host='0.0.0.0', port=Sys.getenv('PORT')"]
CMD ["api.R"]
