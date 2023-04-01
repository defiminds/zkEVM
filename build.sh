#!/bin/bash
build() {
# Instalar o Docker
sudo apt-get update
sudo apt-get install -y docker.io

# Criar um arquivo Dockerfile
echo "FROM ubuntu:latest" >> Dockerfile
echo "RUN apt-get update && \\" >> Dockerfile
echo "    apt-get install -y wget && \\" >> Dockerfile
echo "    wget -qO- https://zksync.io/infrastructure/scripts/install.sh | sh" >> Dockerfile
echo "CMD [\"/bin/bash\"]" >> Dockerfile

# Criar uma imagem Docker
sudo docker build -t zksync-node .

# Executar o contêiner Docker
sudo docker run -it zksync-node /bin/bash
}
build
