# VSCode Server in container

Este projeto é destinado aos que foram aceitos no insider code-server.
Para mais informações, [clique aqui](https://code.visualstudio.com/docs/remote/vscode-server).

## Executando no Docker

Você pode construir sua própria imagem usando o [Dockerfile](https://github.com/therenanlira/vscode-server/blob/main/Dockerfile) ou:

Execute o container:

    docker run -d --name vscode-server therenanlira/vscode-server:latest

Acesse os logs do container e siga as etapas:

    docker logs vscode-server

## Executando no Kubernetes

Você pode usar o [plano gratuito do AKS (Azure Kubernetes Service)](https://learn.microsoft.com/en-us/azure/aks/free-standard-pricing-tiers).

Aplique o manifesto para criar o Namespace e Deployment:

    kubectl apply -f ./src/kube-vscode.yml

Acesse os logs do POD e siga as etapas:

    kubectl logs $(kubectl get po --output=name) -f
