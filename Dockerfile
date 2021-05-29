FROM rocker/shiny-verse

# Allow copying into Shiny server directories.
RUN chmod 777 /srv/shiny-server/
RUN chmod 777 /usr/bin/

# Enable logs.
ENV SHINY_LOG_STDERR=1 

EXPOSE 8080

COPY global.R /srv/shiny-server/global.R
COPY app.R /srv/shiny-server/app.R

WORKDIR /srv/shiny-server/

CMD ["/usr/bin/shiny-server"]