# caddy-netcup

[Caddy](https://caddyserver.com/) built with the [caddy-dns/netcup](https://github.com/caddy-dns/netcup) DNS plugin.

```sh
docker pull ghcr.io/dadav/caddy-netcup:latest
```

## Tags

Images are published only from `main`. Tags are derived from the Caddy version in the final `FROM` line of the `Dockerfile`. For Caddy `2.11.7` built from commit `5ebfc84` you get:

| Tag             | Moves?                                         |
| --------------- | ---------------------------------------------- |
| `2.11.7-5ebfc84` | Never. One tag per build.                      |
| `2.11.7`        | Rebuilds of the same Caddy version (plugin/base updates). |
| `2.11`          | Newest `2.11.x`.                               |
| `2`             | Newest `2.x.y`.                                |
| `latest`        | Newest build on `main`.                        |

For fully reproducible deployments, pin `X.Y.Z-<sha>` or an image digest.

The netcup plugin version is pinned via `NETCUP_VERSION` in the `Dockerfile` and updated by Renovate.

Older tags like `2.10.2-1` come from a previous manual git-tag scheme and are no longer produced.
