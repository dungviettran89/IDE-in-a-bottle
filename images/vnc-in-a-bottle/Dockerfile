FROM alpine:latest
RUN echo "@edge http://dl-cdn.alpinelinux.org/alpine/edge/main" >> /etc/apk/repositories
RUN echo "@edge http://dl-cdn.alpinelinux.org/alpine/edge/community" >> /etc/apk/repositories
RUN apk --update --no-cache add \
#noVNC packages
 python py-numpy@edge x11vnc xvfb sudo wget curl ca-certificates npm nodejs dumb-init procps bash \
#desktop packages
 fluxbox xterm terminator\
#development packages
 git
WORKDIR /vnc/
RUN git clone --depth 1 https://github.com/novnc/noVNC.git novnc && \
    git clone --depth 1 https://github.com/novnc/websockify novnc/utils/websockify && \
    rm -rf novnc/.git && \
    rm -rf novnc/utils/websockify/.git &&\
    cd novnc &&\
    cp vnc_lite.html index.html &&\
    sed -e 's/id="top_bar"/id="top_bar" style="display:none;"/g' -i index.html
ADD root /vnc/root
ADD entrypoint.sh /vnc/entrypoint.sh
ENTRYPOINT ["/usr/bin/dumb-init","--"]
CMD ["/vnc/entrypoint.sh"]

ENV WIDTH 1920
ENV HEIGHT 1080
ENV VNC_PORT 5900
ENV NOVNC_PORT 6080