# GraalVM docker container

[![Build Status](https://travis-ci.org/findepi/graalvm-docker.svg?branch=master)](https://travis-ci.org/findepi/graalvm-docker)
[![Docker Automated build](https://img.shields.io/docker/automated/findepi/graalvm.svg)](https://hub.docker.com/r/findepi/graalvm/)

## What’s inside

The image is similar to [`openjdk`](https://hub.docker.com/_/openjdk/) except,
of course, this one comes with Graal VM.

## Usage

Since GraalVM's binaries are on the `$PATH`, you can invoke them. Or build a
derived image based on this.

```
# docker run findepi/graalvm java -version
openjdk version "1.8.0_161"
OpenJDK Runtime Environment (build 1.8.0_161-12)
GraalVM 1.0.0-rc1 (build 25.71-b01-internal-jvmci-0.42, mixed mode)
```
