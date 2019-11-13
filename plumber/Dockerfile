FROM trestletech/plumber
LABEL maintainer="mark"

COPY [".", "./"]

ENTRYPOINT ["R", "-e", "pr <- plumber::plumb(commandArgs()[4]); pr$run(host='0.0.0.0', port=as.numeric(Sys.getenv('PORT')))"]

RUN R -e "install.packages('lme4')

CMD ["api.R"]
