#!/bin/bash
set -e
export MAIN=$(pwd)
export VERSION=${VERSION:-0.0.1}

mkdir -p ${MAIN}/build

cd ${MAIN}/images/base
docker build -t radiocuatoi/ide-in-a-bottle:${VERSION} .
docker tag radiocuatoi/ide-in-a-bottle:${VERSION} radiocuatoi/ide-in-a-bottle:latest

cd ${MAIN}/images/jdk
docker build -t radiocuatoi/ide-in-a-bottle:${VERSION}-jdk .
docker tag radiocuatoi/ide-in-a-bottle:${VERSION}-jdk radiocuatoi/ide-in-a-bottle:latest-jdk

cd ${MAIN}/images/ubuntu-jdk
docker build -t radiocuatoi/ide-in-a-bottle:${VERSION}-ubuntu-jdk .
docker tag radiocuatoi/ide-in-a-bottle:${VERSION}-ubuntu-jdk radiocuatoi/ide-in-a-bottle:latest-ubuntu-jdk

git tag -a ${VERSION} -m "Released ${VERSION}"
echo "Exporting radiocuatoi/ide-in-a-bottle:${VERSION}"
docker save radiocuatoi/ide-in-a-bottle:${VERSION} | gzip > ${MAIN}/build/ide-in-a-bottle-${VERSION}.tar.gz
docker push radiocuatoi/ide-in-a-bottle:${VERSION}
docker push radiocuatoi/ide-in-a-bottle:latest
echo "Exporting radiocuatoi/ide-in-a-bottle:${VERSION}-jdk"
docker save radiocuatoi/ide-in-a-bottle:${VERSION}-jdk | gzip > ${MAIN}/build/ide-in-a-bottle-${VERSION}-jdk.tar.gz
docker push radiocuatoi/ide-in-a-bottle:${VERSION}-jdk
docker push radiocuatoi/ide-in-a-bottle:latest-jdk
echo "Exporting radiocuatoi/ide-in-a-bottle:${VERSION}-ubuntu-jdk"
docker save radiocuatoi/ide-in-a-bottle:${VERSION}-ubuntu-jdk | gzip > ${MAIN}/build/ide-in-a-bottle-${VERSION}-ubuntu-jdk.tar.gz
docker push radiocuatoi/ide-in-a-bottle:${VERSION}-ubuntu-jdk
docker push radiocuatoi/ide-in-a-bottle:latest-ubuntu-jdk

git push --tags
