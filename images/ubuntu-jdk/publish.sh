#!/bin/bash
set -e
. ./build.sh
docker push "$IMAGE"