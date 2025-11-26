# TutorPro – Sistema de Tutoria Acadêmica

## 📝 Descrição do Projeto

Projeto acadêmico de modelagem e implementação de banco de dados para um sistema de tutoria universitária. O objetivo principal é apoiar tutores no acompanhamento de alunos, registrando encontros, desempenho acadêmico, encaminhamentos para setores de apoio e atividades complementares.

---

## 🎯 Objetivos de Aprendizagem

Este projeto visa aplicar e consolidar os seguintes conceitos:

*   **Implementação do Modelo Lógico:** Traduzir o Diagrama Entidade-Relacionamento (DER) para um SGBD relacional.
*   **Normalização:** Garantir que o esquema esteja em conformidade com as Formas Normais (1FN, 2FN e 3FN), assegurando a integridade e a minimização da redundância.
*   **Manipulação de Dados (DML):** Praticar comandos SQL de manipulação de dados (`INSERT`, `SELECT`, `UPDATE` e `DELETE`).
*   **Integridade Referencial:** Utilizar Chaves Estrangeiras (FK) para manter a coerência entre as tabelas.

## 🧱 Tecnologias Utilizadas

| Componente | Tecnologia | Observações |
| :--- | :--- | :--- |
| **Banco de Dados** | MySQL (ou PostgreSQL) | SGBD relacional escolhido para implementação. |
| **Ferramenta Cliente** | MySQL Workbench (ou PGAdmin) | Utilizado para execução e testes dos scripts. |
| **Linguagem** | SQL (DDL e DML) | Linguagem padrão para definição e manipulação de dados. |
| **Controle de Versão** | Git + GitHub | Para versionamento e compartilhamento do código. |

## 🗂 Estrutura do Repositório

| Arquivo | Conteúdo |
| :--- | :--- |
| `01_create_tables.sql` | Script SQL DDL para a criação do banco e de todas as tabelas. |
| `02_insert_dados_iniciais.sql` | Script SQL DML para popular as tabelas com dados coerentes. |
| `03_select_consultas.sql` | Script SQL DML contendo consultas complexas (`SELECT` com `JOIN`, `WHERE`, `ORDER BY`, etc.). |
| `04_update_delete.sql` | Script SQL DML contendo comandos de `UPDATE` e `DELETE` com condições. |
| `README.md` | Este arquivo, com a documentação completa do projeto. |

## 🚀 Como Executar o Projeto

### Pré-requisitos

*   MySQL instalado (ou outro SGBD relacional equivalente).
*   Cliente SQL (MySQL Workbench, DBeaver, etc.).
*   Acesso a um usuário com permissão para criar banco de dados e tabelas.

### Passos

1.  **Clone o repositório:**
    ```bash
    git clone https://github.com/seu-usuario/tutorpro-sql.git
    cd tutorpro-sql
    ```

2.  **Crie o Banco de Dados e as Tabelas:**
    *   Abra seu cliente SQL e crie o banco de dados (ex: `CREATE DATABASE tutorpro; USE tutorpro;`).
    *   Execute o script `01_create_tables.sql` para criar todas as tabelas.

3.  **Popule as Tabelas:**
    *   Execute o script `02_insert_dados_iniciais.sql` para inserir os dados iniciais.

4.  **Teste a Manipulação de Dados:**
    *   Execute `03_select_consultas.sql` para testar as consultas.
    *   Execute `04_update_delete.sql` para testar as operações de atualização e exclusão.

## 🧩 Modelo de Dados Detalhado (DER Normalizado - 3FN)

O modelo é composto por 10 entidades, detalhadas a seguir com seus atributos, tipos de dados e restrições.

### 1. TUTOR

| Atributo | Tipo de Dado | Chave | Restrições | Descrição |
| :--- | :--- | :--- | :--- | :--- |
| `codigo_tutor` | `INT` | **PK** | | Identificador único do tutor. |
| `nome` | `VARCHAR(100)` | | `NOT NULL` | Nome completo do tutor. |
| `email` | `VARCHAR(100)` | | `UNIQUE, NOT NULL` | E-mail institucional do tutor. |
| `telefone` | `VARCHAR(20)` | | | Telefone de contato. |
| `departamento` | `VARCHAR(50)` | | | Departamento de afiliação. |
| `data_cadastro` | `DATE` | | | Data de registro no sistema. |

