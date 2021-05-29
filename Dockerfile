FROM rocker/shiny-verse

# Allow copying into Shiny server directories.
RUN chmod 777 /srv/shiny-server/
RUN chmod 777 /usr/bin/

# Enable logs.
ENV SHINY_LOG_STDERR=1 


COPY global.R /srv/shiny-server/global.R
COPY app.R /srv/shiny-server/app.R

WORKDIR /srv/shiny-server/

#ENTRYPOINT \
#echo "mySecret = $mySecret" >> /srv/shiny-server/.Renviron;

CMD \
/usr/bin/shiny-server;