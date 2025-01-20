# Dundler Mifflin RH - Banco de Dados Relacional

## 1. Visão Geral do Projeto

### 1.1. Temática
O projeto consiste no **desenvolvimento de um banco de dados relacional para o sistema de Recursos Humanos da empresa fictícia Dundler Mifflin**. Ele visa a gestão eficiente de dados relacionados aos funcionários, incluindo cargos, departamentos, localizações e contatos.

### 1.2. Objetivo
- Organizar e centralizar as informações de RH, permitindo consultas detalhadas e personalizadas.
- Facilitar a geração de relatórios gerenciais para decisões estratégicas, como distribuição de funcionários por departamentos e análise de salários.
- Integrar dados estruturados ao processo de **Business Intelligence (BI)**, com foco em dashboards e relatórios analíticos.

O banco foi modelado para ser escalável, permitindo fácil consulta, manutenção e suporte a operações robustas como triggers, funções e procedures.

### 1.3. Escopo
Este projeto abrange a inserção e consulta de informações essenciais dos funcionários, incluindo seus cargos, departamentos, localizações e contatos, com base nas necessidades do departamento de Recursos Humanos.

### 1.4. Público-Alvo
O público-alvo são os times de Recursos Humanos e a diretoria da Dundler Mifflin.

---

## 2. Requisitos Funcionais

### 2.1. Estrutura de Dados
A estrutura do banco inclui as seguintes tabelas principais:
- **Funcionários**: Armazena informações dos funcionários (nome, cargo, departamento, localização, etc.).
- **Departamentos**: Informações dos departamentos, incluindo o gerente responsável.
- **Cargos**: Detalhes dos cargos ocupados pelos funcionários, como título e salário.
- **Localizações**: Representa os escritórios, com cidade e endereço.
- **Contatos**: Armazena telefones e e-mails dos funcionários.

### 2.2. Divisão por Funcionalidade
- Scripts separados para criação de tabelas, views, funções, procedures e triggers.
- Consolidado em um único script para execução completa do banco.
- Ampla documentação para facilitar o entendimento e a reutilização.

### 2.3. Relacionamentos
- **Funcionário - Departamento**: Um funcionário pertence a um departamento, e cada departamento possui vários funcionários.
- **Funcionário - Cargo**: Cada funcionário ocupa um cargo específico, e um cargo pode ser ocupado por vários funcionários.
- **Funcionário - Localização**: Funcionários estão alocados em uma única localização, mas cada local pode ter vários funcionários.
- **Funcionário - Contato**: Funcionários possuem múltiplos contatos (telefone, e-mail).

### 2.4. Regras de Negócio
- **Departamento e cargo obrigatórios**: Todo funcionário deve estar alocado em um departamento e cargo.
- **Gerente único por departamento**: Cada departamento tem apenas um gerente.
- **Contato obrigatório**: Todo funcionário deve ter pelo menos um contato registrado.
- **Exclusão em cascata**: Ao excluir um funcionário, os contatos associados são removidos automaticamente.
- **Localização única por funcionário**: Um funcionário está alocado em apenas uma localização.

---

## 3. Estrutura de Dados

### 3.1. Modelo Lógico
- **Funcionários**:
  - Atributos: ID, nome, data de nascimento, departamento, cargo, localização.
  - Relacionamentos: Relacionado a departamentos, cargos, localizações e contatos.

- **Departamentos**:
  - Atributos: ID, nome, gerente.
  - Relacionamentos: Relacionado a funcionários e localizações.

- **Cargos**:
  - Atributos: ID, título, salário.
  - Relacionamentos: Relacionado a funcionários.

- **Localizações**:
  - Atributos: ID, cidade, endereço.
  - Relacionamentos: Relacionado a funcionários.

- **Contatos**:
  - Atributos: ID, tipo de contato, valor de contato.
  - Relacionamentos: Relacionado a funcionários.

### 3.2. Modelo Físico
- Tipos de dados usados: `INT`, `VARCHAR`, `DATE`, `DECIMAL`.
- Chaves primárias e estrangeiras definidas para integridade referencial.
- Indexações para otimizar consultas.

---

## 4. Lista de Vistas Criadas

### 4.1. `vw_funcionarios_detalhe`
- **Descrição**: Exibe detalhes dos funcionários, incluindo nome, departamento, cargo e localização.
- **Objetivo**: Facilitar relatórios e consultas consolidadas.
- **Tabelas**: `funcionarios`, `departamentos`, `cargos`, `localizacoes`.

### 4.2. `vw_contatos_funcionarios`
- **Descrição**: Lista contatos de funcionários, separando telefone e e-mail.
- **Objetivo**: Facilitar acesso aos dados de contato.
- **Tabelas**: `funcionarios`, `contatos`.

### 4.3. `vw_funcionarios_gerentes`
- **Descrição**: Mostra os funcionários e seus gerentes de departamento.
- **Tabelas**: `funcionarios`, `departamentos`.

### 4.4. `vw_departamentos_resumo`
- **Descrição**: Resumo de cada departamento com número de funcionários, gerente e localização.
- **Tabelas**: `departamentos`, `funcionarios`, `localizacoes`.

### 4.5. `vw_funcionarios_localizacao`
- **Descrição**: Lista de funcionários agrupados por localizações.
- **Tabelas**: `funcionarios`, `localizacoes`, `departamentos`, `cargos`.

### 4.6. `vw_relatorio_gerencial`
- **Descrição**: Relatório gerencial com salário base e benefícios.
- **Tabelas**: `funcionarios`, `departamentos`, `cargos`, `localizacoes`, `contatos`.

---

## 5. Lista de Funções Criadas

### 5.1. `calcular_salario_total`
- **Descrição**: Calcula o salário total com benefícios de 15%.
- **Tabelas**: `funcionarios`, `cargos`.

### 5.2. `obter_nome_gerente_por_departamento`
- **Descrição**: Retorna o nome do gerente de um departamento.
- **Tabelas**: `funcionarios`, `departamentos`.

---

## 6. Lista de Stored Procedures Criadas

### 6.1. `sp_ordenar_funcionarios`
- **Descrição**: Ordena registros da tabela `funcionarios`.
- **Tabelas**: `funcionarios`.

### 6.2. `sp_gerenciar_funcionarios`
- **Descrição**: Permite inserir ou excluir registros na tabela `funcionarios`.
- **Tabelas**: `funcionarios`.

---

## 7. Lista de Triggers Criadas

### 7.1. `before_insert_funcionarios`
- **Descrição**: Registra no log antes de inserir funcionários.
- **Tabelas**: `funcionarios`, `log_operacoes`.

### 7.2. `after_delete_funcionarios`
- **Descrição**: Registra no log após excluir funcionários.
- **Tabelas**: `funcionarios`, `log_operacoes`.

### 7.3. `before_update_contatos`
- **Descrição**: Registra alterações em contatos no log.
- **Tabelas**: `contatos`, `log_operacoes`.

### 7.4. `after_insert_contatos`
- **Descrição**: Registra no log após inserir contatos.
- **Tabelas**: `contatos`, `log_operacoes`.

---
