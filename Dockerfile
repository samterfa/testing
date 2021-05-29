FROM rocker/tidyverse

#### Install CRAN or Github packages not included in rocker/tidyverse container.
# RUN install2.r plumber  # Add more packages separated by spaces.

RUN installGithub.r rstudio/plumber # Uncomment to add Github packages.

#### Copies the files in this directory to files in your container.
COPY [".", "./"]

EXPOSE 8000 80 443

#### This starts your R-powered service.
ENTRYPOINT ["R", "-e", "pr <- plumber::plumb(rev(commandArgs())[1]); pr$run(host='0.0.0.0', port=8000)"]

CMD ["Plumber.R"]
