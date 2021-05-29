FROM rocker/shiny-verse

# Allow copying into Shiny server directories.
RUN chmod 777 /srv/shiny-server/
RUN chmod 777 /usr/bin/

COPY shiny-customized.config /etc/shiny-server/shiny-server.conf
COPY global.R /srv/shiny-server/global.R
COPY app.R /srv/shiny-server/app.R
COPY my_commands.sh /srv/shiny-server/my_commands.sh

RUN chmod +x /srv/shiny-server/my_commands.sh

# Enable logs.
ENV SHINY_LOG_STDERR=1 

EXPOSE 8080

USER shiny

# avoid s6 initialization
# see https://github.com/rocker-org/shiny/issues/79
#### CMD ["/srv/shiny-server/my_commands.sh"]

CMD \

echo "mySecret = $mySecret" >> /srv/shiny-server/.Renviron; \

sh -c /usr/bin/shiny-server