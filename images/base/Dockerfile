FROM alpine:latest
RUN echo "@edge http://dl-cdn.alpinelinux.org/alpine/edge/main" >> /etc/apk/repositories
RUN echo "@edge http://dl-cdn.alpinelinux.org/alpine/edge/community" >> /etc/apk/repositories
RUN apk --update --no-cache add \
#noVNC packages
 python py-numpy@edge x11vnc xvfb sudo wget curl ca-certificates npm nodejs dumb-init procps bash nano \
#desktop packages
 fluxbox xterm ttf-dejavu ttf-droid ttf-freefont ttf-liberation ttf-ubuntu-font-family chromium firefox-esr \
#development packages
 git
WORKDIR /app/
RUN git clone --depth 1 https://github.com/novnc/noVNC.git novnc \
 && git clone --depth 1 https://github.com/novnc/websockify novnc/utils/websockify \
 && rm -rf novnc/.git \
 && rm -rf novnc/utils/websockify/.git \
 && cd novnc \
 && cp vnc.html index.html
ADD entrypoint.sh /app/
RUN adduser -h /home/developer -s /bin/bash -G root -D developer  \
 && chmod +x /app/*.sh \
 && chmod 775 /app -R \
 && chown developer:root /home/developer
USER developer
WORKDIR /home/developer
ENTRYPOINT ["/usr/bin/dumb-init", "--", "/app/entrypoint.sh"]

ENV WIDTH 1920
ENV HEIGHT 1080
ENV NOVNC_PORT 6080
ENV VNC_PORT 5900
ENV VNC_PASSWORD demo
ENV LANG en_GB.UTF-8

EXPOSE 6080
EXPOSE 5900
