FROM rocker/shiny-verse

# Allow copying into Shiny server directories.
RUN chmod 777 /srv/shiny-server/
RUN chmod 777 /usr/bin/

RUN echo mySecret = $mySecret >> /srv/shiny-server/.Renviron 

COPY shiny-customized.config /etc/shiny-server/shiny-server.conf
COPY global.R /srv/shiny-server/global.R
COPY app.R /srv/shiny-server/app.R
### COPY startup.sh /srv/shiny-server/startup.sh
### RUN chmod +x /srv/shiny-server/startup.sh

# Enable logs.
ENV SHINY_LOG_STDERR=1 

EXPOSE 8080

USER shiny

### CMD ["/srv/shiny-server/startup.sh"]

ENTRYPOINT ["/usr/bin/shiny-server"]