# GraalVM docker container

[![Build Status](https://travis-ci.org/findepi/graalvm-docker.svg?branch=master)](https://travis-ci.org/findepi/graalvm-docker)
[![Docker Automated build](https://img.shields.io/docker/automated/findepi/graalvm.svg)](https://hub.docker.com/r/findepi/graalvm/)

## What’s inside

The image is similar to [`openjdk`](https://hub.docker.com/_/openjdk/) except,
of course, this one comes with Graal VM.

## Usage

Since GraalVM's binaries are on the `$PATH`, you can invoke them easily. Or build a
derived image based on this.

```
$ docker run --rm findepi/graalvm java -version
openjdk version "1.8.0_202"
OpenJDK Runtime Environment (build 1.8.0_202-20190206132807.buildslave.jdk8u-src-tar--b08)
OpenJDK GraalVM CE 1.0.0-rc42 (build 25.202-b08-jvmci-0.56, mixed mode)
```

… and for the polyglot image:

```
$ docker run -i --rm findepi/graalvm:polyglot graalpython /dev/stdin <<<"print([42, 2**42])"
Please note: This Python implementation is in the very early stages, and can run little more than basic benchmarks at this point.
[42, 4398046511104]
```

## License

- code in this repository -- see [LICENSE](LICENSE)
- pre-built container -- see https://github.com/oracle/graal#license
