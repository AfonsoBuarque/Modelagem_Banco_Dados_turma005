
-- 1. Comandos UPDATE

-- UPDATE 1: Atualizar o status de um encaminhamento que estava 'em_andamento' para 'resolvido'.
UPDATE ENCAMINHAMENTO
SET
    status = 'resolvido',
    data_resolucao = CURRENT_DATE
WHERE
    codigo_encaminhamento = 1;

-- UPDATE 2: Corrigir o telefone de um tutor.
UPDATE TUTOR
SET
    telefone = '99111-2222'
WHERE
    codigo_tutor = 101;

-- UPDATE 3: Aumentar a carga horária de uma disciplina que não é de exatas.
UPDATE DISCIPLINA
SET
    carga_horaria = carga_horaria + 15
WHERE
    codigo_disciplina = 'LET302';

-- 2. Comandos DELETE

-- DELETE 1: Remover um registro de desempenho acadêmico com nota baixa (abaixo de 6.0) para que o aluno possa refazer a avaliação.

DELETE FROM DESEMPENHO_ACADEMICO
WHERE
    nota < 6.0 AND matricula = '2023001';

-- DELETE 2: Remover uma participação em atividade complementar que ainda está 'aguardando' (o aluno desistiu).
DELETE FROM PARTICIPACAO
WHERE
    status_presenca = 'aguardando' AND matricula = '2024005';

-- DELETE 3: Remover um encontro que foi cancelado (o encontro de código 3).
-- É necessário garantir que não haja registros em ALUNO_ENCONTRO que referenciem este encontro,

DELETE FROM ENCONTRO
WHERE
    codigo_encontro = 3;
