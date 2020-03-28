FROM ubuntu:18.04
RUN export DEBIAN_FRONTEND=noninteractive \
 && apt-get update \
 && apt-get install -y tigervnc-standalone-server bash nano wget curl sudo dumb-init python3 python-pip inetutils-ping nmap \
 && pip install numpy \
 && apt-get install -y fluxbox chromium-browser \
 && curl -sL https://deb.nodesource.com/setup_12.x | bash - \
 && apt-get install -y git default-jdk nodejs mysql-client mysql-server \
 && apt-get clean
WORKDIR /app/
RUN wget -qO- https://download.jetbrains.com/idea/ideaIU-2019.3.3.tar.gz | tar -xzf -
ADD entrypoint.sh /app/
RUN git clone --depth 1 https://github.com/novnc/noVNC.git novnc \
 && git clone --depth 1 https://github.com/novnc/websockify novnc/utils/websockify \
 && rm -rf novnc/.git \
 && rm -rf novnc/utils/websockify/.git \
 && cd novnc \
 && cp vnc.html index.html \
 && chmod +x /app/*.sh
RUN useradd -m -s /bin/bash developer \
 && echo -n 'developer:developer' | chpasswd \
 && usermod -aG sudo developer
USER developer
WORKDIR /home/developer
ENTRYPOINT ["/usr/bin/dumb-init", "--", "/app/entrypoint.sh"]

ENV NOVNC_PORT 6080
ENV VNC_PORT 5999
ENV VNC_PASSWORD demo

EXPOSE 6080
EXPOSE 5999
