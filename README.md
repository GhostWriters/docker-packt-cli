
# Container for Packt daily download script #

This container fires up an alpine linux docker running cron, scheduled to claim the daily free book once per night at 1am.

## Run ##

Run with:

```
docker run -d --name packt --rm \
    -e PACKT_EMAIL=xxx@xxx.xxx \
    -e PACKT_PASSWORD=xxxxxxxx \
    -e PACKT_DOWNLOAD_FORMATS=pdf, epub, mobi, code \
    -e PACKT_ANTICAPTCHA_KEY=xxxxxxxxxxxx \
    -v /opt/packt/config:/config \
    -v /opt/packt/data:/data \
    ghostwriters/docker-packt
```

## Volumes and variables ##

Volumes:
  - /config, where we can find a configFile.cfg, where log is stored, where google auth details go
  - /data, where files are downloaded to

OPTIONAL Variables:
  - PACKT_EMAIL, email address registered with Packt account
  - PACKT_PASSWORD, password for Packt account
  - PACKT_DOWNLOAD_BOOK_TITLES, specify individual books

If variables are set, they overwrite what is already in config file at container startup.
If not set, config file will be left alone.

## Special Thanks  ##

- [biwhite](https://github.com/biwhite)  for creating the intital docker container.
- [igbt6](https://github.com/igbt6) for providing the upstream script available at https://github.com/igbt6/Packt-Publishing-Free-Learning
 	  
