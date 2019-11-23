#!/usr/bin/env bash

set -xeuo pipefail

docker run --rm "${IMAGE_NAME}:${GRAAL_VERSION}-${JDK_VERSION}" java -version 2>&1 | tee /dev/stderr | grep GraalVM
