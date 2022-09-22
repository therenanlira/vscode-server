FROM ubuntu:latest

# Create user coder
RUN apt update && apt install sudo
RUN adduser coder && echo "coder:Docker!" | chpasswd
RUN mkdir -p /home/coder && cd /home/coder
RUN chown -R coder:coder /home/coder
RUN echo "coder ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

ENV SHELL=/bin/bash
ENV PORT=80

# Add support for SSHing into the app
# (https://docs.microsoft.com/en-us/azure/app-service/configure-custom-container?pivots=container-linux#enable-ssh)
USER root
RUN apt update && apt install -y openssh-server && echo "root:Docker!" | chpasswd 
COPY sshd_config /etc/ssh/
EXPOSE 80 2222

RUN mkdir -p /tmp
COPY ssh_setup.sh /tmp/
RUN chmod +x /tmp/ssh_setup.sh \
    && (sleep 1;/tmp/ssh_setup.sh 2>&1 > /dev/null)
RUN /usr/sbin/sshd

RUN mkdir -p /var/run/sshd
RUN mkdir /home/coder/project

# Install curl & wget & git
RUN apt update && apt install -y curl wget git

# Install az-cli
RUN curl -sL https://aka.ms/InstallAzureCLIDeb | bash

# Install kubectl & kubeadm
RUN apt update && apt install -y ca-certificates apt-transport-https
RUN curl -fsSLo /usr/share/keyrings/kubernetes-archive-keyring.gpg https://packages.cloud.google.com/apt/doc/apt-key.gpg
RUN echo "deb [signed-by=/usr/share/keyrings/kubernetes-archive-keyring.gpg] https://apt.kubernetes.io/ kubernetes-xenial main" \
    | tee /etc/apt/sources.list.d/kubernetes.list
RUN apt update && apt install -y kubectl

# Install helm
RUN curl https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3 | bash

# Install nodejs
RUN curl -fsSL https://deb.nodesource.com/setup_18.x | bash
RUN apt install nodejs

# Install code-server
RUN wget -O- https://aka.ms/install-vscode-server/setup.sh | bash

# Clean cache
RUN apt clean all

# Start code-server
USER coder
RUN cd /home/coder/project
COPY code-server.sh /tmp/
RUN sudo chmod +x /tmp/code-server.sh
ENTRYPOINT [ "/tmp/code-server.sh" ]
