# Configuração de Infraestrutura Multi-Ambiente com Terraform

## Descrição

Este projeto configura uma infraestrutura distribuída em três ambientes (prod, staging e dev) utilizando o Terraform. A infraestrutura inclui instâncias EC2, VPCs e um balanceador de carga.

## Estrutura do Projeto

- **modules/**: Contém módulos reutilizáveis para VPC, EC2 e ALB.
- **environments/**: Contém configurações específicas para cada ambiente.

## Requisitos

- Terraform v0.14 ou superior
- AWS CLI configurado
- Credenciais AWS configuradas (com suporte a SSO)

## Como Usar

1. Inicialize o Terraform:
   ```bash
   terraform init
   ```

2. Defina as variáveis de ambiente:
   ```bash
   export AWS_PROFILE=your-sso-profile
   ```

3. Aplique a configuração:
   ```bash
   terraform apply -var-file=../../dev.tfvars
   ```

## Estrutura dos Arquivos

### `main.tf`

Este arquivo contém a configuração principal para provisionar os recursos da AWS.

### `variables.tf`

Este arquivo define todas as variáveis necessárias para o projeto.

### `outputs.tf`

Este arquivo define os outputs dos recursos provisionados.

### `dev.tfvars`

Este arquivo contém os valores específicos das variáveis para o ambiente de desenvolvimento.

## Módulos

### VPC

Este módulo cria a VPC, sub-redes públicas e privadas, gateway de internet e tabela de rotas.

### EC2

Este módulo provisiona instâncias EC2 dentro das sub-redes criadas.

### ALB

Este módulo cria o Application Load Balancer, Target Group e Listener.

## Segurança

- Utilização do AWS Secrets Manager para gerenciar credenciais sensíveis.
- Limitação de acesso através de Security Groups bem definidos.
- Criptografia de volumes EBS e dados em trânsito.

## Limpeza

Para destruir a infraestrutura provisionada, execute:
```bash
terraform destroy -var-file=../../dev.tfvars
```

## Licença

Este projeto é licenciado sob os termos da MIT License.
