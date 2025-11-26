-- 1. Inserção de dados na tabela TUTOR
INSERT INTO TUTOR (codigo_tutor, nome, email, telefone, departamento, data_cadastro) VALUES
(101, 'Ana Paula Silva', 'ana.silva@uni.br', '99123-4567', 'Matemática', '2020-08-15'),
(102, 'Carlos Eduardo Santos', 'carlos.santos@uni.br', '99876-5432', 'Computação', '2021-03-01'),
(103, 'Mariana Lima Costa', 'mariana.costa@uni.br', '99555-1234', 'Letras', '2022-01-20');

-- 2. Inserção de dados na tabela DISCIPLINA
INSERT INTO DISCIPLINA (codigo_disciplina, nome, carga_horaria, professor, ementa) VALUES
('MAT101', 'Cálculo I', 60, 'Dr. João Pereira', 'Fundamentos do cálculo diferencial e integral.'),
('COMP205', 'Estrutura de Dados', 60, 'Dra. Lúcia Mendes', 'Implementação e análise de estruturas de dados.'),
('LET302', 'Linguística Aplicada', 45, 'Ms. Roberto Alves', 'Estudo da linguagem em contextos sociais.');

-- 3. Inserção de dados na tabela SETOR_APOIO
INSERT INTO SETOR_APOIO (codigo_setor, nome_setor, responsavel, email, telefone, localizacao) VALUES
(1, 'Núcleo de Apoio Psicopedagógico', 'Dr. Pedro Rocha', 'nap@uni.br', '3333-1111', 'Prédio Central, Sala 10'),
(2, 'Biblioteca Central', 'Sra. Helena Souza', 'biblioteca@uni.br', '3333-2222', 'Prédio Anexo');

-- 4. Inserção de dados na tabela ALUNO
INSERT INTO ALUNO (matricula, nome, cpf, email, telefone, curso, periodo_ingresso, codigo_tutor) VALUES
('2023001', 'Bruno Oliveira', '11122233344', 'bruno.o@aluno.br', '98888-7777', 'Engenharia Civil', '2023.1', 101),
('2023002', 'Camila Ferreira', '22233344455', 'camila.f@aluno.br', '97777-6666', 'Ciência da Computação', '2023.1', 102),
('2022010', 'Daniela Gomes', '33344455566', 'daniela.g@aluno.br', '96666-5555', 'Matemática', '2022.2', 101),
('2024005', 'Eduardo Pires', '44455566677', 'eduardo.p@aluno.br', '95555-4444', 'Letras', '2024.1', 103),
('2023003', 'Felipe Costa', '55566677788', 'felipe.c@aluno.br', '94444-3333', 'Ciência da Computação', '2023.1', 102);

-- 5. Inserção de dados na tabela ENCONTRO
INSERT INTO ENCONTRO (codigo_encontro, data_encontro, horario, tipo, tema, duracao, observacoes, codigo_tutor) VALUES
(1, '2025-11-20', '10:00:00', 'individual', 'Dificuldade em Cálculo I', 60, 'Aluno com dúvidas em limites.', 101),
(2, '2025-11-21', '14:30:00', 'grupo', 'Revisão de Estrutura de Dados', 90, 'Foco em listas encadeadas.', 102),
(3, '2025-11-22', '09:00:00', 'individual', 'Orientação de TCC', 45, 'Definição do escopo do trabalho.', 103);

-- 6. Inserção de dados na tabela DESEMPENHO_ACADEMICO
INSERT INTO DESEMPENHO_ACADEMICO (codigo_desempenho, nota, frequencia, periodo_letivo, data_avaliacao, matricula, codigo_disciplina) VALUES
(1, 8.5, 90.00, '2023.1', '2023-07-10', '2023002', 'COMP205'),
(2, 5.5, 70.00, '2023.1', '2023-07-10', '2023001', 'MAT101'),
(3, 9.0, 100.00, '2022.2', '2023-01-25', '2022010', 'MAT101');

-- 7. Inserção de dados na tabela ENCAMINHAMENTO
INSERT INTO ENCAMINHAMENTO (codigo_encaminhamento, data_encaminhamento, motivo, observacoes, status, data_resolucao, matricula, codigo_tutor, codigo_setor) VALUES
(1, '2025-11-20', 'Ansiedade e dificuldade de concentração em provas.', 'Aluno demonstrou alto nível de estresse.', 'em_andamento', NULL, '2023001', 101, 1),
(2, '2025-11-21', 'Necessidade de material de apoio bibliográfico específico.', 'Solicitação de livros raros para pesquisa.', 'resolvido', '2025-11-23', '2024005', 103, 2);

-- 8. Inserção de dados na tabela ATIVIDADE_COMPLEMENTAR
INSERT INTO ATIVIDADE_COMPLEMENTAR (codigo_atividade, titulo, descricao, data_atividade, horario, local, vagas_disponiveis, tipo) VALUES
(1, 'Workshop de Python para Iniciantes', 'Introdução à linguagem Python e suas aplicações.', '2025-12-05', '18:30:00', 'Laboratório 3', 30, 'workshop'),
(2, 'Palestra sobre Mercado de Trabalho em TI', 'Tendências e habilidades mais procuradas.', '2025-12-10', '19:00:00', 'Auditório Principal', 100, 'palestra');

-- 9. Inserção de dados na tabela PARTICIPACAO (Relacionamento N:N entre ALUNO e ATIVIDADE_COMPLEMENTAR)
INSERT INTO PARTICIPACAO (codigo_participacao, data_inscricao, status_presenca, matricula, codigo_atividade) VALUES
(1, '2025-11-25', 'confirmado', '2023002', 1), -- Camila no Workshop
(2, '2025-11-25', 'confirmado', '2023003', 1), -- Felipe no Workshop
(3, '2025-11-25', 'aguardando', '2024005', 2); -- Eduardo na Palestra

-- 10. Inserção de dados na tabela ALUNO_ENCONTRO (Relacionamento N:N entre ALUNO e ENCONTRO)
INSERT INTO ALUNO_ENCONTRO (matricula, codigo_encontro, presente) VALUES
('2023001', 1, TRUE), -- Bruno no Encontro 1 (individual)
('2023002', 2, TRUE), -- Camila no Encontro 2 (grupo)
('2023003', 2, TRUE), -- Felipe no Encontro 2 (grupo)
('2022010', 1, FALSE); -- Daniela faltou ao Encontro 1 (individual)
