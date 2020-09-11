# Gurobi Docker images

This repository defines, build and publishes base images for the [Gurobi](https://www.gurobi.com/de/) mathematical programming solver.

## Versioning

This repository builds the following images:

* *sebwink/gurobi* : Images always correspond to the master branch of this repository and contain a specific Gurobi version specified via the image tag. E.g. to use Gurobi version 9.0.2 with the image corresponding to the current master, the image to use would be *sebwink/gurobi:9.0.2*
* *sebwink/gurobi-\<version\>* : Images for a particular Gurobi version where the image tags represent git history. The *latest* tag will correspond to the current
  master and thus *sebwink/gurobi-\<version\>:latest* is equivalent to *sebwink/gurobi:<version>*. Images based on other git commits are accessible by specifiying the git hash as image tag: *sebwink/gurobi-\<version\>:\<git-hash\>* to get the image with the specified Gurobi version build from the specified git hash.
  
Which Gurobi versions are build is specified via the [GUROBI_VERSIONS](https://github.com/sebwink/gurobi-docker/blob/master/GUROBI_VERSIONS) file. In case you need a specific Gurobi versions pull requests specifying the particular
version in that file are welcome.

## Intended usage

The images are meant to be used in conjunction with [floating license](https://www.gurobi.com/documentation/9.0/quickstart_linux/creating_a_token_server_cl.html#subsection:clientlicensetoken) for the Gurobi solver. When running, you need to provide the license file path
via a volume and make sure the license server specified in the latter is reachable from within the running Docker container.

```sh
docker run --rm -it \
  -v <path-to-directory-with-gurobi-license-file>:/gurobi/lic \
  sebwink/gurobi:9.0.2
```

## Local testing

For testing purposes, on a host where you possess a named user license, build the image on that host and (on that host), run the image like so:

```sh
docker run --rm -it \
  --mac-address <your-mac-address> \
  --pid host \
  -v <path-to-directory-with-gurobi-license-file>:/gurobi/lic \
  sebwink/gurobi:9.0.2
```
The previous command would put you in the Gurobi shell.

## Registries

### Docker Hub

https://hub.docker.com/repository/docker/sebwink/gurobi

### GitHub Packages

https://github.com/sebwink/gurobi-docker/packages
