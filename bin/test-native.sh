#!/usr/bin/env bash

set -xeuo pipefail

docker run -i --name graalvm-native --volume sandbox:/sandbox "${IMAGE_NAME}:${GRAAL_VERSION}-${JDK_VERSION}-native" bash <<"DOCKER_CMD"
PS4="+++ "
set -xeuo pipefail
cd /sandbox
cat > Hello.java <<"CODE"
public class Hello {
    public static void main(String[] args) {
        System.out.println(new java.math.BigInteger(args[0]).pow(17));
    }
}
CODE
javac Hello.java
native-image Hello
rm Hello.*
set +x -v
test "$(./hello 37)" = "456487940826035155404146917" # 37^17
DOCKER_CMD

# Verify native image's nativeness & independence
test "$(docker run --rm --volumes-from graalvm-native debian:stable-slim /sandbox/hello 37)" = "456487940826035155404146917"

# Cleanup
docker rm -f graalvm-native
