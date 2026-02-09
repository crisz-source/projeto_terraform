# Projeto Final - Infraestrutura como Código

Deploy automatizado de aplicação web no Azure usando Terraform, Ansible e Docker.

## Sobre o Projeto

Este projeto é o resultado de um estudo intensivo de DevOps, onde aprendi do zero até a implementação prática de uma infraestrutura completa na nuvem.

**Objetivo:** Consolidar conhecimentos em IaC (Infrastructure as Code), automação de configuração e containerização através de um projeto real e funcional.

## Metodologia de Estudo

Utilizei **Inteligência Artificial (Claude)** como ferramenta de aprendizado, seguindo uma abordagem prática:

- **Explicação Feynman** - Conceitos explicados de forma simples antes de implementar
- **Labs práticos** - 10 laboratórios de Terraform + 9 de Ansible
- **Simulados** - Questões no estilo certificação para fixar conteúdo
- **Projeto integrado** - Aplicação real de tudo que foi aprendido

A conta utilizada foi **Azure for Students**, aproveitando os créditos gratuitos para estudantes.

## Stack Utilizada

| Ferramenta | Função |
|------------|--------|
| Terraform | Provisionar infraestrutura no Azure (VM, VNet, NSG, IP) |
| Ansible | Configurar servidor (instalar Docker, rodar container) |
| Docker | Containerizar aplicação |
| Nginx | Servidor web |
| Azure | Provedor de cloud |

## Estrutura do Projeto

```
projeto-final/
├── terraform/
│   ├── main.tf           # Recursos Azure + geração de inventário
│   ├── variables.tf      # Variáveis
│   ├── outputs.tf        # Outputs (IP, comando SSH)
│   └── terraform.tfvars  # Valores
├── ansible/
│   ├── inventory.ini     # Gerado automaticamente pelo Terraform
│   ├── playbook.yml      # Instala Docker e roda container
│   └── templates/
│       └── index.html.j2 # Página da aplicação
├── deploy.sh             # Script que executa tudo
└── README.md
```

## Como Funciona

1. **Terraform** cria a infraestrutura no Azure e gera o inventário do Ansible com o IP da VM
2. **Ansible** conecta na VM via SSH, instala Docker e sobe o container
3. **Aplicação** fica acessível via IP público na porta 80

## Pré-requisitos

- Terraform >= 1.0.0
- Ansible >= 2.10
- Azure CLI configurado (`az login`)
- Conta no Azure com créditos disponíveis

## Como Executar

**Deploy completo (um comando):**

```bash
./deploy.sh
```

**Ou passo a passo:**

```bash
# 1. Criar infraestrutura
cd terraform
terraform init
terraform apply

# 2. Configurar servidor
cd ../ansible
ansible-playbook -i inventory.ini playbook.yml
```

## Outputs

Após o deploy, o Terraform mostra:

```
app_url      = "http://<IP_PUBLICO>"
ssh_command  = "ssh -i terraform/ssh_key adminuser@<IP_PUBLICO>"
vm_public_ip = "<IP_PUBLICO>"
```

## Destruir Infraestrutura

```bash
cd terraform
terraform destroy
```

## O que Aprendi

- Criar e gerenciar infraestrutura com Terraform
- Organizar código em módulos reutilizáveis
- Usar state remoto com locking
- Automatizar configuração de servidores com Ansible
- Gerenciar containers Docker via Ansible
- Integrar múltiplas ferramentas em um pipeline

## Próximos Passos

- [ ] Adicionar CI/CD com GitHub Actions
- [ ] Certificação Terraform Associate
- [ ] Certificação Azure AZ-104 e AZ-400

## Autor

Cristhian

## Licença

Projeto para fins de estudo.