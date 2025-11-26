-- Consulta 1: Listar Alunos e seus Tutores
-- Uso de JOIN para combinar ALUNO e TUTOR, e ORDER BY para organizar.
SELECT
    A.matricula,
    A.nome AS nome_aluno,
    A.curso,
    T.nome AS nome_tutor,
    T.departamento
FROM
    ALUNO A
JOIN
    TUTOR T ON A.codigo_tutor = T.codigo_tutor
ORDER BY
    T.nome, A.nome;

-- Consulta 2: Desempenho Acadêmico de Alunos em Disciplinas Específicas
-- Uso de múltiplos JOINs (ALUNO, DESEMPENHO_ACADEMICO, DISCIPLINA) e WHERE para filtrar por nota.
SELECT
    A.nome AS nome_aluno,
    D.nome AS nome_disciplina,
    DA.nota,
    DA.frequencia
FROM
    ALUNO A
JOIN
    DESEMPENHO_ACADEMICO DA ON A.matricula = DA.matricula
JOIN
    DISCIPLINA D ON DA.codigo_disciplina = D.codigo_disciplina
WHERE
    DA.nota < 7.0
ORDER BY
    DA.nota DESC;

-- Consulta 3: Encontros de Grupo realizados por Tutor
-- Uso de JOIN (ENCONTRO, TUTOR) e WHERE para filtrar por tipo de encontro.
SELECT
    T.nome AS nome_tutor,
    E.data_encontro,
    E.horario,
    E.tema,
    E.duracao
FROM
    ENCONTRO E
JOIN
    TUTOR T ON E.codigo_tutor = T.codigo_tutor
WHERE
    E.tipo = 'grupo'
ORDER BY
    E.data_encontro DESC;

-- Consulta 4: Alunos que participaram de um Encontro e o Tutor responsável
-- Uso de múltiplos JOINs (ALUNO, ALUNO_ENCONTRO, ENCONTRO, TUTOR) e WHERE para filtrar por presença.
SELECT
    A.nome AS nome_aluno,
    E.tema AS tema_encontro,
    E.data_encontro,
    T.nome AS nome_tutor
FROM
    ALUNO A
JOIN
    ALUNO_ENCONTRO AE ON A.matricula = AE.matricula
JOIN
    ENCONTRO E ON AE.codigo_encontro = E.codigo_encontro
JOIN
    TUTOR T ON E.codigo_tutor = T.codigo_tutor
WHERE
    AE.presente = TRUE
ORDER BY
    E.data_encontro, A.nome;

-- Consulta 5: Contagem de Encaminhamentos por Setor de Apoio
-- Uso de JOIN (ENCAMINHAMENTO, SETOR_APOIO), GROUP BY e COUNT.
SELECT
    SA.nome_setor,
    COUNT(E.codigo_encaminhamento) AS total_encaminhamentos
FROM
    ENCAMINHAMENTO E
JOIN
    SETOR_APOIO SA ON E.codigo_setor = SA.codigo_setor
GROUP BY
    SA.nome_setor
ORDER BY
    total_encaminhamentos DESC
LIMIT 5;
