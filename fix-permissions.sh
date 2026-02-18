#!/bin/bash

# Script para corrigir permissões dos arquivos criados no container
# Execute este script no seu computador (host) para corrigir as permissões

echo "Corrigindo permissões dos arquivos..."

# Verifica se a variável APP_CODE_PATH_HOST está definida
if [ -z "$APP_CODE_PATH_HOST" ]; then
    echo "AVISO: APP_CODE_PATH_HOST não está definida."
    echo "Por favor, defina no seu arquivo .env ou execute:"
    echo "export APP_CODE_PATH_HOST=/caminho/para/seu/projeto"
    exit 1
fi

# Obtém o UID e GID do usuário atual
USER_ID=$(id -u)
GROUP_ID=$(id -g)

echo "Ajustando permissões em: $APP_CODE_PATH_HOST"
echo "Usando UID: $USER_ID e GID: $GROUP_ID"

# Ajusta permissões recursivamente
sudo chown -R $USER_ID:$GROUP_ID "$APP_CODE_PATH_HOST"
sudo chmod -R u+rwX "$APP_CODE_PATH_HOST"

echo "Permissões corrigidas!"
