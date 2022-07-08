#!/bin/bash
set -e
export MAIN=$(pwd)
export VERSION=${VERSION:-0.0.1}

mkdir -p ${MAIN}/build

cd ${MAIN}/images/ubuntu-jdk
docker build -t radiocuatoi/ide-in-a-bottle:${VERSION} .
docker tag radiocuatoi/ide-in-a-bottle:${VERSION} radiocuatoi/ide-in-a-bottle:latest
docker tag radiocuatoi/ide-in-a-bottle:${VERSION} radiocuatoi/ide-in-a-bottle:dev

cd ${MAIN}/images/novnc
docker build -t radiocuatoi/ide-in-a-bottle:${VERSION}-novnc .
docker tag radiocuatoi/ide-in-a-bottle:${VERSION}-novnc radiocuatoi/ide-in-a-bottle:latest-novnc
docker tag radiocuatoi/ide-in-a-bottle:${VERSION}-novnc radiocuatoi/ide-in-a-bottle:dev-novnc

if [ "$VERSION" = "0.0.1" ]; then
  echo "Will not push development version"
  exit
fi

git tag -a ${VERSION} -m "Released ${VERSION}"
echo "Exporting radiocuatoi/ide-in-a-bottle:${VERSION}"
docker push radiocuatoi/ide-in-a-bottle:${VERSION}
docker push radiocuatoi/ide-in-a-bottle:latest

echo "Exporting radiocuatoi/ide-in-a-bottle:${VERSION}-novnc"
docker push radiocuatoi/ide-in-a-bottle:${VERSION}-novnc
docker push radiocuatoi/ide-in-a-bottle:latest-novnc

git push --tags
