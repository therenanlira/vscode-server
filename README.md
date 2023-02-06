# VS Code Server in container

This is destined to those who has been accepted to the insider code-server.
For more [click here](https://code.visualstudio.com/docs/remote/vscode-server).

## Running on Docker

Run the container:

    docker run -d --name vscode-server therenanlira/vscode-server:latest

Access the container logs and follow the steps:

    docker logs ms-vscode-server

OBS: You can build your own image using the [Dockerfile](https://raw.githubusercontent.com/therenanlira/ms-vscode-server/main/Dockerfile)

## Running on Kubernetes

Apply the manifest to create the Namespace and Deployment:

    kubectl apply -f ./src/kube-vscode.yml
