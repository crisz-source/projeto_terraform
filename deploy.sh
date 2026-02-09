#!/bin/bash

set -e

echo "========================================="
echo "  DEPLOY - Terraform + Ansible + Docker"
echo "========================================="

# Terraform
echo ""
echo "[1/3] Criando infraestrutura com Terraform..."
cd terraform
terraform init -input=false
terraform apply -auto-approve
cd ..

# Aguardar VM ficar pronta
echo ""
echo "[2/3] Aguardando VM ficar pronta (30s)..."
sleep 30

# Ansible
echo ""
echo "[3/3] Configurando servidor com Ansible..."
cd ansible
ansible-playbook -i inventory.ini playbook.yml
cd ..

# Resultado
echo ""
echo "========================================="
echo "  DEPLOY CONCLUIDO COM SUCESSO!"
echo "========================================="
cd terraform
terraform output