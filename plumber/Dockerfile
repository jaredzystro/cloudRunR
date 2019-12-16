FROM inwt/r-base:latest

RUN apt-get -y update \
    && installPackage \
        lme4 \
        plumber \
    && installGithub \
        INWT/dbtools \
        INWT/mctools \
    && rm -rf /tmp/downloaded_packages/*

COPY [".", "./"]

ENTRYPOINT ["R", "-e", "pr <- plumber::plumb(commandArgs()[4]); pr$run(host='0.0.0.0', port=as.numeric(Sys.getenv('PORT')))"]
        
CMD ["api.R"]