### 2. ALUNO

| Atributo | Tipo de Dado | Chave | Restrições | Descrição |
| :--- | :--- | :--- | :--- | :--- |
| `matricula` | `VARCHAR(15)` | **PK** | | Número de matrícula do aluno. |
| `nome` | `VARCHAR(100)` | | `NOT NULL` | Nome completo do aluno. |
| `cpf` | `VARCHAR(11)` | | `UNIQUE, NOT NULL` | Cadastro de Pessoa Física. |
| `email` | `VARCHAR(100)` | | `NOT NULL` | E-mail do aluno. |
| `telefone` | `VARCHAR(20)` | | | Telefone de contato. |
| `curso` | `VARCHAR(50)` | | `NOT NULL` | Curso de graduação. |
| `periodo_ingresso` | `VARCHAR(10)` | | | Período de ingresso (ex: 2023.1). |
| `codigo_tutor` | `INT` | **FK** | `REFERENCES TUTOR` | Tutor responsável pelo acompanhamento. |

### 3. DISCIPLINA

| Atributo | Tipo de Dado | Chave | Restrições | Descrição |
| :--- | :--- | :--- | :--- | :--- |
| `codigo_disciplina` | `VARCHAR(10)` | **PK** | | Código único da disciplina. |
| `nome` | `VARCHAR(100)` | | `NOT NULL` | Nome da disciplina. |
| `carga_horaria` | `INT` | | `NOT NULL` | Carga horária em horas. |
| `professor` | `VARCHAR(100)` | | | Nome do professor responsável. |
| `ementa` | `TEXT` | | | Descrição do conteúdo programático. |

### 4. ENCONTRO

| Atributo | Tipo de Dado | Chave | Restrições | Descrição |
| :--- | :--- | :--- | :--- | :--- |
| `codigo_encontro` | `INT` | **PK** | | Identificador único do encontro. |
| `data_encontro` | `DATE` | | `NOT NULL` | Data da realização do encontro. |
| `horario` | `TIME` | | `NOT NULL` | Horário de início. |
| `tipo` | `VARCHAR(20)` | | `NOT NULL` | Tipo de encontro (individual ou grupo). |
| `tema` | `VARCHAR(150)` | | | Assunto principal abordado. |
| `duracao` | `INT` | | | Duração em minutos. |
| `observacoes` | `TEXT` | | | Notas e resumo do encontro. |
| `codigo_tutor` | `INT` | **FK** | `REFERENCES TUTOR` | Tutor que conduziu o encontro. |

### 5. DESEMPENHO_ACADEMICO

| Atributo | Tipo de Dado | Chave | Restrições | Descrição |
| :--- | :--- | :--- | :--- | :--- |
| `codigo_desempenho` | `INT` | **PK** | | Identificador único do registro de desempenho. |
| `nota` | `DECIMAL(4,2)` | | `CHECK (0-10)` | Nota obtida pelo aluno. |
| `frequencia` | `DECIMAL(5,2)` | | `CHECK (0-100)` | Frequência em porcentagem. |
| `periodo_letivo` | `VARCHAR(10)` | | `NOT NULL` | Período letivo da avaliação. |
| `data_avaliacao` | `DATE` | | | Data em que o desempenho foi registrado. |
| `matricula` | `VARCHAR(15)` | **FK** | `REFERENCES ALUNO` | Aluno avaliado. |
| `codigo_disciplina` | `VARCHAR(10)` | **FK** | `REFERENCES DISCIPLINA` | Disciplina avaliada. |

### 6. SETOR_APOIO

