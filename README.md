# Docker MiniUPnPc

This images provides a minimal image containing [MiniUPnPc][miniupnp], the MiniUPnP client.

MiniUPnPc's `upnpc` command allows for opening and closing ports via UPnP. By building it in to a Docker container, it becomes possible to perform UPnP port operations as part of a Docker Compose stack for applications that might not do it themselves.

[miniupnp]: https://miniupnp.tuxfamily.org/

## Usage

Build the image:

```shell
docker compose build
```

Run the image as if it is the `upnpc` command:

```shell
docker compose run upnp -r 1234 12345 TCP
```

Since UPnP is a multicast protocol, the simplest way to ensure that the Docker container can both contact the router and result in forwarding to the correct IP address is to use host networking (e.g. as specified in `docker-composr.yaml` or by using `docker --net=host ...`).
