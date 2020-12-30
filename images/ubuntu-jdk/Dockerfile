FROM ubuntu:18.04
#Development software first because it rarely change
RUN export DEBIAN_FRONTEND=noninteractive &&\
    apt-get update &&\
    apt-get install software-properties-common git bash nano wget curl -y &&\
    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add - &&\
    add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" &&\
    curl -sL https://deb.nodesource.com/setup_12.x | bash - &&\
    apt-get update  &&\
    apt-get install -y inetutils-ping nmap default-jdk nodejs mysql-client mysql-server docker-ce-cli  &&\
    java -version  &&\
    node -v  &&\
    docker -v
WORKDIR /app/
RUN wget -qO- https://download.jetbrains.com/idea/ideaIU-2020.2.3.tar.gz | tar -xzf - &&\
    curl -sL "https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl" -o /usr/bin/kubectl &&\
    chmod +x /usr/bin/kubectl &&\
    curl -sL "https://github.com/docker/compose/releases/download/1.27.4/docker-compose-$(uname -s)-$(uname -m)" -o /usr/bin/docker-compose &&\
    chmod +x /usr/bin/docker-compose &&\
    curl https://dl.min.io/client/mc/release/linux-amd64/mc -o /usr/bin/mc &&\
    chmod +x /usr/bin/mc &&\
    mc --help

#Desktop software (no VNC please)
RUN export DEBIAN_FRONTEND=noninteractive &&\
    apt-get update &&\
    apt-get install -y xvfb x11vnc bash nano sudo xterm fluxbox chromium-browser x11-xserver-utils firefox
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