| Atributo | Tipo de Dado | Chave | Restrições | Descrição |
| :--- | :--- | :--- | :--- | :--- |
| `codigo_setor` | `INT` | **PK** | | Identificador único do setor. |
| `nome_setor` | `VARCHAR(100)` | | `NOT NULL` | Nome do setor (ex: NAP, Biblioteca). |
| `responsavel` | `VARCHAR(100)` | | | Nome do responsável pelo setor. |
| `email` | `VARCHAR(100)` | | | E-mail de contato. |
| `telefone` | `VARCHAR(20)` | | | Telefone de contato. |
| `localizacao` | `VARCHAR(150)` | | | Localização física. |

### 7. ENCAMINHAMENTO

| Atributo | Tipo de Dado | Chave | Restrições | Descrição |
| :--- | :--- | :--- | :--- | :--- |
| `codigo_encaminhamento` | `INT` | **PK** | | Identificador único do encaminhamento. |
| `data_encaminhamento` | `DATE` | | `NOT NULL` | Data em que o encaminhamento foi feito. |
| `motivo` | `TEXT` | | `NOT NULL` | Descrição do motivo do encaminhamento. |
| `observacoes` | `TEXT` | | | Observações adicionais. |
| `status` | `VARCHAR(20)` | | `NOT NULL` | Situação (pendente, em_andamento, resolvido). |
| `data_resolucao` | `DATE` | | | Data de resolução do caso. |
| `matricula` | `VARCHAR(15)` | **FK** | `REFERENCES ALUNO` | Aluno encaminhado. |
| `codigo_tutor` | `INT` | **FK** | `REFERENCES TUTOR` | Tutor que realizou o encaminhamento. |
| `codigo_setor` | `INT` | **FK** | `REFERENCES SETOR_APOIO` | Setor que recebeu o encaminhamento. |

### 8. ATIVIDADE_COMPLEMENTAR

| Atributo | Tipo de Dado | Chave | Restrições | Descrição |
| :--- | :--- | :--- | :--- | :--- |
| `codigo_atividade` | `INT` | **PK** | | Identificador único da atividade. |
| `titulo` | `VARCHAR(150)` | | `NOT NULL` | Título da atividade. |
| `descricao` | `TEXT` | | | Descrição detalhada. |
| `data_atividade` | `DATE` | | `NOT NULL` | Data de realização. |
| `horario` | `TIME` | | | Horário de início. |
| `local` | `VARCHAR(100)` | | | Local de realização. |
| `vagas_disponiveis` | `INT` | | `NOT NULL` | Número de vagas. |
| `tipo` | `VARCHAR(50)` | | | Tipo (workshop, palestra, projeto, grupo_estudo). |

### 9. PARTICIPACAO (Entidade Associativa N:N entre ALUNO e ATIVIDADE_COMPLEMENTAR)

| Atributo | Tipo de Dado | Chave | Restrições | Descrição |
| :--- | :--- | :--- | :--- | :--- |
| `codigo_participacao` | `INT` | **PK** | | Identificador único da participação. |
| `data_inscricao` | `DATE` | | `NOT NULL` | Data de inscrição do aluno. |
| `status_presenca` | `VARCHAR(20)` | | `NOT NULL` | Situação da presença (confirmado, faltou, aguardando). |
| `matricula` | `VARCHAR(15)` | **FK** | `REFERENCES ALUNO` | Aluno participante. |
| `codigo_atividade` | `INT` | **FK** | `REFERENCES ATIVIDADE_COMPLEMENTAR` | Atividade complementar. |

### 10. ALUNO_ENCONTRO (Entidade Associativa N:N entre ALUNO e ENCONTRO)

| Atributo | Tipo de Dado | Chave | Restrições | Descrição |
| :--- | :--- | :--- | :--- | :--- |
| `matricula` | `VARCHAR(15)` | **PK, FK** | `REFERENCES ALUNO` | Aluno que participou do encontro. |
| `codigo_encontro` | `INT` | **PK, FK** | `REFERENCES ENCONTRO` | Encontro realizado. |
| `presente` | `BOOLEAN` | | `NOT NULL` | Indica se o aluno estava presente (`TRUE` ou `FALSE`). |

---
**Autor:** Afonso Buarque da Silva Gusmao
**RGM:**  462812820
