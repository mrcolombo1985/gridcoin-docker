#!/bin/bash

set -euo pipefail

docker login

# build the build-deps stage:
docker build --target grc-arm32v7-build-deps-stretch \
       --cache-from=grc-arm32v7-build-deps-stretch \
       --tag grc-arm32v7-build-deps-stretch .

# build the devtime stage, using cached build-deps stage:
docker build --target grcarm32v7devstretch \
       --cache-from=grc-arm32v7-build-deps-stretch \
       --tag gridcoincommunity/grc-arm32v7-dev:stretch .

# push the new version:
docker push gridcoincommunity/grc-arm32v7-dev:stretch
