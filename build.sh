#!/bin/bash
set -e
export MAIN=$(pwd)
export VERSION=${VERSION:-0,0.1}

mkdir -p ${MAIN}/build

cd ${MAIN}/images/vnc-in-a-bottle
docker build -t radiocuatoi/ide-in-a-bottle:${VERSION} .
docker tag radiocuatoi/ide-in-a-bottle:${VERSION} radiocuatoi/ide-in-a-bottle:latest
docker save radiocuatoi/ide-in-a-bottle:${VERSION} | gzip > ${MAIN}/build/radiocuatoi/ide-in-a-bottle-${VERSION}.tar.gz

cd ${MAIN}/images/jdk-in-a-bottle
docker build -t radiocuatoi/ide-in-a-bottle:${VERSION}-jdk .
docker tag radiocuatoi/ide-in-a-bottle:${VERSION}-jdk radiocuatoi/ide-in-a-bottle:latest-jdk
docker save radiocuatoi/ide-in-a-bottle:${VERSION}-jdk | gzip > ${MAIN}/build/radiocuatoi/ide-in-a-bottle-${VERSION}-jdk.tar.gz

cd ${MAIN}/images/ubuntu-jdk
docker build -t radiocuatoi/ide-in-a-bottle:${VERSION}-ubuntu-jdk .
docker tag radiocuatoi/ide-in-a-bottle:${VERSION}-ubuntu-jdk radiocuatoi/ide-in-a-bottle:latest-ubuntu-jdk
docker save radiocuatoi/ide-in-a-bottle:${VERSION}-ubuntu-jdk | gzip > ${MAIN}/build/radiocuatoi/ide-in-a-bottle-${VERSION}-ubuntu-jdk.tar.gz

git tag -a ${VERSION} -m "Released ${VERSION}"
git push --tags
