
# Servidor VS Code

Este repositório contém um Dockerfile e scripts para executar o [Visual Studio Code Server](https://github.com/microsoft/vscode-remote-release) dentro de um contêiner Docker.

## Requisitos

Para executar o servidor VS Code, é necessário ter o Docker instalado na máquina.

## Executando o servidor

1.  Clone este repositório na sua máquina:
    
  ```bash
    git  clone  https://github.com/therenanlira/vscode-server.git  cd  vscode-server
  ```
    
2.  Construa a imagem do Docker:
    
  ```bash
  docker build -t vscode-server .
  ```
  
3.  Execute o contêiner:
    
  ```bash
    docker run -d -p 127.0.0.1:8080:8080 --name vscode-server vscode-server
  ```
    
O servidor VS Code estará disponível em `http://localhost:8080`.
    
**Observação**: O uso do endereço `127.0.0.1` limita a conexão apenas à máquina local, o que pode ser útil em ambientes com múltiplos usuários.
    

## Personalização

Você pode personalizar o servidor VS Code incluindo extensões e configurações específicas no arquivo `Dockerfile`. Para mais informações sobre como personalizar o servidor, consulte a [documentação oficial](https://code.visualstudio.com/docs/remote/containers).

## Licença

Este projeto está licenciado sob a licença MIT - consulte o arquivo [LICENSE](https://chat.openai.com/chat/LICENSE) para obter detalhes.
