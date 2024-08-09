#!/bin/bash

# Navegar para o diretório temporário
cd /tmp

# Baixar os arquivos necessários
curl -sSL -o multitheftauto_linux_x64.tar.gz https://linux.multitheftauto.com/dl/multitheftauto_linux_x64.tar.gz
curl -sSL -o mta-baseconfig.tar.gz https://linux.multitheftauto.com/dl/baseconfig.tar.gz
curl -sSL -o mtasa-resources-latest.zip https://mirror.multitheftauto.com/mtasa/resources/mtasa-resources-latest.zip

# Criar o diretório de destino e extrair os arquivos
mkdir -p /home/container
tar -xvf multitheftauto_linux_x64.tar.gz
cp -rf multitheftauto_linux_x64/* /home/container

# Baixar a biblioteca se não estiver presente
if [ ! -f /home/container/x64/libmysqlclient.so.16 ]; then
    curl -L http://nightly.mtasa.com/files/libmysqlclient.so.16 -o /home/container/x64/libmysqlclient.so.16
fi

# Preparar os recursos e configurações
mkdir -p /home/container/mods/deathmatch/resources
unzip -o -d /home/container/mods/deathmatch/resources mtasa-resources-latest.zip

tar -xvf mta-baseconfig.tar.gz
cp -rf baseconfig/* /home/container/mods/deathmatch

# Ajustar permissões
chown -R root:root /home/container

# Configurar variável de ambiente
export HOME=/home/container