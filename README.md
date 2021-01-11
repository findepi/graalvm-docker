# GraalVM docker container

![ci](https://github.com/findepi/graalvm-docker/workflows/ci/badge.svg)
[![Docker Automated build](https://img.shields.io/docker/automated/findepi/graalvm.svg)](https://hub.docker.com/r/findepi/graalvm/)

## What’s inside

The image is similar to [`openjdk`](https://hub.docker.com/_/openjdk/) except,
of course, this one comes with Graal VM.

## Usage

Since GraalVM's binaries are on the `$PATH`, you can invoke them easily. Or build a
derived image based on this.

```
$ docker run --rm findepi/graalvm java -version
openjdk version "1.8.0_222"
OpenJDK Runtime Environment (build 1.8.0_222-20190711120915.buildslave.jdk8u-src-tar--b08)
OpenJDK 64-Bit GraalVM CE 19.x.x (build 25.222-b08-jvmci-19.2-b02, mixed mode)
```

… and for the polyglot image:

```
$ docker run -i --rm findepi/graalvm:polyglot graalpython /dev/stdin <<<"print([42, 2**42])"
Please note: This Python implementation is in the very early stages, and can run little more than basic benchmarks at this point.
[42, 4398046511104]
```

… and for the Java 11 (here: non-polyglot) image:

```
$ docker run --rm findepi/graalvm:java11 java -version
openjdk version "11.0.5" 2019-10-15
OpenJDK Runtime Environment (build 11.0.5+10-jvmci-19.3-b05-LTS)
OpenJDK 64-Bit GraalVM CE 19.x.x (build 11.0.5+10-jvmci-19.3-b05-LTS, mixed mode, sharing)
```

See all available images at https://hub.docker.com/r/findepi/graalvm/tags.

## License

- code in this repository -- see [LICENSE](LICENSE)
- pre-built container -- see https://github.com/oracle/graal#license
