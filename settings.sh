#!bash

export IMAGE_NAME=findepi/graalvm # by necessity, this is also set in derived images' FROM directive
export GRAAL_VERSION="23.0.1"
export JDK_VERSION="${JDK_VERSION-java17}"
export DEFAULT_IMAGE="${DEFAULT_IMAGE-false}"

if [ "${JDK_VERSION}" = "java17" ]; then
    GRAAL_JDK_VERSION="17.0.8"
elif [ "${JDK_VERSION}" = "java20" ]; then
    GRAAL_JDK_VERSION="20.0.2"
else
    echo "Unknown JDK_VERSION ${JDK_VERSION}" >&2
    exit 1
fi
export GRAAL_JDK_VERSION
