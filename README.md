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
    -e TZ=<timezone> \
    -v /home/user/packt/config:/config \
    -v /home/user/packt/books:/data \
    --restart unless-stopped
    ghcr.io/ghostwriters/docker-packt-cli:latest
```

You will need to replace `<xxx@xxx.xxx>` and `<password>` with your Packt account email and password, respectively. Additionally, you can customize the output formats of the downloaded books by modifying the `PACKT_DOWNLOAD_FORMATS` environment variable. The default formats are `pdf`, `epub`, `mobi`, and `code`.

To automatically solve the CAPTCHA, you will need an [AntiCaptcha](https://anti-captcha.com/) API key, which you can set by attaching the `-e PACKT_ANTICAPTCHA_KEY=<key>` flag to your docker run command.

You can mount two volumes to persist the Packt credentials and store the downloaded books in a directory on your host system. The `/config` directory will store your Packt credentials, and the `/data` directory will store the downloaded books. You can change the paths of the host directories by modifying the values after the `-v` flag.

Once you run the container, it will automatically download a free eBook each day from Packt publishing and store the files in the `/home/user/packt/books` directory on your host system.

If you would prefer to use an alternative to ghcr.io, you can use the image hosted on [Docker Hub](https://hub.docker.com/repository/docker/ghostwriters/docker-packt-cli) `ghostwriters/docker-packt-cli:latest`,

## GitHub Actions Used

- [actions/checkout](https://github.com/actions/checkout) - Action for checking out code from a repository.
- [actions/first-interaction](https://github.com/actions/first-interaction) - Action to identify a user's first contribution to a repository.
- [actions/upload-artifact](https://github.com/actions/upload-artifact) - Action for uploading artifacts for later use in the workflow.
- [amannn/action-semantic-pull-request](https://github.com/amannn/action-semantic-pull-request) - Action for enforcing conventional commit messages and semantic versioning.
- [anothrNick/github-tag-action](https://github.com/anothrNick/github-tag-action) - Action for automatically creating a new tag and release based on version numbers.
- [docker/build-push-action](https://github.com/docker/build-push-action) - Action for building and pushing Docker images.
- [docker/login-action](https://github.com/docker/login-action) - Action for logging in to a Docker registry.
- [docker/metadata-action](https://github.com/docker/metadata-action) - Action for adding Docker metadata to a GitHub repository.
- [docker/setup-buildx-action](https://github.com/docker/setup-buildx-action) - Action for setting up Buildx on your Github Actions runner.
- [docker/setup-qemu-action](https://github.com/docker/setup-qemu-action) - Action for setting up QEMU for cross-builds.
- [peter-evans/create-pull-request](https://github.com/peter-evans/create-pull-request) - Action for creating pull requests programmatically.
- [softprops/action-gh-release](https://github.com/softprops/action-gh-release) - Action for creating GitHub releases.
- [stefanzweifel/git-auto-commit-action](https://github.com/stefanzweifel/git-auto-commit-action) - Action for automatically committing changes to a repository.
- [oxsecurity/megalinter](https://github.com/oxsecurity/megalinter) - Action for linting multiple languages at once.

## Contributing

If you have any feedback or run into issues with the container, please open an [issue](https://github.com/GhostWriters/docker-packt-cli/issues/new) on the GitHub repository. If you would like to contribute to this project, you can submit a [pull request](https://github.com/GhostWriters/docker-packt-cli/pulls).

## Special Thanks

- [packt-cli](https://gitlab.com/packt-cli/packt-cli) for maintaining the package to handle the downloading.
- [LinuxServer.io](https://www.linuxserver.io) for maintaining the Docker image used in this project.

## License

This project is licensed under the MIT License. See the [LICENSE](https://github.com/GhostWriters/docker-packt-cli/blob/main/LICENSE) file for more details.
