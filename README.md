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
$ docker run findepi/graalvm java -version
openjdk version "1.8.0_172"
OpenJDK Runtime Environment (build 1.8.0_172-20180625212755.graaluser.jdk8u-src-tar-g-b11)
GraalVM 1.0.0-rc8 (build 25.71-b01-internal-jvmci-0.48, mixed mode)
```

… and for the polyglot image:

```
$ docker run -i findepi/graalvm:polyglot bash -c 'graalpython /dev/stdin <<<"print([42, 2**42])"'
Please note: This Python implementation is in the very early stages, and can run little more than basic benchmarks at this point.
[42, 4398046511104]
```

## License

- code in this repository -- see [LICENSE](LICENSE)
- pre-built container -- see https://github.com/oracle/graal#license
