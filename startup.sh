#!/bin/sh
echo "mySecret = $mySecret" >> /srv/shiny-server/.Renviron;
sh -c /usr/bin/shiny-server;
