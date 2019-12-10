FROM ubuntu:18.04
RUN export DEBIAN_FRONTEND=noninteractive \
 && apt-get update \
 && apt-get install -y xvfb x11vnc bash nano wget curl sudo dumb-init python3 python-pip inetutils-ping nmap \
 && pip install numpy \
 && apt-get install -y fluxbox chromium-browser \
 && curl -sL https://deb.nodesource.com/setup_12.x | bash - \
 && apt-get install -y git default-jdk nodejs mysql-client mysql-server \
 && apt-get clean
WORKDIR /app/
RUN git clone --depth 1 https://github.com/novnc/noVNC.git novnc \
 && git clone --depth 1 https://github.com/novnc/websockify novnc/utils/websockify \
 && rm -rf novnc/.git \
 && rm -rf novnc/utils/websockify/.git \
 && cd novnc \
 && cp vnc.html index.html
ADD entrypoint.sh /app/
RUN chmod +x /app/*.sh \
 && chmod 775 /app -R
RUN useradd -m -s /bin/bash developer
USER developer
WORKDIR /home/developer
ENTRYPOINT ["/usr/bin/dumb-init", "--", "/app/entrypoint.sh"]

ENV NOVNC_PORT 6080
ENV VNC_PORT 5900
ENV VNC_PASSWORD demo

EXPOSE 6080
EXPOSE 5900