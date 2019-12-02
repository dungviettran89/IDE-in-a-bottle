#!/bin/bash
set -e
export MAIN=$(pwd)
export VERSION=0.0.1
git tag -a ${VERSION} -m "Released ${VERSION}"
cd ${MAIN}/images//vnc-in-a-bottle
docker build -t ide-in-a-bottle:${VERSION} .
docker tag ide-in-a-bottle:${VERSION} ide-in-a-bottle:latest
cd ${MAIN}/images/jdk-in-a-bottle
docker build -t jdk-in-a-bottle:${VERSION} .
docker tag jdk-in-a-bottle:${VERSION} jdk-in-a-bottle:latest
mkdir -p ${MAIN}/images/build
docker save ide-in-a-bottle:${VERSION} | gzip > ${MAIN}/build/ide-in-a-bottle-${VERSION}.tar.gz
docker save jdk-in-a-bottle:${VERSION} | gzip > ${MAIN}/build/jdk-in-a-bottle-${VERSION}.tar.gz
