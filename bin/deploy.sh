#!/usr/bin/env bash

set -xeuo pipefail

set +x -v
echo "$DOCKER_PASSWORD" | docker login -u "$DOCKER_USERNAME" --password-stdin
set +v -x

docker push "${IMAGE_NAME}:${JDK_VERSION}"
docker push "${IMAGE_NAME}:${JDK_VERSION}-native"
if "${BUILD_POLYGLOT}"; then
    docker push "${IMAGE_NAME}:${JDK_VERSION}-polyglot"
    # When there is no polyglot image, the "all" image does not make much sense.
    docker push "${IMAGE_NAME}:${JDK_VERSION}-all"
fi

if [ "${DEFAULT_IMAGE}" = "true" ]; then
    docker push "${IMAGE_NAME}:latest"
    docker push "${IMAGE_NAME}:native"
    if "${BUILD_POLYGLOT}"; then
        docker push "${IMAGE_NAME}:polyglot"
        # When there is no polyglot image, the "all" image does not make much sense.
        docker push "${IMAGE_NAME}:all"
    fi
fi
