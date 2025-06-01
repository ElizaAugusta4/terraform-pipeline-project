# Terraform Pipeline Project

Este repositório foi criado para demonstrar meus conhecimentos em **Terraform**, **AWS** e automação de infraestrutura como código utilizando **GitHub Actions**.

## O que você encontra aqui

- Provisionamento de recursos AWS com Terraform
- Uso de backend remoto (S3) para o estado do Terraform
- Controle de versionamento do estado com S3 
- Pipeline CI/CD automatizada com GitHub Actions
- Exemplos de políticas IAM para integração segura

## Como usar

1. Clone este repositório.
2. Configure suas credenciais AWS.
3. Ajuste variáveis conforme necessário.
4. Execute os comandos Terraform (`init`, `plan`, `apply`).

## Estrutura

- `main.tf`: Recursos principais e backend remoto
- `iam.tf`: Permissões e integração com GitHub Actions
- `.github/workflows/ci.yml`: Pipeline de CI/CD

---

> Projeto para fins de estudo e demonstração de boas práticas DevOps.