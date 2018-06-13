
# Container for Packt daily download script #

This container fires up an alpine linux docker running cron, scheduled to claim the daily free book, and download whatever's missing from your data folder once per night.

## Run ##

Run with:

```
docker run -d --name packt --rm \
    -e PACKTEMAIL=xxx@xxx.xxx \
    -e PACKTPASSWORD=xxxxxxxx \
    -v /opt/packt/config:/config \
    -v /opt/packt/data:/data \
    ghostwriters/docker-packt
```

## Volumes and variables ##

Volumes:
  - /config, where we can find a configFile.cfg, where log is stored, where google auth details go
  - /data, where files are downloaded to

OPTIONAL Variables:
  - PACKTEMAIL, email address registered with Packt account
  - PACKTPASSWORD, password for Packt account

If variables are set, they overwrite what is already in config file at container startup.
If not set, config file will be left alone.

## Special Thanks  ##

- [biwhite](https://github.com/biwhite)  for creating the intital docker container.
- [igbt6](https://github.com/igbt6) for providing the upstream script available at https://github.com/igbt6/Packt-Publishing-Free-Learning
 	  
