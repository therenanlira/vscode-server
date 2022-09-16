FROM ubuntu:latest

ENV SHELL=/bin/bash
ENV PORT=80

# Add support for SSHing into the app (https://docs.microsoft.com/en-us/azure/app-service/configure-custom-container?pivots=container-linux#enable-ssh)
RUN apt-get update && apt-get install -y openssh-server \
     && echo "root:Docker!" | chpasswd 
COPY sshd_config /etc/ssh/
EXPOSE 80 2222
RUN mkdir -p /var/run/sshd

# Create user coder
RUN useradd coder && echo "coder:Docker!" | chpasswd \
     && mkdir /home/coder
RUN chown -R coder:coder /home/coder
RUN mkdir /home/coder/project

# Install az-cli
RUN apt update && apt install curl wget -y
RUN curl -sL https://aka.ms/InstallAzureCLIDeb | bash

## Funciona mas executa sempre que inicia o container
# ADD scripts/ /home/coder/scripts/
# RUN chmod +x /home/coder/scripts/*
# ENTRYPOINT [ "/home/coder/scripts/az-cli.sh" ]

# Install code-server
RUN wget -O- https://aka.ms/install-vscode-server/setup.sh | sh
## Need to pass the server name in the command line
CMD ["code-server serve "]