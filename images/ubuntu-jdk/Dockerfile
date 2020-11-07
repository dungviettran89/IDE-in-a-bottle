FROM ubuntu:18.04
WORKDIR /app/
#Phase 1 prepare desktop software
RUN export DEBIAN_FRONTEND=noninteractive \
 && apt-get update \
 && apt-get install -y tigervnc-standalone-server bash nano wget curl sudo dumb-init python3 python-pip git software-properties-common xvt \
 && pip install numpy \
 && apt-get install -y fluxbox chromium-browser
#Phase 2 prepare development software
RUN curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add - \
 && add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" \
 && curl -sL https://deb.nodesource.com/setup_12.x | bash - \
 && apt-get update \
 && apt-get install -y inetutils-ping nmap default-jdk nodejs mysql-client mysql-server docker-ce-cli \
 && java -version \
 && node -v \
 && docker -v
RUN wget -qO- https://download.jetbrains.com/idea/ideaIU-2020.2.3.tar.gz | tar -xzf -
RUN curl -sL "https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl" -o /usr/bin/kubectl \
 && chmod +x /usr/bin/kubectl
RUN curl -sL "https://github.com/docker/compose/releases/download/1.27.4/docker-compose-$(uname -s)-$(uname -m)" -o /usr/bin/docker-compose \
 && chmod +x /usr/bin/docker-compose
#Phase 3 prepare novnc
RUN git clone --depth 1 https://github.com/novnc/noVNC.git novnc \
 && git clone --depth 1 https://github.com/novnc/websockify novnc/utils/websockify \
 && rm -rf novnc/.git \
 && rm -rf novnc/utils/websockify/.git \
 && cd novnc \
 && cp vnc.html index.html
ADD flexible.html /app/novnc/
#Phase 4 prepare user
RUN useradd -m -s /bin/bash developer \
 && echo -n 'developer:developer' | chpasswd \
 && usermod -aG sudo developer \
 && groupadd docker \
 && usermod -aG docker developer \
 && echo "developer ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers
#Addd files
ADD *.sh /app/
RUN chmod +x *.sh
WORKDIR /home/developer
ENTRYPOINT ["/usr/bin/dumb-init", "--", "/app/entrypoint.sh"]

ENV NOVNC_PORT 6080
ENV VNC_PORT 5999
ENV VNC_PASSWORD demo

EXPOSE 6080
EXPOSE 5999
