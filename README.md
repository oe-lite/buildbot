# OE-lite.org Buildbot CI

## Buildbot Master

To build build the buildbot master docker image, run the following command in
the master directory:

```sh
docker build -t buildbot-master .
```

To start a buildbot master docker container:

```sh
docker run -p 8010:8010 -d --name=buildbot buildbot-master
```

It will expose the buildbot service on host port 8010.  Test it on
http://localhost:8010/

To check the status (log output) of the buildbot master:

```sh
docker logs buildbot
```

## Buildbot Slaves

To build the buildbot slave docker image, run the following command in the
slave directory:

```sh
docker build -t buildbot-slave .
```

To start a buildbot slave docker container:

```sh
docker --privileged -d --name=buildbot-slave buildbot-slave
```
