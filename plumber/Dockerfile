FROM trestletech/plumber
LABEL maintainer="mark"

RUN R -e "install.packages('lme4', method='wget')"

COPY [".", "./"]

ENTRYPOINT ["R", "-e", "pr <- plumber::plumb(commandArgs()[4]); pr$run(host='0.0.0.0', port=Sys.getenv('PORT')"]
CMD ["api.R"]
