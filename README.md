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
openjdk version "17.0.8" 2023-07-18
OpenJDK Runtime Environment GraalVM CE 17.0.8+7.1 (build 17.0.8+7-jvmci-23.0-b15)
OpenJDK 64-Bit Server VM GraalVM CE 17.0.8+7.1 (build 17.0.8+7-jvmci-23.0-b15, mixed mode, sharing)
```

… and for the polyglot image:

```
$ docker run -i --rm findepi/graalvm:polyglot python --version
GraalPy 3.10.8 (GraalVM CE Native 23.0.1)

$ docker run -i --rm findepi/graalvm:polyglot python -c 'print([42, 2**42])'
[42, 4398046511104]
```

… and for the Java 20 (here: non-polyglot) image:

```
$ docker run --rm findepi/graalvm:java20 java -version
openjdk version "20.0.2" 2023-07-18
OpenJDK Runtime Environment GraalVM CE 20.0.2+9.1 (build 20.0.2+9-jvmci-23.0-b15)
OpenJDK 64-Bit Server VM GraalVM CE 20.0.2+9.1 (build 20.0.2+9-jvmci-23.0-b15, mixed mode, sharing)
```

See all available images at https://hub.docker.com/r/findepi/graalvm/tags.

## License

- code in this repository -- see [LICENSE](LICENSE)
- pre-built container -- see https://github.com/oracle/graal#license
