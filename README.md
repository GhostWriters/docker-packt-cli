
# Container for Packt daily download script #

This container fires up an alpine linux docker running cron, scheduled to claim the daily free book once per night at 1am.

## Run ##

Run with:

```
docker run -d --name packt --rm \
    -e PACKT_EMAIL=<xxx@xxx.xxx> \
    -e PACKT_PASSWORD=<password> \
    -e PACKT_DOWNLOAD_FORMATS=pdf, epub, mobi, code \
    -e PACKT_ANTICAPTCHA_KEY=<key> \
    -e PUID=<UID> \
    -e PGID=<GID> \
    -e TZ=<timezone> \
    -v /home/user/packt/config:/config \
    -v /home/user/packt/books:/data \
    ghostwriters/docker-packt
```

## Volumes and variables ##

Volumes:
  - /config, where the configFile.cfg and log file are placed
  - /data, where files are downloaded to

OPTIONAL: Variables:
  - PACKT_EMAIL, email address registered with Packt account
  - PACKT_PASSWORD, password for Packt account
  - PACKT_DOWNLOAD_FORMATS=pdf, epub, mobi, code
  - PACKT_ANTICAPTCHA_KEY= get an api key from https://anti-captcha.com
  - PACKT_DOWNLOAD_BOOK_TITLES, specify individual books

If variables are set, they overwrite what is already in the configFile.cfg file at container startup.
If not set, the config file will be left alone.
#### Anticaptcha key required to download the daily book. ####

## Special Thanks  ##

- [biwhite](https://github.com/biwhite)  for creating the intital docker container.
- [igbt6](https://github.com/igbt6) for providing the upstream script available at https://github.com/igbt6/Packt-Publishing-Free-Learning
 	  
