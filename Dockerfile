# get shiny server plus tidyverse packages image
FROM rocker/shiny-verse:latest

# system libraries of general use
RUN apt update \
  && apt install -y --no-install-recommends \
    libxml2-dev \
    libgit2-dev \
    libpng-dev \
    libudunits2-dev \
    libgdal-dev

# install R packages required 
RUN install2.r firebase

RUN chmod 777 /srv/shiny-server/
RUN chmod 777 /usr/bin/

# Copy configuration files into the Docker image
COPY shiny-server.conf  /etc/shiny-server/shiny-server.conf
COPY app.R /srv/shiny-server/app.R
COPY shiny-server.sh /usr/bin/shiny-server.sh
COPY .Renviron /srv/shiny-server/.Renviron

WORKDIR /srv/shiny-server/

# Enable logs.
ENV SHINY_LOG_STDERR=1

USER shiny

EXPOSE 3838

CMD ["/usr/bin/shiny-server"]

