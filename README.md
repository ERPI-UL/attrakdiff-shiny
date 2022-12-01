# Shiny-server 
**Fiche descriptive**

IaaS ERPI / ENSGSI : **ERPI**  
Recherche / Pédagogie: **Recherche**  
nom DNS interne : **erpi-s-shiny-01.erpi.site.univ-lorraine.fr** 
nom DNS externe : **shiny.lf2l.fr**  
Reseau: **Interne**
___
### To run a container with Shiny Server:

```sh
docker-compose up
```

Then visit `http://localhost` (i.e., `http://localhost:80`) in a web browser. If you have an app in `/srv/shinyapps/appdir`, you can run the app by visiting http://localhost/appdir/.

#### To add a Shiny app:

1. Uncomment the last line of `docker-compose.yml`.
1. Place the app in `mountpoints/apps/the-name-of-the-app`, replacing `the-name-of-the-app` with your app's name.

If you have an app in `mountpoints/apps/appdir`, you can run the app by visiting http://localhost/appdir/.


#### Logs

The example `docker-compose` file will create a persistent volume for server logs, so that log data will persist across instances where the container is running. To access these logs, while the container is running, run `docker exec -it shiny bash` and then `ls /var/log/shiny-server` to see the available logs. To copy these logs to the host system for inspection, while the container is running, you can use, for example, `docker cp shiny:/var/log/shiny-server ./logs_for_inspection`.


## Docker Hub documentation
https://hub.docker.com/r/rocker/shiny-verse
https://hub.docker.com/r/rocker/shiny
