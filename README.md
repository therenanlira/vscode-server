# VS Code Server in container

This is destined to those who has been accepted to the insider code-server.
For more [click here](https://code.visualstudio.com/docs/remote/vscode-server).

## Running

You'll need to have docker installed and run:

    bash ./start.sh

Then check the logs to get the token and URI:

    docker logs ms-vscode-server

## Container

As the application is containered you can run it in any Cloud Platform, as Azure Container Instances as well.
