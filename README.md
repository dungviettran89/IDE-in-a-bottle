# IDE-in-a-bottle

## Usage

Alpine
```shell script
docker run -d -p 9999:6080 -e VNC_PASSWORD=demo radiocuatoi/ide-in-a-bottle:latest
```
Alpine JDK
```shell script
docker run -d --network=host -e VNC_PASSWORD=demo -e NOVNC_PORT=9999 radiocuatoi/ide-in-a-bottle:latest-jdk
```
Ubuntu
```shell script
docker run -d --network=host -e VNC_PASSWORD=demo -e NOVNC_PORT=9999 \
  -v /var/run/docker.sock:/var/run/docker.sock \
  -v developer-data:/home/developer \
  radiocuatoi/ide-in-a-bottle:latest-ubuntu-jdk
```

## noVNC server
You can start noVNC server quickly with local VNC server
```shell script
docker run -d --restart=always --name=novnc-server --network=host radiocuatoi/ide-in-a-bottle:novnc-latest
```

Start noVNC server quickly with remote VNC server
```shell script
docker run -d --restart=always --name=novnc-server -p 6080:6080 -e VNC_PORT=5900 -e VNC_HOST=127.0.0.1 radiocuatoi/ide-in-a-bottle:novnc-latest
```
