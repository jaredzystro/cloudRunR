FROM trestletech/plumber
LABEL maintainer="mark"

RUN ["install2.r", "-r 'https://cloud.r-project.org'", "lme4", "jsonlite"]

COPY [".", "./"]

ENTRYPOINT ["R", "-e", "pr <- plumber::plumb(commandArgs()[4]); pr$run(host='0.0.0.0', port=Sys.getenv('PORT')"]
CMD ["api.R"]
