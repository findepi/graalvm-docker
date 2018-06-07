#!/usr/bin/env bash

set -xeuo pipefail

docker run --rm "${IMAGE_NAME}:latest" java -version 2>&1 | grep GraalVM
