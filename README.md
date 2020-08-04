# Gurobi Docker images

## Docker Hub

https://hub.docker.com/repository/docker/sebwink/gurobi

## Local testing

For testing purposes, on a host where you possess a named user license, build the image on that host and (on that host) run as follows:

```sh
docker run -it --mac-address <your-mac-address> --pid host --rm -v <path-to-directory-with-gurobi-license-file>:/gurobi/lic sebwink/gurobi:9.0.2
```
