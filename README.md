# Docker MiniUPnPc

This images provides a minimal image containing [MiniUPnPc][miniupnp], the MiniUPnP client.

MiniUPnPc's `upnpc` command allows for opening and closing ports via UPnP.

Using `upnpc` in a Docker container makes it possible to add UPnP support for applications in a Docker Compose stack that might not support it themselves.

[miniupnp]: https://miniupnp.tuxfamily.org/

## Installation

The container image is available from [Docker Hub][docker-hub] and [GitHub Packages][github-packages]:

```python
xanderxaj/miniupnpc           # Docker Hub
ghcr.io/xanderxaj/miniupnpc   # GitHub Packages
```

## Security

The image is automatically rebuilt every day to ensure the latest versions of MiniUPnPc and the base image are pulled in.

The images are signed using [Cosign][cosign] and the [Fulcio public CA][fulcio].
The images can be verified by running:

```shell
cosign verify --certificate-oidc-issuer 'https://token.actions.githubusercontent.com' --certificate-identity-regexp 'https://github.com/XanderXAJ/docker-miniupnpc/.+@refs/heads/main' xanderxaj/miniupnpc
cosign verify --certificate-oidc-issuer 'https://token.actions.githubusercontent.com' --certificate-identity-regexp 'https://github.com/XanderXAJ/docker-miniupnpc/.+@refs/heads/main' ghcr.io/xanderxaj/miniupnpc
```

[cosign]: https://github.com/sigstore/cosign
[fulcio]: https://github.com/sigstore/fulcio

## Usage

Run the container image as if it is the `upnpc` command:

```shell
# Display usage information (technically this doesn't need host networking but it's kept for consistency)
docker run --rm --net=host xanderxaj/miniupnpc -h

# Forward internal TCP port 1234 to external port 12345
docker run --rm --net=host xanderxaj/miniupnpc -r 1234 12345 TCP

# Delete any forwarding rules exposed on external TCP port 12345 (deleting the previous forwarding rule)
docker run --rm --net=host xanderxaj/miniupnpc -N 12345 12345 TCP
```

Since UPnP is a multicast protocol, the simplest way to ensure that the Docker container can both contact the router and apply the correct IP address to the port forwarding rule is to use host networking (e.g. as specified in `docker-compose.yaml` or by using `docker --net=host ...`).

[docker-hub]: https://hub.docker.com/r/xanderxaj/miniupnpc
[github-packages]: https://github.com/XanderXAJ/docker-miniupnpc/pkgs/container/miniupnpc

### Build and run locally

If you prefer to build and run it locally, a Docker Compose file has been provided to make it simple:

```shell
# Display usage information
docker compose run --build upnp -h
```
