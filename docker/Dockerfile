# import existing kali image
FROM kalilinux/kali-rolling

ENV DEBIAN_FRONTEND=noninteractive

# update and install all needed tools
RUN apt-get update && \
    apt-get install -y \
    build-essential \
    golang \
    mingw-w64 \
    git \
    curl \
    wget \
    nano \
    metasploit-framework \
    iputils-ping \
    iproute2 \
    net-tools && \
    apt-get clean

# set working directory
WORKDIR /root

# download and install sliver
RUN cd /root && \
    curl -L https://github.com/BishopFox/sliver/releases/download/v1.7.1/sliver-server_linux-amd64 -o sliver-server; \
    chmod +x sliver-server;