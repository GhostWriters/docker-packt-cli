# docker-packt-cli

[![GitHub contributors](https://img.shields.io/github/contributors/GhostWriters/docker-packt-cli.svg?style=flat-square&color=607D8B)](https://github.com/GhostWriters/docker-packt-cli/graphs/contributors)
[![GitHub last commit main](https://img.shields.io/github/last-commit/GhostWriters/docker-packt-cli/main.svg?style=flat-square&color=607D8B&label=code%20committed)](https://github.com/GhostWriters/docker-packt-cli/commits/main)
[![GitHub license](https://img.shields.io/github/license/GhostWriters/docker-packt-cli.svg?style=flat-square&color=607D8B)](https://github.com/GhostWriters/docker-packt-cli/blob/main/LICENSE)
[![Renovate](https://img.shields.io/badge/renovate-enabled-brightgreen.svg?style=flat-square&color=607D8B)](https://github.com/renovatebot/renovate)

A Docker container for automatically downloading a free eBook each day from Packt publishing using the `packt-cli` tool.

## Usage

To run the `docker-packt-cli` container, use the following `docker run` command:

```docker
docker run -d \
    --name=packt --rm \
    -e PACKT_EMAIL=<xxx@xxx.xxx> \
    -e PACKT_PASSWORD=<password> \
    -e PACKT_DOWNLOAD_FORMATS=pdf,epub,mobi,code \
    -e PACKT_ANTICAPTCHA_KEY=<key> \
    -e PUID=<UID> \
    -e PGID=<GID> \
    -v /home/user/packt/config:/config \
    -v /home/user/packt/books:/data \
    --restart unless-stopped \
    ghcr.io/ghostwriters/docker-packt-cli/docker-packt-cli:latest
```

You will need to replace `<xxx@xxx.xxx>` and `<password>` with your Packt account email and password, respectively. Additionally, you can customize the output formats of the downloaded books by modifying the `PACKT_DOWNLOAD_FORMATS` environment variable. The default formats are `pdf`, `epub`, `mobi`, and `code`.

To automatically solve the CAPTCHA, you will need an AntiCaptcha API key, which you can set by attaching the `-e PACKT_ANTICAPTCHA_KEY=<key>` flag to your docker run command.

You can mount two volumes to persist the Packt credentials and store the downloaded books in a directory on your host system. The `/config` directory will store your Packt credentials, and the `/data` directory will store the downloaded books. You can change the paths of the host directories by modifying the values after the `-v` flag.

Once you run the container, it will automatically download a free eBook each day from Packt publishing and store the files in the `/home/user/packt/books` directory on your host system.

## Contributing

If you have any feedback or run into issues with the container, please open an [issue](https://github.com/GhostWriters/docker-packt-cli/issues/new) on the GitHub repository. If you would like to contribute to this project, you can submit a [pull request](https://github.com/GhostWriters/docker-packt-cli/pulls).

## Special Thanks

- [packt-cli](https://gitlab.com/packt-cli/packt-cli) for maintaining the package to handle the downloading.
- [LinuxServer.io](https://www.linuxserver.io) for maintaining the Docker image used in this project.

## License

This project is licensed under the MIT License. See the [LICENSE](https://github.com/GhostWriters/docker-packt-cli/blob/main/LICENSE) file for more details.
