FROM rocker/shiny-verse

# Allow copying into Shiny server directories.
RUN chmod 777 /srv/shiny-server/
RUN chmod 777 /usr/bin/

RUN echo "mySecret = $mySecret" >> /srv/shiny-server/.Renviron

COPY shiny-customized.config /etc/shiny-server/shiny-server.conf
COPY global.R /srv/shiny-server/global.R
COPY app.R /srv/shiny-server/app.R

# Enable logs.
ENV SHINY_LOG_STDERR=1 

EXPOSE 8080

USER shiny

# avoid s6 initialization
# see https://github.com/rocker-org/shiny/issues/79
CMD ["/usr/bin/shiny-server"]