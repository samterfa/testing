FROM rocker/shiny-verse

<<<<<<< HEAD
# RUN install2.r gargle
#RUN installGithub.r rstudio/plumber

RUN install2.r plumber htmlTable
=======
# Allow copying into Shiny server directories.
RUN chmod 777 /srv/shiny-server/
RUN chmod 777 /usr/bin/
>>>>>>> 13ce9146934c99fe7397832decbf06465bf9363c

COPY shiny-customized.config /etc/shiny-server/shiny-server.conf
COPY global.R /srv/shiny-server/global.R
COPY app.R /srv/shiny-server/app.R
COPY startup.sh /srv/shiny-server/startup.sh
RUN chmod +x /srv/shiny-server/startup.sh

VOLUME ["/myvolume"]

# Enable logs.
ENV SHINY_LOG_STDERR=1 

EXPOSE 8080

USER shiny

CMD ["/srv/shiny-server/startup.sh"]