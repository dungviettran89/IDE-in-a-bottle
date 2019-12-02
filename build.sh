#!/bin/bash
set -e
export MAIN=$(pwd)
export VERSION=0.0.3
cd ${MAIN}/images//vnc-in-a-bottle
docker build -t ide-in-a-bottle:${VERSION} .
docker tag ide-in-a-bottle:${VERSION} ide-in-a-bottle:latest
cd ${MAIN}/images/jdk-in-a-bottle
docker build -t ide-in-a-bottle:${VERSION}-jdk .
docker tag ide-in-a-bottle:${VERSION}-jdk ide-in-a-bottle:latest-jdk
mkdir -p ${MAIN}/images/build
docker save ide-in-a-bottle:${VERSION} | gzip > ${MAIN}/build/ide-in-a-bottle-${VERSION}.tar.gz
docker save ide-in-a-bottle:${VERSION}-jdk | gzip > ${MAIN}/build/ide-in-a-bottle-${VERSION}-jdk.tar.gz
git tag -a ${VERSION} -m "Released ${VERSION}"
git push
