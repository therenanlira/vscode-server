FROM ubuntu:latest
ENV SHELL=/bin/bash

# Install dependencies
COPY ./src/code-server.sh /tmp/
RUN apt update && apt install -y sudo curl wget vim git
RUN sudo chmod +x /tmp/code-server.sh

# Create user coder
RUN adduser coder && echo "coder:Docker!" | chpasswd
RUN mkdir -p /home/coder/vscode-server
RUN echo "coder ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

# Install code-server
RUN wget -O- https://aka.ms/install-vscode-server/setup.sh | bash

# Clean cache
RUN apt clean all

# Start code-server
USER coder
RUN sudo chown -R coder:coder /home/coder
WORKDIR /home/coder/vscode-server
ENTRYPOINT [ "/tmp/code-server.sh" ]
