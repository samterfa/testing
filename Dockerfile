FROM rocker/shiny-verse

# RUN install2.r gargle
#RUN installGithub.r rstudio/plumber

RUN install2.r plumber htmlTable

ENTRYPOINT ["R", "-e", "pr <- plumber::plumb(rev(commandArgs())[1]); pr$run(host='0.0.0.0', port=8000)"]

CMD ["Plumber.R"]