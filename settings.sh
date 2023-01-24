#!bash

export IMAGE_NAME=findepi/graalvm # by necessity, this is also set in derived images' FROM directive
export GRAAL_VERSION="22.3.1"
export JDK_VERSION="${JDK_VERSION-java11}"
export DEFAULT="${DEFAULT-false}"
