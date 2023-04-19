# Container for Packt daily download script

[![GitHub contributors](https://img.shields.io/github/contributors/GhostWriters/docker-packt-cli.svg?style=flat-square&color=607D8B)](https://github.com/GhostWriters/docker-packt-cli/graphs/contributors)
[![GitHub last commit main](https://img.shields.io/github/last-commit/GhostWriters/docker-packt-cli/main.svg?style=flat-square&color=607D8B&label=code%20committed)](https://github.com/GhostWriters/docker-packt-cli/commits/main)
[![GitHub license](https://img.shields.io/github/license/GhostWriters/docker-packt-cli.svg?style=flat-square&color=607D8B)](https://github.com/GhostWriters/docker-packt-cli/blob/main/LICENSE)
[![Renovate](https://img.shields.io/badge/renovate-enabled-brightgreen.svg?style=flat-square&color=607D8B)](https://github.com/renovatebot/renovate)

These instructions detail how to set up a docker container that includes a scheduled cron job to automatically claim the daily free
book from Packt at 1am each night. Packt offers free learning e-books each day, and you can find more information about this service
at <https://www.packtpub.com/packt/offers/free-learning>.
To learn more about docker, please visit the official documentation at <https://docs.docker.com/get-started/overview/>.
If you're new to cron jobs, you can learn more about them on the Unix/Linux manpages at <https://help.ubuntu.com/community/CronHowto>.
For more information about the code used in this container, please see the
project page at <https://gitlab.com/packt-cli/packt-cli>.

## Run

Run with:

```docker
docker run -d \
  --name=packt --rm \
  -e PACKT_EMAIL=<xxx@xxx.xxx> \
  -e PACKT_PASSWORD=<password> \
  -e PACKT_DOWNLOAD_FORMATS=pdf, epub, mobi, code \
  -e PACKT_ANTICAPTCHA_KEY=<key> \
  -e PUID=<UID> \
  -e PGID=<GID> \
  -e TZ=<timezone> \
  -v /home/user/packt/config:/config \
  -v /home/user/packt/books:/data \
  --restart unless-stopped \
  ghostwriters/docker-packt-cli:latest
```

## Volumes and variables

Volumes:

- /config, where the configFile.cfg and log file are placed
- /data, where files are downloaded to

OPTIONAL: Variables:

- PACKT_EMAIL - email address registered with Packt account
- PACKT_PASSWORD - password for Packt account
- PACKT_DOWNLOAD_FORMATS - pdf, epub, mobi, code
- PACKT_ANTICAPTCHA_KEY - get an api key from [anti-captcha.com](https://anti-captcha.com)
- PACKT_DOWNLOAD_BOOK_TITLES - specify individual books

If variables are set, they overwrite what is already in the configFile.cfg file
at container startup. If not set, the config file will be left alone.

**NOTE:** Anticaptcha key required to download the daily book.

## Special Thanks

- [packt-cli](https://gitlab.com/packt-cli/packt-cli) for maintaining the package to handle the downloading.
- [LinuxServer.io](https://www.linuxserver.io) for maintaining most Docker images used in this project.
