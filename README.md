# IDE-in-a-bottle

## noVNC server
You can start noVNC server quickly with local VNC server
```shell script
docker run -d --restart=always --name=novnc-server --network=host radiocuatoi/novnc-server
```

Start noVNC server quickly with remote VNC server
```shell script
docker run -d --restart=always --name=novnc-server -p 6080:6080 -e VNC_PORT=5900 -e VNC_HOST=127.0.0.1 radiocuatoi/novnc-server
```
