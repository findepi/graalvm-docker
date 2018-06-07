#!/usr/bin/env bash

set -veuo pipefail

docker run --rm "${IMAGE_NAME}:latest" java -version 2>&1 | grep GraalVM
