-- Remoção das tabelas (em ordem inversa de dependência)
DROP TABLE IF EXISTS ALUNO_ENCONTRO;
DROP TABLE IF EXISTS PARTICIPACAO;
DROP TABLE IF EXISTS ENCAMINHAMENTO;
DROP TABLE IF EXISTS DESEMPENHO_ACADEMICO;
DROP TABLE IF EXISTS ALUNO;
DROP TABLE IF EXISTS ENCONTRO;
DROP TABLE IF EXISTS TUTOR;
DROP TABLE IF EXISTS DISCIPLINA;
DROP TABLE IF EXISTS SETOR_APOIO;
DROP TABLE IF EXISTS ATIVIDADE_COMPLEMENTAR;

-- Tabela TUTOR
CREATE TABLE TUTOR (
    codigo_tutor INT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    telefone VARCHAR(20),
    departamento VARCHAR(50),
    data_cadastro DATE
);

-- Tabela ALUNO
CREATE TABLE ALUNO (
    matricula VARCHAR(15) PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    cpf VARCHAR(11) UNIQUE NOT NULL,
    email VARCHAR(100) NOT NULL,
    telefone VARCHAR(20),
    curso VARCHAR(50) NOT NULL,
    periodo_ingresso VARCHAR(10),
    codigo_tutor INT,
    FOREIGN KEY (codigo_tutor) REFERENCES TUTOR(codigo_tutor)
);

-- Tabela DISCIPLINA
CREATE TABLE DISCIPLINA (
    codigo_disciplina VARCHAR(10) PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    carga_horaria INT NOT NULL,
    professor VARCHAR(100),
    ementa TEXT
);

-- Tabela ENCONTRO
CREATE TABLE ENCONTRO (
    codigo_encontro INT PRIMARY KEY,
    data_encontro DATE NOT NULL,
    horario TIME NOT NULL,
    tipo VARCHAR(20) NOT NULL, -- ENUM('individual', 'grupo')
    tema VARCHAR(150),
    duracao INT, -- em minutos
    observacoes TEXT,
    codigo_tutor INT,
    FOREIGN KEY (codigo_tutor) REFERENCES TUTOR(codigo_tutor)
);

-- Tabela DESEMPENHO_ACADEMICO
CREATE TABLE DESEMPENHO_ACADEMICO (
    codigo_desempenho INT PRIMARY KEY,
    nota DECIMAL(4,2) CHECK (nota >= 0 AND nota <= 10),
    frequencia DECIMAL(5,2) CHECK (frequencia >= 0 AND frequencia <= 100),
    periodo_letivo VARCHAR(10) NOT NULL,
    data_avaliacao DATE,
    matricula VARCHAR(15),
    codigo_disciplina VARCHAR(10),
    FOREIGN KEY (matricula) REFERENCES ALUNO(matricula),
    FOREIGN KEY (codigo_disciplina) REFERENCES DISCIPLINA(codigo_disciplina)
);

-- Tabela SETOR_APOIO
CREATE TABLE SETOR_APOIO (
    codigo_setor INT PRIMARY KEY,
    nome_setor VARCHAR(100) NOT NULL,
    responsavel VARCHAR(100),
    email VARCHAR(100),
    telefone VARCHAR(20),
    localizacao VARCHAR(150)
);

-- Tabela ENCAMINHAMENTO
CREATE TABLE ENCAMINHAMENTO (
    codigo_encaminhamento INT PRIMARY KEY,
    data_encaminhamento DATE NOT NULL,
    motivo TEXT NOT NULL,
    observacoes TEXT,
    status VARCHAR(20) NOT NULL, -- ENUM('pendente', 'em_andamento', 'resolvido')
    data_resolucao DATE,
    matricula VARCHAR(15),
    codigo_tutor INT,
    codigo_setor INT,
    FOREIGN KEY (matricula) REFERENCES ALUNO(matricula),
    FOREIGN KEY (codigo_tutor) REFERENCES TUTOR(codigo_tutor),
    FOREIGN KEY (codigo_setor) REFERENCES SETOR_APOIO(codigo_setor)
);

-- Tabela ATIVIDADE_COMPLEMENTAR
CREATE TABLE ATIVIDADE_COMPLEMENTAR (
    codigo_atividade INT PRIMARY KEY,
    titulo VARCHAR(150) NOT NULL,
    descricao TEXT,
    data_atividade DATE NOT NULL,
    horario TIME,
    local VARCHAR(100),
    vagas_disponiveis INT NOT NULL,
    tipo VARCHAR(50) -- ENUM('workshop', 'palestra', 'projeto', 'grupo_estudo')
);

-- Tabela Associativa PARTICIPACAO (ALUNO <-> ATIVIDADE_COMPLEMENTAR)
CREATE TABLE PARTICIPACAO (
    codigo_participacao INT PRIMARY KEY,
    data_inscricao DATE NOT NULL,
    status_presenca VARCHAR(20) NOT NULL, -- ENUM('confirmado', 'faltou', 'aguardando')
    matricula VARCHAR(15),
    codigo_atividade INT,
    FOREIGN KEY (matricula) REFERENCES ALUNO(matricula),
    FOREIGN KEY (codigo_atividade) REFERENCES ATIVIDADE_COMPLEMENTAR(codigo_atividade)
);

-- Tabela Associativa ALUNO_ENCONTRO (ALUNO <-> ENCONTRO)
CREATE TABLE ALUNO_ENCONTRO (
    matricula VARCHAR(15),
    codigo_encontro INT,
    presente BOOLEAN NOT NULL,
    PRIMARY KEY (matricula, codigo_encontro),
    FOREIGN KEY (matricula) REFERENCES ALUNO(matricula),
    FOREIGN KEY (codigo_encontro) REFERENCES ENCONTRO(codigo_encontro)
);
