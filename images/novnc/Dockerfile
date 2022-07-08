FROM alpine:latest
RUN apk --update --no-cache add python3 py3-numpy dumb-init bash procps git &&\
    ln -sf python3 /usr/bin/python
ENV PYTHONPATH=/usr/lib/python3.8/site-packages
WORKDIR /app/
RUN git clone --depth 1 -b v1.2.0 https://github.com/novnc/noVNC.git novnc \
 && git clone --depth 1 -b v0.10.0 https://github.com/novnc/websockify novnc/utils/websockify \
 && rm -rf novnc/.git \
 && rm -rf novnc/utils/websockify/.git \
 && cd novnc \
 && cp vnc.html index.html
ADD entrypoint.sh /app/
ADD flexible.html /app/novnc/flexible.html
RUN chmod +x *.sh
ENTRYPOINT ["/usr/bin/dumb-init", "--", "/app/entrypoint.sh"]
ENV NOVNC_PORT 6080
ENV VNC_HOST localhost
ENV VNC_PORT 5900
EXPOSE 6080
