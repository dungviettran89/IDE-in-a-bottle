# IDE-in-a-bottle

## ubuntu development environment with mysql and docker commandline

Quick commandline to start without docker support
```shell script

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
