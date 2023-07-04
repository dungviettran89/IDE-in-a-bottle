FROM debian:bookworm
#Desktop first (no VNC please)
RUN export DEBIAN_FRONTEND=noninteractive && \
    apt-get update && \
    apt-get install -y software-properties-common git bash curl wget nano inetutils-ping nmap nano sudo \
    tigervnc-standalone-server x11-xserver-utils fluxbox xterm firefox-esr
RUN wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add - && \
    echo "deb http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list && \
    export DEBIAN_FRONTEND=noninteractive &&\
    apt-get update &&\
    apt-get install -y google-chrome-stable 
#Prepare user
RUN useradd -m -s /bin/bash developer &&\
    echo -n 'developer:developer' | chpasswd &&\
    usermod -aG sudo developer &&\
    groupadd docker &&\
    usermod -aG docker developer &&\
    echo "developer ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers
ADD entrypoint*.sh /app/
RUN chmod +x /app/*.sh
WORKDIR /home/developer
ENTRYPOINT "/app/entrypoint.sh"

ENV WIDTH 1920
ENV HEIGHT 1080
ENV VNC_PORT 5900
ENV VNC_PASSWORD developer
EXPOSE 5900