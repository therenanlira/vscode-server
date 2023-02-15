# VSCode Server in container

This is destined to those who has been accepted to the insider code-server.
For more [click here](https://code.visualstudio.com/docs/remote/vscode-server).

## Running on Docker

You can build your own image using the [Dockerfile](https://github.com/therenanlira/vscode-server/blob/main/Dockerfile) or:

Run the container:

    docker run -d --name vscode-server therenanlira/vscode-server:latest

Access the container logs and follow the steps:

    docker logs vscode-server

## Running on Kubernetes

You can use the [free tier of AKS (Azure Kubernetes Service)](https://learn.microsoft.com/en-us/azure/aks/free-standard-pricing-tiers).

Apply the manifest to create the Namespace and Deployment:

    kubectl apply -f ./src/kube-vscode.yml

Access the POD logs and follow the steps:

    kubectl logs $(kubectl get po --output=name) -f
