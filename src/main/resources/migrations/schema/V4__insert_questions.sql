-- ==============================================
-- Migration: R__2_insert_questions.sql
-- Tipo: seed
-- Criada em: 2025-11-07 11:49:10
-- ==============================================

-- Escreva seus comandos SQL abaixo:
----------------------------------------------------------------
-- ORIGINAL QUESTIONS
----------------------------------------------------------------
-- Question 1
INSERT INTO question (position, text_i18n, is_tiebreaker)
VALUES (1, '{"pt":"Um sábado perfeito pra você é…"}'::jsonb, FALSE);

INSERT INTO "option" (question_id, text_i18n) VALUES
(
    (SELECT id FROM question WHERE position=1),
    '{"pt":"Curtir uma festa com amigos até de madrugada"}'::jsonb
),
(
    (SELECT id FROM question WHERE position=1),
    '{"pt":"Um jantar aconchegante em casa"}'::jsonb
),
(
    (SELECT id FROM question WHERE position=1),
    '{"pt":"Viajar para conhecer um lugar novo"}'::jsonb
),
(
    (SELECT id FROM question WHERE position=1),
    '{"pt":"Sair para conhecer lugares ou restaurantes novos"}'::jsonb
);

INSERT INTO option_weight (option_id, archetype_id, "weight") VALUES
(
    (SELECT o.id FROM "option" o JOIN question q ON o.question_id=q.id
        WHERE q.position=1 AND o.text_i18n->>'pt' = 'Curtir uma festa com amigos até de madrugada'),
    (SELECT id FROM archetype WHERE code = 'magnetic'),
    0.5
),
(
    (SELECT o.id FROM "option" o JOIN question q ON o.question_id=q.id
        WHERE q.position=1 AND o.text_i18n->>'pt' = 'Curtir uma festa com amigos até de madrugada'),
    (SELECT id FROM archetype WHERE code = 'intense'),
    0.5
),
(
    (SELECT o.id FROM "option" o JOIN question q ON o.question_id=q.id
        WHERE q.position=1 AND o.text_i18n->>'pt' = 'Um jantar aconchegante em casa'),
    (SELECT id FROM archetype WHERE code = 'affectionate'),
    0.5
),
(
    (SELECT o.id FROM "option" o JOIN question q ON o.question_id=q.id
        WHERE q.position=1 AND o.text_i18n->>'pt' = 'Um jantar aconchegante em casa'),
    (SELECT id FROM archetype WHERE code = 'determined'),
    0.5
),
(
    (SELECT o.id FROM "option" o JOIN question q ON o.question_id=q.id
        WHERE q.position=1 AND o.text_i18n->>'pt' = 'Viajar para conhecer um lugar novo'),
    (SELECT id FROM archetype WHERE code = 'free'),
    0.5
),
(
    (SELECT o.id FROM "option" o JOIN question q ON o.question_id=q.id
        WHERE q.position=1 AND o.text_i18n->>'pt' = 'Viajar para conhecer um lugar novo'),
    (SELECT id FROM archetype WHERE code = 'fluent'),
    0.5
),
(
    (SELECT o.id FROM "option" o JOIN question q ON o.question_id=q.id
        WHERE q.position=1 AND o.text_i18n->>'pt' = 'Sair para conhecer lugares ou restaurantes novos'),
    (SELECT id FROM archetype WHERE code = 'magnetic'),
    0.5
),
(
    (SELECT o.id FROM "option" o JOIN question q ON o.question_id=q.id
        WHERE q.position=1 AND o.text_i18n->>'pt' = 'Sair para conhecer lugares ou restaurantes novos'),
    (SELECT id FROM archetype WHERE code = 'free'),
    0.5
);

----------------------------------------------------------------
-- Question 2
----------------------------------------------------------------
INSERT INTO question (position, text_i18n, is_tiebreaker)
VALUES (2, '{"pt":"No amor, você é mais…"}'::jsonb, FALSE);

INSERT INTO "option" (question_id, text_i18n) VALUES
(
  (SELECT id FROM question WHERE position=2),
  '{"pt":"Intenso(a), gosta de viver tudo profundamente"}'::jsonb
),
(
  (SELECT id FROM question WHERE position=2),
  '{"pt":"Acolhedor(a), cuida de cada detalhe"}'::jsonb
),
(
  (SELECT id FROM question WHERE position=2),
  '{"pt":"Sonhador(a), gosta de experiências e liberdade"}'::jsonb
),
(
  (SELECT id FROM question WHERE position=2),
  '{"pt":"Estável, valoriza clareza e propósito"}'::jsonb
);

INSERT INTO option_weight (option_id, archetype_id, "weight") VALUES
(
    (SELECT o.id FROM "option" o JOIN question q ON o.question_id=q.id
        WHERE q.position=2 AND o.text_i18n->>'pt' = 'Intenso(a), gosta de viver tudo profundamente'),
    (SELECT id FROM archetype WHERE code = 'intense'),
    1.0
),
(
    (SELECT o.id FROM "option" o JOIN question q ON o.question_id=q.id
        WHERE q.position=2 AND o.text_i18n->>'pt' = 'Acolhedor(a), cuida de cada detalhe'),
    (SELECT id FROM archetype WHERE code = 'affectionate'),
    1.0
),
(
    (SELECT o.id FROM "option" o JOIN question q ON o.question_id=q.id
        WHERE q.position=2 AND o.text_i18n->>'pt' = 'Sonhador(a), gosta de experiências e liberdade'),
    (SELECT id FROM archetype WHERE code = 'free'),
    1.0
),
(
    (SELECT o.id FROM "option" o JOIN question q ON o.question_id=q.id
        WHERE q.position=2 AND o.text_i18n->>'pt' = 'Estável, valoriza clareza e propósito'),
    (SELECT id FROM archetype WHERE code = 'determined'),
    1.0
);

----------------------------------------------------------------
-- Question 3
----------------------------------------------------------------
INSERT INTO question (position, text_i18n, is_tiebreaker)
VALUES (3, '{"pt":"Qual elogio você mais gosta de ouvir?"}'::jsonb, FALSE);

INSERT INTO "option" (question_id, text_i18n) VALUES
(
  (SELECT id FROM question WHERE position=3),
  '{"pt":"Você é cheio(a) de energia!"}'::jsonb
),
(
  (SELECT id FROM question WHERE position=3),
  '{"pt":"Você é muito atencioso(a) e carinhoso(a)."}'::jsonb
),
(
  (SELECT id FROM question WHERE position=3),
  '{"pt":"Você é tão inteligente e focado(a)."}'::jsonb
),
(
  (SELECT id FROM question WHERE position=3),
  '{"pt":"Você é leve, uma ótima companhia."}'::jsonb
);

INSERT INTO option_weight (option_id, archetype_id, "weight") VALUES
(
    (SELECT o.id FROM "option" o JOIN question q ON o.question_id=q.id
        WHERE q.position=3 AND o.text_i18n->>'pt' = 'Você é cheio(a) de energia!'),
    (SELECT id FROM archetype WHERE code = 'magnetic'),
    0.5
),
(
    (SELECT o.id FROM "option" o JOIN question q ON o.question_id=q.id
        WHERE q.position=3 AND o.text_i18n->>'pt' = 'Você é cheio(a) de energia!'),
    (SELECT id FROM archetype WHERE code = 'intense'),
    0.5
),
(
    (SELECT o.id FROM "option" o JOIN question q ON o.question_id=q.id
        WHERE q.position=3 AND o.text_i18n->>'pt' = 'Você é muito atencioso(a) e carinhoso(a).'),
    (SELECT id FROM archetype WHERE code = 'affectionate'),
    1.0
),
(
    (SELECT o.id FROM "option" o JOIN question q ON o.question_id=q.id
        WHERE q.position=3 AND o.text_i18n->>'pt' = 'Você é tão inteligente e focado(a).'),
    (SELECT id FROM archetype WHERE code = 'determined'),
    1.0
),
(
    (SELECT o.id FROM "option" o JOIN question q ON o.question_id=q.id
        WHERE q.position=3 AND o.text_i18n->>'pt' = 'Você é leve, uma ótima companhia.'),
    (SELECT id FROM archetype WHERE code = 'fluent'),
    1.0
);

----------------------------------------------------------------
-- Question 4
----------------------------------------------------------------
INSERT INTO question (position, text_i18n, is_tiebreaker)
VALUES (4, '{"pt":"Em um conflito, você tende a…"}'::jsonb, FALSE);

INSERT INTO "option" (question_id, text_i18n) VALUES
(
  (SELECT id FROM question WHERE position=4),
  '{"pt":"Falar logo o que sente, com intensidade"}'::jsonb
),
(
  (SELECT id FROM question WHERE position=4),
  '{"pt":"Tentar ouvir e acolher o outro"}'::jsonb
),
(
  (SELECT id FROM question WHERE position=4),
  '{"pt":"Procurar resolver de forma prática"}'::jsonb
),
(
  (SELECT id FROM question WHERE position=4),
  '{"pt":"Deixar o tempo suavizar e depois conversar"}'::jsonb
);

INSERT INTO option_weight (option_id, archetype_id, "weight") VALUES
(
    (SELECT o.id FROM "option" o JOIN question q ON o.question_id=q.id
        WHERE q.position=4 AND o.text_i18n->>'pt' = 'Falar logo o que sente, com intensidade'),
    (SELECT id FROM archetype WHERE code = 'intense'),
    1.0
),
(
    (SELECT o.id FROM "option" o JOIN question q ON o.question_id=q.id
        WHERE q.position=4 AND o.text_i18n->>'pt' = 'Tentar ouvir e acolher o outro'),
    (SELECT id FROM archetype WHERE code = 'affectionate'),
    1.0
),
(
    (SELECT o.id FROM "option" o JOIN question q ON o.question_id=q.id
        WHERE q.position=4 AND o.text_i18n->>'pt' = 'Procurar resolver de forma prática'),
    (SELECT id FROM archetype WHERE code = 'determined'),
    1.0
),
(
    (SELECT o.id FROM "option" o JOIN question q ON o.question_id=q.id
        WHERE q.position=4 AND o.text_i18n->>'pt' = 'Deixar o tempo suavizar e depois conversar'),
    (SELECT id FROM archetype WHERE code = 'fluent'),
    1.0
);

----------------------------------------------------------------
-- Question 5
----------------------------------------------------------------
INSERT INTO question (position, text_i18n, is_tiebreaker)
VALUES (5, '{"pt":"Qual cenário mais te atrai num relacionamento?"}'::jsonb, FALSE);

INSERT INTO "option" (question_id, text_i18n) VALUES
(
  (SELECT id FROM question WHERE position=5),
  '{"pt":"Aventuras, viagens e novidades"}'::jsonb
),
(
  (SELECT id FROM question WHERE position=5),
  '{"pt":"Construir uma família sólida"}'::jsonb
),
(
  (SELECT id FROM question WHERE position=5),
  '{"pt":"Viver momentos leves e espontâneos"}'::jsonb
),
(
  (SELECT id FROM question WHERE position=5),
  '{"pt":"Paixão intensa e química forte"}'::jsonb
);

INSERT INTO option_weight (option_id, archetype_id, "weight") VALUES
(
    (SELECT o.id FROM "option" o JOIN question q ON o.question_id=q.id
        WHERE q.position=5 AND o.text_i18n->>'pt' = 'Aventuras, viagens e novidades'),
    (SELECT id FROM archetype WHERE code = 'free'),
    1.0
),
(
    (SELECT o.id FROM "option" o JOIN question q ON o.question_id=q.id
        WHERE q.position=5 AND o.text_i18n->>'pt' = 'Construir uma família sólida'),
    (SELECT id FROM archetype WHERE code = 'determined'),
    1.0
),
(
    (SELECT o.id FROM "option" o JOIN question q ON o.question_id=q.id
        WHERE q.position=5 AND o.text_i18n->>'pt' = 'Viver momentos leves e espontâneos'),
    (SELECT id FROM archetype WHERE code = 'fluent'),
    1.0
),
(
    (SELECT o.id FROM "option" o JOIN question q ON o.question_id=q.id
        WHERE q.position=5 AND o.text_i18n->>'pt' = 'Paixão intensa e química forte'),
    (SELECT id FROM archetype WHERE code = 'intense'),
    1.0
);

----------------------------------------------------------------
-- Question 6
----------------------------------------------------------------
INSERT INTO question (position, text_i18n, is_tiebreaker)
VALUES (6, '{"pt":"Com amigos, você é o(a)…"}'::jsonb, FALSE);

INSERT INTO "option" (question_id, text_i18n) VALUES
(
  (SELECT id FROM question WHERE position=6),
  '{"pt":"Que sempre organiza encontros"}'::jsonb
),
(
  (SELECT id FROM question WHERE position=6),
  '{"pt":"Que dá conselhos e ouve todo mundo"}'::jsonb
),
(
  (SELECT id FROM question WHERE position=6),
  '{"pt":"Que sempre topa novas experiências"}'::jsonb
),
(
  (SELECT id FROM question WHERE position=6),
  '{"pt":"Que mantém todos com os pés no chão"}'::jsonb
);

INSERT INTO option_weight (option_id, archetype_id, "weight") VALUES
(
    (SELECT o.id FROM "option" o JOIN question q ON o.question_id=q.id
        WHERE q.position=6 AND o.text_i18n->>'pt' = 'Que sempre organiza encontros'),
    (SELECT id FROM archetype WHERE code = 'magnetic'),
    1.0
),
(
    (SELECT o.id FROM "option" o JOIN question q ON o.question_id=q.id
        WHERE q.position=6 AND o.text_i18n->>'pt' = 'Que dá conselhos e ouve todo mundo'),
    (SELECT id FROM archetype WHERE code = 'affectionate'),
    1.0
),
(
    (SELECT o.id FROM "option" o JOIN question q ON o.question_id=q.id
        WHERE q.position=6 AND o.text_i18n->>'pt' = 'Que sempre topa novas experiências'),
    (SELECT id FROM archetype WHERE code = 'free'),
    1.0
),
(
    (SELECT o.id FROM "option" o JOIN question q ON o.question_id=q.id
        WHERE q.position=6 AND o.text_i18n->>'pt' = 'Que mantém todos com os pés no chão'),
    (SELECT id FROM archetype WHERE code = 'determined'),
    1.0
);

----------------------------------------------------------------
-- Question 7
----------------------------------------------------------------
INSERT INTO question (position, text_i18n, is_tiebreaker)
VALUES (7, '{"pt":"Qual dessas frases combina mais com você?"}'::jsonb, FALSE);

INSERT INTO "option" (question_id, text_i18n) VALUES
(
  (SELECT id FROM question WHERE position=7),
  '{"pt":"O amor tem que ser intenso."}'::jsonb
),
(
  (SELECT id FROM question WHERE position=7),
  '{"pt":"O amor está nos detalhes."}'::jsonb
),
(
  (SELECT id FROM question WHERE position=7),
  '{"pt":"O amor é liberdade."}'::jsonb
),
(
  (SELECT id FROM question WHERE position=7),
  '{"pt":"O amor é construir juntos."}'::jsonb
),
(
  (SELECT id FROM question WHERE position=7),
  '{"pt":"O amor pode ser leve."}'::jsonb
),
(
  (SELECT id FROM question WHERE position=7),
  '{"pt":"O amor é energia que conecta."}'::jsonb
);

INSERT INTO option_weight (option_id, archetype_id, "weight") VALUES
(
    (SELECT o.id FROM "option" o JOIN question q ON o.question_id=q.id
        WHERE q.position=7 AND o.text_i18n->>'pt' = 'O amor tem que ser intenso.'),
    (SELECT id FROM archetype WHERE code = 'intense'),
    1.0
),
(
    (SELECT o.id FROM "option" o JOIN question q ON o.question_id=q.id
        WHERE q.position=7 AND o.text_i18n->>'pt' = 'O amor está nos detalhes.'),
    (SELECT id FROM archetype WHERE code = 'affectionate'),
    1.0
),
(
    (SELECT o.id FROM "option" o JOIN question q ON o.question_id=q.id
        WHERE q.position=7 AND o.text_i18n->>'pt' = 'O amor é liberdade.'),
    (SELECT id FROM archetype WHERE code = 'free'),
    1.0
),
(
    (SELECT o.id FROM "option" o JOIN question q ON o.question_id=q.id
        WHERE q.position=7 AND o.text_i18n->>'pt' = 'O amor é construir juntos.'),
    (SELECT id FROM archetype WHERE code = 'determined'),
    1.0
),
(
    (SELECT o.id FROM "option" o JOIN question q ON o.question_id=q.id
        WHERE q.position=7 AND o.text_i18n->>'pt' = 'O amor pode ser leve.'),
    (SELECT id FROM archetype WHERE code = 'fluent'),
    1.0
),
(
    (SELECT o.id FROM "option" o JOIN question q ON o.question_id=q.id
        WHERE q.position=7 AND o.text_i18n->>'pt' = 'O amor é energia que conecta.'),
    (SELECT id FROM archetype WHERE code = 'magnetic'),
    1.0
);

----------------------------------------------------------------
-- TIEBREAKERS
----------------------------------------------------------------
-- (magnetic, intense) -> 1001,1002
INSERT INTO tiebreaker_pair (archetype_a_id, archetype_b_id)
SELECT
    LEAST(a.id, b.id),
    GREATEST(a.id, b.id)
FROM
    (SELECT id FROM archetype WHERE code = 'magnetic') a,
    (SELECT id FROM archetype WHERE code = 'intense') b
ON CONFLICT (archetype_a_id, archetype_b_id) DO NOTHING;

----------------------------------------------------------------
-- Question 1001
----------------------------------------------------------------
INSERT INTO question (position, text_i18n, is_tiebreaker, tiebreaker_pair_id)
VALUES (
    1001,
    '{"pt": "O que melhor descreve sua forma de amar..."}'::jsonb,
    TRUE,
    (
        SELECT id
        FROM tiebreaker_pair
        WHERE archetype_a_id = LEAST(
            (SELECT id FROM archetype WHERE code = 'magnetic'),
            (SELECT id FROM archetype WHERE code = 'intense')
        )
        AND archetype_b_id = GREATEST(
            (SELECT id FROM archetype WHERE code = 'magnetic'),
            (SELECT id FROM archetype WHERE code = 'intense')
        )
   )
);

INSERT INTO "option" (question_id, text_i18n) VALUES
(
    (SELECT id FROM question WHERE position = 1001),
    '{"pt": "Energia social, diversão e conexão vibrante"}'::jsonb
),
(
    (SELECT id FROM question WHERE position = 1001),
    '{"pt": "Paixão profunda, intensidade emocional"}'::jsonb
);

INSERT INTO option_weight (option_id, archetype_id, "weight") VALUES
(
    (
        SELECT o.id
        FROM "option" o
        JOIN question q ON o.question_id = q.id
        WHERE q.position = 1001
        AND o.text_i18n->>'pt' = 'Energia social, diversão e conexão vibrante'
    ),
    (SELECT id FROM archetype WHERE code = 'magnetic'),
    1.0
),
(
    (
        SELECT o.id
        FROM "option" o
        JOIN question q ON o.question_id = q.id
        WHERE q.position = 1001
        AND o.text_i18n->>'pt' = 'Paixão profunda, intensidade emocional'
    ),
    (SELECT id FROM archetype WHERE code = 'intense'),
    1.0
);

----------------------------------------------------------------
-- Question 1002
----------------------------------------------------------------
INSERT INTO question (position, text_i18n, is_tiebreaker, tiebreaker_pair_id)
VALUES (
   1002,
   '{"pt": "Na conquista, você..."}'::jsonb,
   TRUE,
   (
        SELECT id
        FROM tiebreaker_pair
        WHERE archetype_a_id = LEAST(
            (SELECT id FROM archetype WHERE code = 'magnetic'),
            (SELECT id FROM archetype WHERE code = 'intense')
        )
        AND archetype_b_id = GREATEST(
            (SELECT id FROM archetype WHERE code = 'magnetic'),
            (SELECT id FROM archetype WHERE code = 'intense')
        )
   )
);

INSERT INTO "option" (question_id, text_i18n) VALUES
(
  (SELECT id FROM question WHERE position = 1002),
  '{"pt": "Usa seu carisma e atrai naturalmente"}'::jsonb
),
(
  (SELECT id FROM question WHERE position = 1002),
  '{"pt": "Vive o momento com entrega total"}'::jsonb
);

INSERT INTO option_weight (option_id, archetype_id, "weight") VALUES
(
    (
        SELECT o.id
        FROM "option" o
        JOIN question q ON o.question_id = q.id
        WHERE q.position = 1002
        AND o.text_i18n->>'pt' = 'Usa seu carisma e atrai naturalmente'
    ),
    (SELECT id FROM archetype WHERE code = 'magnetic'),
    1.0
),
(
    (
        SELECT o.id
        FROM "option" o
        JOIN question q ON o.question_id = q.id
        WHERE q.position = 1002
        AND o.text_i18n->>'pt' = 'Vive o momento com entrega total'
    ),
    (SELECT id FROM archetype WHERE code = 'intense'),
    1.0
);


-- (magnetic, affectionate) -> question 1003,1004
INSERT INTO tiebreaker_pair (archetype_a_id, archetype_b_id)
SELECT
    LEAST(a.id, b.id),
    GREATEST(a.id, b.id)
FROM
    (SELECT id FROM archetype WHERE code = 'magnetic') a,
    (SELECT id FROM archetype WHERE code = 'affectionate') b
ON CONFLICT (archetype_a_id, archetype_b_id) DO NOTHING;

----------------------------------------------------------------
-- Question 1003
----------------------------------------------------------------
INSERT INTO question (position, text_i18n, is_tiebreaker, tiebreaker_pair_id)
VALUES (
   1003,
   '{"pt": "O que mais define você?"}'::jsonb,
   TRUE,
   (
        SELECT id
        FROM tiebreaker_pair
        WHERE archetype_a_id = LEAST(
            (SELECT id FROM archetype WHERE code = 'magnetic'),
            (SELECT id FROM archetype WHERE code = 'affectionate')
        )
        AND archetype_b_id = GREATEST(
            (SELECT id FROM archetype WHERE code = 'magnetic'),
            (SELECT id FROM archetype WHERE code = 'affectionate')
        )
   )
);

INSERT INTO "option" (question_id, text_i18n) VALUES
(
  (SELECT id FROM question WHERE position = 1003),
  '{"pt": "O carisma e a energia que atraem os outros"}'::jsonb
),
(
  (SELECT id FROM question WHERE position = 1003),
  '{"pt": "O acolhimento e a empatia"}'::jsonb
);

INSERT INTO option_weight (option_id, archetype_id, "weight") VALUES
(
     (
        SELECT o.id
        FROM "option" o
        JOIN question q ON o.question_id = q.id
        WHERE q.position = 1003
        AND o.text_i18n->>'pt' = 'O carisma e a energia que atraem os outros'
    ),
    (SELECT id FROM archetype WHERE code = 'magnetic'),
    1.0
),
(
    (
        SELECT o.id
        FROM "option" o
        JOIN question q ON o.question_id = q.id
        WHERE q.position = 1003
        AND o.text_i18n->>'pt' = 'O acolhimento e a empatia'
    ),
    (SELECT id FROM archetype WHERE code = 'affectionate'),
    1.0
);

----------------------------------------------------------------
-- Question 1004
----------------------------------------------------------------
INSERT INTO question (position, text_i18n, is_tiebreaker, tiebreaker_pair_id)
VALUES (
   1004,
   '{"pt": "Num grupo de amigos, você tende a ser..."}'::jsonb,
   TRUE,
   (
        SELECT id
        FROM tiebreaker_pair
        WHERE archetype_a_id = LEAST(
            (SELECT id FROM archetype WHERE code = 'magnetic'),
            (SELECT id FROM archetype WHERE code = 'affectionate')
        )
        AND archetype_b_id = GREATEST(
            (SELECT id FROM archetype WHERE code = 'magnetic'),
            (SELECT id FROM archetype WHERE code = 'affectionate')
        )
   )
);

INSERT INTO "option" (question_id, text_i18n) VALUES
(
  (SELECT id FROM question WHERE position = 1004),
  '{"pt": "Quem anima e conecta todo mundo"}'::jsonb
),
(
  (SELECT id FROM question WHERE position = 1004),
  '{"pt": "Quem cuida, escuta e acolhe"}'::jsonb
);

INSERT INTO option_weight (option_id, archetype_id, "weight") VALUES
    (
      (
          SELECT o.id
          FROM "option" o
                   JOIN question q ON o.question_id = q.id
          WHERE q.position = 1004
            AND o.text_i18n->>'pt' = 'Quem anima e conecta todo mundo'
    ),
    (SELECT id FROM archetype WHERE code = 'magnetic'),
    1.0
    ),
(
    (
        SELECT o.id
        FROM "option" o
        JOIN question q ON o.question_id = q.id
        WHERE q.position = 1004
        AND o.text_i18n->>'pt' = 'Quem cuida, escuta e acolhe'
    ),
    (SELECT id FROM archetype WHERE code = 'affectionate'),
    1.0
);

-- (magnetic, determined) -> question 1005,1006
INSERT INTO tiebreaker_pair (archetype_a_id, archetype_b_id)
SELECT
    LEAST(a.id, b.id),
    GREATEST(a.id, b.id)
FROM
    (SELECT id FROM archetype WHERE code = 'magnetic') a,
    (SELECT id FROM archetype WHERE code = 'determined') b
ON CONFLICT (archetype_a_id, archetype_b_id) DO NOTHING;

----------------------------------------------------------------
-- Question 1005
----------------------------------------------------------------
INSERT INTO question (position, text_i18n, is_tiebreaker, tiebreaker_pair_id)
VALUES (
   1005,
   '{"pt": "O que é mais importante para você em um relacionamento?"}'::jsonb,
   TRUE,
   (
        SELECT id
        FROM tiebreaker_pair
        WHERE archetype_a_id = LEAST(
            (SELECT id FROM archetype WHERE code = 'magnetic'),
            (SELECT id FROM archetype WHERE code = 'determined')
        )
        AND archetype_b_id = GREATEST(
            (SELECT id FROM archetype WHERE code = 'magnetic'),
            (SELECT id FROM archetype WHERE code = 'determined')
        )
   )
);

INSERT INTO "option" (question_id, text_i18n) VALUES
(
  (SELECT id FROM question WHERE position = 1005),
  '{"pt": "Ter energia, diversão e conexão vibrante"}'::jsonb
),
(
  (SELECT id FROM question WHERE position = 1005),
  '{"pt": "Ter estabilidade e construir objetivos juntos"}'::jsonb
);

INSERT INTO option_weight (option_id, archetype_id, "weight") VALUES
(
    (
        SELECT o.id
        FROM "option" o
        JOIN question q ON o.question_id = q.id
        WHERE q.position = 1005
        AND o.text_i18n->>'pt' = 'Ter energia, diversão e conexão vibrante'
    ),
    (SELECT id FROM archetype WHERE code = 'magnetic'),
    1.0
),
(
    (
        SELECT o.id
        FROM "option" o
        JOIN question q ON o.question_id = q.id
        WHERE q.position = 1005
        AND o.text_i18n->>'pt' = 'Ter estabilidade e construir objetivos juntos'
    ),
    (SELECT id FROM archetype WHERE code = 'determined'),
    1.0
);

----------------------------------------------------------------
-- Question 1006
----------------------------------------------------------------
INSERT INTO question (position, text_i18n, is_tiebreaker, tiebreaker_pair_id)
VALUES (
   1006,
   '{"pt": "No dia-a-dia, você é mais..."}'::jsonb,
   TRUE,
   (
        SELECT id
        FROM tiebreaker_pair
        WHERE archetype_a_id = LEAST(
            (SELECT id FROM archetype WHERE code = 'magnetic'),
            (SELECT id FROM archetype WHERE code = 'determined')
        )
        AND archetype_b_id = GREATEST(
            (SELECT id FROM archetype WHERE code = 'magnetic'),
            (SELECT id FROM archetype WHERE code = 'determined')
        )
   )
);

INSERT INTO "option" (question_id, text_i18n) VALUES
(
  (SELECT id FROM question WHERE position = 1006),
  '{"pt": "Comunicativo e envolvente"}'::jsonb
),
(
  (SELECT id FROM question WHERE position = 1006),
  '{"pt": "Organizado e focado em metas"}'::jsonb
);

INSERT INTO option_weight (option_id, archetype_id, "weight") VALUES
(
    (
        SELECT o.id
        FROM "option" o
        JOIN question q ON o.question_id = q.id
        WHERE q.position = 1006
        AND o.text_i18n->>'pt' = 'Comunicativo e envolvente'
    ),
    (SELECT id FROM archetype WHERE code = 'magnetic'),
    1.0
),
(
    (
        SELECT o.id
        FROM "option" o
        JOIN question q ON o.question_id = q.id
        WHERE q.position = 1006
        AND o.text_i18n->>'pt' = 'Organizado e focado em metas'
    ),
    (SELECT id FROM archetype WHERE code = 'determined'),
    1.0
);

-- (magnetic, free) -> 1007,1008
INSERT INTO tiebreaker_pair (archetype_a_id, archetype_b_id)
SELECT LEAST(a.id, b.id), GREATEST(a.id, b.id)
FROM (SELECT id FROM archetype WHERE code='magnetic') a, (SELECT id FROM archetype WHERE code='free') b
    ON CONFLICT (archetype_a_id, archetype_b_id) DO NOTHING;

INSERT INTO question (position, text_i18n, is_tiebreaker, tiebreaker_pair_id)
VALUES (
           1007,
           '{"pt":"O que mais combina com você..."}'::jsonb,
           TRUE,
           (SELECT id FROM tiebreaker_pair
            WHERE archetype_a_id = LEAST((SELECT id FROM archetype WHERE code='magnetic'),
                                         (SELECT id FROM archetype WHERE code='free'))
              AND archetype_b_id = GREATEST((SELECT id FROM archetype WHERE code='magnetic'),
                                            (SELECT id FROM archetype WHERE code='free'))
           )
       );
INSERT INTO "option" (question_id, text_i18n)
VALUES
    ((SELECT id FROM question WHERE position=1007), '{"pt":"Estar rodeado de pessoas e transmitir energia"}'::jsonb),
    ((SELECT id FROM question WHERE position=1007), '{"pt":"Explorar o mundo, viajar, conhecer o novo"}'::jsonb);

INSERT INTO option_weight (option_id, archetype_id, "weight")
VALUES (
           (SELECT o.id FROM "option" o JOIN question q ON o.question_id=q.id WHERE q.position=1007 AND o.text_i18n->>'pt' = 'Estar rodeado de pessoas e transmitir energia'),
       (SELECT id FROM archetype WHERE code='magnetic'),
    1.0
    ), (
 (SELECT o.id FROM "option" o JOIN question q ON o.question_id=q.id WHERE q.position=1007 AND o.text_i18n->>'pt' = 'Explorar o mundo, viajar, conhecer o novo'),
 (SELECT id FROM archetype WHERE code='free'),
 1.0
);

INSERT INTO question (position, text_i18n, is_tiebreaker, tiebreaker_pair_id)
VALUES (
           1008,
           '{"pt":"Qual te define melhor?"}'::jsonb,
           TRUE,
           (SELECT id FROM tiebreaker_pair
            WHERE archetype_a_id = LEAST((SELECT id FROM archetype WHERE code='magnetic'),
                                         (SELECT id FROM archetype WHERE code='free'))
              AND archetype_b_id = GREATEST((SELECT id FROM archetype WHERE code='magnetic'),
                                            (SELECT id FROM archetype WHERE code='free'))
           )
       );
INSERT INTO "option" (question_id, text_i18n)
VALUES
    ((SELECT id FROM question WHERE position=1008), '{"pt":"Carisma e conexão social"}'::jsonb),
    ((SELECT id FROM question WHERE position=1008), '{"pt":"Aventura e independência"}'::jsonb);

INSERT INTO option_weight (option_id, archetype_id, "weight")
VALUES (
           (SELECT o.id FROM "option" o JOIN question q ON o.question_id=q.id WHERE q.position=1008 AND o.text_i18n->>'pt' = 'Carisma e conexão social'),
       (SELECT id FROM archetype WHERE code='magnetic'),
    1.0
    ), (
 (SELECT o.id FROM "option" o JOIN question q ON o.question_id=q.id WHERE q.position=1008 AND o.text_i18n->>'pt' = 'Aventura e independência'),
 (SELECT id FROM archetype WHERE code='free'),
 1.0
);

-- (magnetic, fluent) -> 1009,1010
INSERT INTO tiebreaker_pair (archetype_a_id, archetype_b_id)
SELECT
    LEAST(a.id, b.id),
    GREATEST(a.id, b.id)
FROM
    (SELECT id FROM archetype WHERE code = 'magnetic') a,
    (SELECT id FROM archetype WHERE code = 'fluent') b
ON CONFLICT (archetype_a_id, archetype_b_id) DO NOTHING;

INSERT INTO question (position, text_i18n, is_tiebreaker, tiebreaker_pair_id)
VALUES (
           1009,
           '{"pt":"Num grupo, você tende a ser..."}'::jsonb,
           TRUE,
           (SELECT id FROM tiebreaker_pair
            WHERE archetype_a_id = LEAST((SELECT id FROM archetype WHERE code='magnetic'),
                                         (SELECT id FROM archetype WHERE code='fluent'))
              AND archetype_b_id = GREATEST((SELECT id FROM archetype WHERE code='magnetic'),
                                            (SELECT id FROM archetype WHERE code='fluent'))
           )
       );
INSERT INTO "option" (question_id, text_i18n)
VALUES
    ((SELECT id FROM question WHERE position=1009), '{"pt":"Quem puxa a energia e contagia os outros"}'::jsonb),
    ((SELECT id FROM question WHERE position=1009), '{"pt":"Quem transmite calma e suaviza o ambiente"}'::jsonb);

INSERT INTO option_weight (option_id, archetype_id, "weight")
VALUES (
           (SELECT o.id FROM "option" o JOIN question q ON o.question_id=q.id WHERE q.position=1009 AND o.text_i18n->>'pt' = 'Quem puxa a energia e contagia os outros'),
       (SELECT id FROM archetype WHERE code='magnetic'),
    1.0
    ), (
 (SELECT o.id FROM "option" o JOIN question q ON o.question_id=q.id WHERE q.position=1009 AND o.text_i18n->>'pt' = 'Quem transmite calma e suaviza o ambiente'),
 (SELECT id FROM archetype WHERE code='fluent'),
 1.0
);

INSERT INTO question (position, text_i18n, is_tiebreaker, tiebreaker_pair_id)
VALUES (
           1010,
           '{"pt":"Qual frase te representa mais?"}'::jsonb,
           TRUE,
           (SELECT id FROM tiebreaker_pair
            WHERE archetype_a_id = LEAST((SELECT id FROM archetype WHERE code='magnetic'),
                                         (SELECT id FROM archetype WHERE code='fluent'))
              AND archetype_b_id = GREATEST((SELECT id FROM archetype WHERE code='magnetic'),
                                            (SELECT id FROM archetype WHERE code='fluent'))
           )
       );
INSERT INTO "option" (question_id, text_i18n)
VALUES
    ((SELECT id FROM question WHERE position=1010), '{"pt":"Adoro quando minha energia atrai pessoas"}'::jsonb),
    ((SELECT id FROM question WHERE position=1010), '{"pt":"Prefiro que as coisas aconteçam naturalmente"}'::jsonb);

INSERT INTO option_weight (option_id, archetype_id, "weight")
VALUES (
           (SELECT o.id FROM "option" o JOIN question q ON o.question_id=q.id WHERE q.position=1010 AND o.text_i18n->>'pt' = 'Adoro quando minha energia atrai pessoas'),
       (SELECT id FROM archetype WHERE code='magnetic'),
    1.0
    ), (
 (SELECT o.id FROM "option" o JOIN question q ON o.question_id=q.id WHERE q.position=1010 AND o.text_i18n->>'pt' = 'Prefiro que as coisas aconteçam naturalmente'),
 (SELECT id FROM archetype WHERE code='fluent'),
 1.0
);

-- (intense, affectionate) -> 1011,1012
INSERT INTO tiebreaker_pair (archetype_a_id, archetype_b_id)
SELECT
    LEAST(a.id, b.id),
    GREATEST(a.id, b.id)
FROM
    (SELECT id FROM archetype WHERE code = 'intense') a,
    (SELECT id FROM archetype WHERE code = 'affectionate') b
ON CONFLICT (archetype_a_id, archetype_b_id) DO NOTHING;

INSERT INTO question (position, text_i18n, is_tiebreaker, tiebreaker_pair_id)
VALUES (
           1011,
           '{"pt":"Quando ama, você prefere..."}'::jsonb,
           TRUE,
           (SELECT id FROM tiebreaker_pair
            WHERE archetype_a_id = LEAST((SELECT id FROM archetype WHERE code='intense'),
                                         (SELECT id FROM archetype WHERE code='affectionate'))
              AND archetype_b_id = GREATEST((SELECT id FROM archetype WHERE code='intense'),
                                            (SELECT id FROM archetype WHERE code='affectionate'))
           )
       );
INSERT INTO "option" (question_id, text_i18n)
VALUES
    ((SELECT id FROM question WHERE position=1011), '{"pt":"Viver tudo com intensidade e paixão ardente"}'::jsonb),
    ((SELECT id FROM question WHERE position=1011), '{"pt":"Demonstrar carinho em pequenos gestos diários"}'::jsonb);

INSERT INTO option_weight (option_id, archetype_id, "weight")
VALUES (
           (SELECT o.id FROM "option" o JOIN question q ON o.question_id=q.id WHERE q.position=1011 AND o.text_i18n->>'pt' = 'Viver tudo com intensidade e paixão ardente'),
       (SELECT id FROM archetype WHERE code='intense'),
    1.0
    ), (
 (SELECT o.id FROM "option" o JOIN question q ON o.question_id=q.id WHERE q.position=1011 AND o.text_i18n->>'pt' = 'Demonstrar carinho em pequenos gestos diários'),
 (SELECT id FROM archetype WHERE code='affectionate'),
 1.0
);

INSERT INTO question (position, text_i18n, is_tiebreaker, tiebreaker_pair_id)
VALUES (
           1012,
           '{"pt":"O que te descreve melhor?"}'::jsonb,
           TRUE,
           (SELECT id FROM tiebreaker_pair
            WHERE archetype_a_id = LEAST((SELECT id FROM archetype WHERE code='intense'),
                                         (SELECT id FROM archetype WHERE code='affectionate'))
              AND archetype_b_id = GREATEST((SELECT id FROM archetype WHERE code='intense'),
                                            (SELECT id FROM archetype WHERE code='affectionate'))
           )
       );
INSERT INTO "option" (question_id, text_i18n)
VALUES
    ((SELECT id FROM question WHERE position=1012), '{"pt":"Sou intenso e emocional"}'::jsonb),
    ((SELECT id FROM question WHERE position=1012), '{"pt":"Sou acolhedor e cuidadoso"}'::jsonb);

INSERT INTO option_weight (option_id, archetype_id, "weight")
VALUES (
           (SELECT o.id FROM "option" o JOIN question q ON o.question_id=q.id WHERE q.position=1012 AND o.text_i18n->>'pt' = 'Sou intenso e emocional'),
       (SELECT id FROM archetype WHERE code='intense'),
    1.0
    ), (
 (SELECT o.id FROM "option" o JOIN question q ON o.question_id=q.id WHERE q.position=1012 AND o.text_i18n->>'pt' = 'Sou acolhedor e cuidadoso'),
 (SELECT id FROM archetype WHERE code='affectionate'),
 1.0
);

-- (intense, determined) -> 1013,1014
INSERT INTO tiebreaker_pair (archetype_a_id, archetype_b_id)
SELECT
    LEAST(a.id, b.id),
    GREATEST(a.id, b.id)
FROM
    (SELECT id FROM archetype WHERE code = 'intense') a,
    (SELECT id FROM archetype WHERE code = 'determined') b
ON CONFLICT (archetype_a_id, archetype_b_id) DO NOTHING;

INSERT INTO question (position, text_i18n, is_tiebreaker, tiebreaker_pair_id)
VALUES (
           1013,
           '{"pt":"O que te move mais num relacionamento?"}'::jsonb,
           TRUE,
           (SELECT id FROM tiebreaker_pair
            WHERE archetype_a_id = LEAST((SELECT id FROM archetype WHERE code='intense'),
                                         (SELECT id FROM archetype WHERE code='determined'))
              AND archetype_b_id = GREATEST((SELECT id FROM archetype WHERE code='intense'),
                                            (SELECT id FROM archetype WHERE code='determined'))
           )
       );
INSERT INTO "option" (question_id, text_i18n)
VALUES
    ((SELECT id FROM question WHERE position=1013), '{"pt":"A paixão e a entrega emocional"}'::jsonb),
    ((SELECT id FROM question WHERE position=1013), '{"pt":"A construção sólida e o crescimento conjunto"}'::jsonb);

INSERT INTO option_weight (option_id, archetype_id, "weight")
VALUES (
           (SELECT o.id FROM "option" o JOIN question q ON o.question_id=q.id WHERE q.position=1013 AND o.text_i18n->>'pt' = 'A paixão e a entrega emocional'),
       (SELECT id FROM archetype WHERE code='intense'),
    1.0
    ), (
 (SELECT o.id FROM "option" o JOIN question q ON o.question_id=q.id WHERE q.position=1013 AND o.text_i18n->>'pt' = 'A construção sólida e o crescimento conjunto'),
 (SELECT id FROM archetype WHERE code='determined'),
 1.0
);

INSERT INTO question (position, text_i18n, is_tiebreaker, tiebreaker_pair_id)
VALUES (
           1014,
           '{"pt":"Num conflito, você tende a..."}'::jsonb,
           TRUE,
           (SELECT id FROM tiebreaker_pair
            WHERE archetype_a_id = LEAST((SELECT id FROM archetype WHERE code='intense'),
                                         (SELECT id FROM archetype WHERE code='determined'))
              AND archetype_b_id = GREATEST((SELECT id FROM archetype WHERE code='intense'),
                                            (SELECT id FROM archetype WHERE code='determined'))
           )
       );
INSERT INTO "option" (question_id, text_i18n)
VALUES
    ((SELECT id FROM question WHERE position=1014), '{"pt":"Explodir e demonstrar emoção imediatamente"}'::jsonb),
    ((SELECT id FROM question WHERE position=1014), '{"pt":"Manter o foco no que é justo e racional"}'::jsonb);

INSERT INTO option_weight (option_id, archetype_id, "weight")
VALUES (
           (SELECT o.id FROM "option" o JOIN question q ON o.question_id=q.id WHERE q.position=1014 AND o.text_i18n->>'pt' = 'Explodir e demonstrar emoção imediatamente'),
       (SELECT id FROM archetype WHERE code='intense'),
    1.0
    ), (
 (SELECT o.id FROM "option" o JOIN question q ON o.question_id=q.id WHERE q.position=1014 AND o.text_i18n->>'pt' = 'Manter o foco no que é justo e racional'),
 (SELECT id FROM archetype WHERE code='determined'),
 1.0
);

-- (intense, free) -> 1015,1016
INSERT INTO tiebreaker_pair (archetype_a_id, archetype_b_id)
SELECT
    LEAST(a.id, b.id),
    GREATEST(a.id, b.id)
FROM
    (SELECT id FROM archetype WHERE code = 'intense') a,
    (SELECT id FROM archetype WHERE code = 'free') b
ON CONFLICT (archetype_a_id, archetype_b_id) DO NOTHING;

INSERT INTO question (position, text_i18n, is_tiebreaker, tiebreaker_pair_id)
VALUES (
           1015,
           '{"pt":"Num relacionamento, você busca mais..."}'::jsonb,
           TRUE,
           (SELECT id FROM tiebreaker_pair
            WHERE archetype_a_id = LEAST((SELECT id FROM archetype WHERE code='intense'),
                                         (SELECT id FROM archetype WHERE code='free'))
              AND archetype_b_id = GREATEST((SELECT id FROM archetype WHERE code='intense'),
                                            (SELECT id FROM archetype WHERE code='free'))
           )
       );
INSERT INTO "option" (question_id, text_i18n)
VALUES
    ((SELECT id FROM question WHERE position=1015), '{"pt":"Viver sentimentos fortes e profundos"}'::jsonb),
    ((SELECT id FROM question WHERE position=1015), '{"pt":"Sentir-se livre e independente"}'::jsonb);

INSERT INTO option_weight (option_id, archetype_id, "weight")
VALUES (
           (SELECT o.id FROM "option" o JOIN question q ON o.question_id=q.id WHERE q.position=1015 AND o.text_i18n->>'pt' = 'Viver sentimentos fortes e profundos'),
       (SELECT id FROM archetype WHERE code='intense'),
    1.0
    ), (
 (SELECT o.id FROM "option" o JOIN question q ON o.question_id=q.id WHERE q.position=1015 AND o.text_i18n->>'pt' = 'Sentir-se livre e independente'),
 (SELECT id FROM archetype WHERE code='free'),
 1.0
);

INSERT INTO question (position, text_i18n, is_tiebreaker, tiebreaker_pair_id)
VALUES (
           1016,
           '{"pt":"O que te move mais?"}'::jsonb,
           TRUE,
           (SELECT id FROM tiebreaker_pair
            WHERE archetype_a_id = LEAST((SELECT id FROM archetype WHERE code='intense'),
                                         (SELECT id FROM archetype WHERE code='free'))
              AND archetype_b_id = GREATEST((SELECT id FROM archetype WHERE code='intense'),
                                            (SELECT id FROM archetype WHERE code='free'))
           )
       );
INSERT INTO "option" (question_id, text_i18n)
VALUES
    ((SELECT id FROM question WHERE position=1016), '{"pt":"Paixão e entrega emocional"}'::jsonb),
    ((SELECT id FROM question WHERE position=1016), '{"pt":"Descoberta e autonomia"}'::jsonb);

INSERT INTO option_weight (option_id, archetype_id, "weight")
VALUES (
           (SELECT o.id FROM "option" o JOIN question q ON o.question_id=q.id WHERE q.position=1016 AND o.text_i18n->>'pt' = 'Paixão e entrega emocional'),
       (SELECT id FROM archetype WHERE code='intense'),
    1.0
    ), (
 (SELECT o.id FROM "option" o JOIN question q ON o.question_id=q.id WHERE q.position=1016 AND o.text_i18n->>'pt' = 'Descoberta e autonomia'),
 (SELECT id FROM archetype WHERE code='free'),
 1.0
);

-- (intense, fluent) -> 1017,1018
INSERT INTO tiebreaker_pair (archetype_a_id, archetype_b_id)
SELECT
    LEAST(a.id, b.id),
    GREATEST(a.id, b.id)
FROM
    (SELECT id FROM archetype WHERE code = 'intense') a,
    (SELECT id FROM archetype WHERE code = 'fluent') b
ON CONFLICT (archetype_a_id, archetype_b_id) DO NOTHING;

INSERT INTO question (position, text_i18n, is_tiebreaker, tiebreaker_pair_id)
VALUES (
           1017,
           '{"pt":"Como prefere que seja o amor?"}'::jsonb,
           TRUE,
           (SELECT id FROM tiebreaker_pair
            WHERE archetype_a_id = LEAST((SELECT id FROM archetype WHERE code='intense'),
                                         (SELECT id FROM archetype WHERE code='fluent'))
              AND archetype_b_id = GREATEST((SELECT id FROM archetype WHERE code='intense'),
                                            (SELECT id FROM archetype WHERE code='fluent'))
           )
       );
INSERT INTO "option" (question_id, text_i18n)
VALUES
    ((SELECT id FROM question WHERE position=1017), '{"pt":"Quente, cheio de emoção"}'::jsonb),
    ((SELECT id FROM question WHERE position=1017), '{"pt":"Leve, fluindo naturalmente"}'::jsonb);

INSERT INTO option_weight (option_id, archetype_id, "weight")
VALUES (
           (SELECT o.id FROM "option" o JOIN question q ON o.question_id=q.id WHERE q.position=1017 AND o.text_i18n->>'pt' = 'Quente, cheio de emoção'),
       (SELECT id FROM archetype WHERE code='intense'),
    1.0
    ), (
 (SELECT o.id FROM "option" o JOIN question q ON o.question_id=q.id WHERE q.position=1017 AND o.text_i18n->>'pt' = 'Leve, fluindo naturalmente'),
 (SELECT id FROM archetype WHERE code='fluent'),
 1.0
);

INSERT INTO question (position, text_i18n, is_tiebreaker, tiebreaker_pair_id)
VALUES (
           1018,
           '{"pt":"O que melhor reflete o seu jeito de amar?"}'::jsonb,
           TRUE,
           (SELECT id FROM tiebreaker_pair
            WHERE archetype_a_id = LEAST((SELECT id FROM archetype WHERE code='intense'),
                                         (SELECT id FROM archetype WHERE code='fluent'))
              AND archetype_b_id = GREATEST((SELECT id FROM archetype WHERE code='intense'),
                                            (SELECT id FROM archetype WHERE code='fluent'))
           )
       );
INSERT INTO "option" (question_id, text_i18n)
VALUES
    ((SELECT id FROM question WHERE position=1018), '{"pt":"Intensidade e paixão"}'::jsonb),
    ((SELECT id FROM question WHERE position=1018), '{"pt":"Calma e adaptação"}'::jsonb);

INSERT INTO option_weight (option_id, archetype_id, "weight")
VALUES (
           (SELECT o.id FROM "option" o JOIN question q ON o.question_id=q.id WHERE q.position=1018 AND o.text_i18n->>'pt' = 'Intensidade e paixão'),
       (SELECT id FROM archetype WHERE code='intense'),
    1.0
    ), (
 (SELECT o.id FROM "option" o JOIN question q ON o.question_id=q.id WHERE q.position=1018 AND o.text_i18n->>'pt' = 'Calma e adaptação'),
 (SELECT id FROM archetype WHERE code='fluent'),
 1.0
);

-- (affectionate, determined) -> 1019,1020
INSERT INTO tiebreaker_pair (archetype_a_id, archetype_b_id)
SELECT
    LEAST(a.id, b.id),
    GREATEST(a.id, b.id)
FROM
    (SELECT id FROM archetype WHERE code = 'affectionate') a,
    (SELECT id FROM archetype WHERE code = 'determined') b
ON CONFLICT (archetype_a_id, archetype_b_id) DO NOTHING;

INSERT INTO question (position, text_i18n, is_tiebreaker, tiebreaker_pair_id)
VALUES (
           1019,
           '{"pt":"Em um relacionamento, você prefere..."}'::jsonb,
           TRUE,
           (SELECT id FROM tiebreaker_pair
            WHERE archetype_a_id = LEAST((SELECT id FROM archetype WHERE code='affectionate'),
                                         (SELECT id FROM archetype WHERE code='determined'))
              AND archetype_b_id = GREATEST((SELECT id FROM archetype WHERE code='affectionate'),
                                            (SELECT id FROM archetype WHERE code='determined'))
           )
       );
INSERT INTO "option" (question_id, text_i18n)
VALUES
    ((SELECT id FROM question WHERE position=1019), '{"pt":"Pequenos gestos de carinho no dia a dia"}'::jsonb),
    ((SELECT id FROM question WHERE position=1019), '{"pt":"Ter clareza de planos e objetivos juntos"}'::jsonb);

INSERT INTO option_weight (option_id, archetype_id, "weight")
VALUES (
           (SELECT o.id FROM "option" o JOIN question q ON o.question_id=q.id WHERE q.position=1019 AND o.text_i18n->>'pt' = 'Pequenos gestos de carinho no dia a dia'),
       (SELECT id FROM archetype WHERE code='affectionate'),
    1.0
    ), (
 (SELECT o.id FROM "option" o JOIN question q ON o.question_id=q.id WHERE q.position=1019 AND o.text_i18n->>'pt' = 'Ter clareza de planos e objetivos juntos'),
 (SELECT id FROM archetype WHERE code='determined'),
 1.0
);

INSERT INTO question (position, text_i18n, is_tiebreaker, tiebreaker_pair_id)
VALUES (
           1020,
           '{"pt":"Se tivesse que escolher, você valoriza mais..."}'::jsonb,
           TRUE,
           (SELECT id FROM tiebreaker_pair
            WHERE archetype_a_id = LEAST((SELECT id FROM archetype WHERE code='affectionate'),
                                         (SELECT id FROM archetype WHERE code='determined'))
              AND archetype_b_id = GREATEST((SELECT id FROM archetype WHERE code='affectionate'),
                                            (SELECT id FROM archetype WHERE code='determined'))
           )
       );
INSERT INTO "option" (question_id, text_i18n)
VALUES
    ((SELECT id FROM question WHERE position=1020), '{"pt":"O aconchego e a atenção aos detalhes"}'::jsonb),
    ((SELECT id FROM question WHERE position=1020), '{"pt":"A estabilidade e a segurança do futuro"}'::jsonb);

INSERT INTO option_weight (option_id, archetype_id, "weight")
VALUES (
           (SELECT o.id FROM "option" o JOIN question q ON o.question_id=q.id WHERE q.position=1020 AND o.text_i18n->>'pt' = 'O aconchego e a atenção aos detalhes'),
       (SELECT id FROM archetype WHERE code='affectionate'),
    1.0
    ), (
 (SELECT o.id FROM "option" o JOIN question q ON o.question_id=q.id WHERE q.position=1020 AND o.text_i18n->>'pt' = 'A estabilidade e a segurança do futuro'),
 (SELECT id FROM archetype WHERE code='determined'),
 1.0
);

-- (affectionate, free) -> 1021,1022
INSERT INTO tiebreaker_pair (archetype_a_id, archetype_b_id)
SELECT
    LEAST(a.id, b.id),
    GREATEST(a.id, b.id)
FROM
    (SELECT id FROM archetype WHERE code = 'affectionate') a,
    (SELECT id FROM archetype WHERE code = 'free') b
ON CONFLICT (archetype_a_id, archetype_b_id) DO NOTHING;

INSERT INTO question (position, text_i18n, is_tiebreaker, tiebreaker_pair_id)
VALUES (
           1021,
           '{"pt":"Em um relacionamento, você se vê mais como..."}'::jsonb,
           TRUE,
           (SELECT id FROM tiebreaker_pair
            WHERE archetype_a_id = LEAST((SELECT id FROM archetype WHERE code='affectionate'),
                                         (SELECT id FROM archetype WHERE code='free'))
              AND archetype_b_id = GREATEST((SELECT id FROM archetype WHERE code='affectionate'),
                                            (SELECT id FROM archetype WHERE code='free'))
           )
       );
INSERT INTO "option" (question_id, text_i18n)
VALUES
    ((SELECT id FROM question WHERE position=1021), '{"pt":"Alguém que valoriza estar perto, cuidando da pessoa"}'::jsonb),
    ((SELECT id FROM question WHERE position=1021), '{"pt":"Alguém que valoriza espaço e independência"}'::jsonb);

INSERT INTO option_weight (option_id, archetype_id, "weight")
VALUES (
           (SELECT o.id FROM "option" o JOIN question q ON o.question_id=q.id WHERE q.position=1021 AND o.text_i18n->>'pt' = 'Alguém que valoriza estar perto, cuidando da pessoa'),
       (SELECT id FROM archetype WHERE code='affectionate'),
    1.0
    ), (
 (SELECT o.id FROM "option" o JOIN question q ON o.question_id=q.id WHERE q.position=1021 AND o.text_i18n->>'pt' = 'Alguém que valoriza espaço e independência'),
 (SELECT id FROM archetype WHERE code='free'),
 1.0
);

INSERT INTO question (position, text_i18n, is_tiebreaker, tiebreaker_pair_id)
VALUES (
           1022,
           '{"pt":"O que mais importa no dia-a-dia..."}'::jsonb,
           TRUE,
           (SELECT id FROM tiebreaker_pair
            WHERE archetype_a_id = LEAST((SELECT id FROM archetype WHERE code='affectionate'),
                                         (SELECT id FROM archetype WHERE code='free'))
              AND archetype_b_id = GREATEST((SELECT id FROM archetype WHERE code='affectionate'),
                                            (SELECT id FROM archetype WHERE code='free'))
           )
       );
INSERT INTO "option" (question_id, text_i18n)
VALUES
    ((SELECT id FROM question WHERE position=1022), '{"pt":"Estar presente e compartilhar momentos íntimos"}'::jsonb),
    ((SELECT id FROM question WHERE position=1022), '{"pt":"Ter liberdade para explorar e experimentar"}'::jsonb);

INSERT INTO option_weight (option_id, archetype_id, "weight")
VALUES (
           (SELECT o.id FROM "option" o JOIN question q ON o.question_id=q.id WHERE q.position=1022 AND o.text_i18n->>'pt' = 'Estar presente e compartilhar momentos íntimos'),
       (SELECT id FROM archetype WHERE code='affectionate'),
    1.0
    ), (
 (SELECT o.id FROM "option" o JOIN question q ON o.question_id=q.id WHERE q.position=1022 AND o.text_i18n->>'pt' = 'Ter liberdade para explorar e experimentar'),
 (SELECT id FROM archetype WHERE code='free'),
 1.0
);

-- (affectionate, fluent) -> 1023,1024
INSERT INTO tiebreaker_pair (archetype_a_id, archetype_b_id)
SELECT
    LEAST(a.id, b.id),
    GREATEST(a.id, b.id)
FROM
    (SELECT id FROM archetype WHERE code = 'affectionate') a,
    (SELECT id FROM archetype WHERE code = 'fluent') b
ON CONFLICT (archetype_a_id, archetype_b_id) DO NOTHING;

INSERT INTO question (position, text_i18n, is_tiebreaker, tiebreaker_pair_id)
VALUES (
           1023,
           '{"pt":"Qual cenário te atrai mais?"}'::jsonb,
           TRUE,
           (SELECT id FROM tiebreaker_pair
            WHERE archetype_a_id = LEAST((SELECT id FROM archetype WHERE code='affectionate'),
                                         (SELECT id FROM archetype WHERE code='fluent'))
              AND archetype_b_id = GREATEST((SELECT id FROM archetype WHERE code='affectionate'),
                                            (SELECT id FROM archetype WHERE code='fluent'))
           )
       );
INSERT INTO "option" (question_id, text_i18n)
VALUES
    ((SELECT id FROM question WHERE position=1023), '{"pt":"Estar perto de quem ama, trocando afeto"}'::jsonb),
    ((SELECT id FROM question WHERE position=1023), '{"pt":"Viver relações leves, sem pressões"}'::jsonb);

INSERT INTO option_weight (option_id, archetype_id, "weight")
VALUES (
           (SELECT o.id FROM "option" o JOIN question q ON o.question_id=q.id WHERE q.position=1023 AND o.text_i18n->>'pt' = 'Estar perto de quem ama, trocando afeto'),
       (SELECT id FROM archetype WHERE code='affectionate'),
    1.0
    ), (
 (SELECT o.id FROM "option" o JOIN question q ON o.question_id=q.id WHERE q.position=1023 AND o.text_i18n->>'pt' = 'Viver relações leves, sem pressões'),
 (SELECT id FROM archetype WHERE code='fluent'),
 1.0
);

INSERT INTO question (position, text_i18n, is_tiebreaker, tiebreaker_pair_id)
VALUES (
           1024,
           '{"pt":"Como lida com as emoções dentro do relacionamento?"}'::jsonb,
           TRUE,
           (SELECT id FROM tiebreaker_pair
            WHERE archetype_a_id = LEAST((SELECT id FROM archetype WHERE code='affectionate'),
                                         (SELECT id FROM archetype WHERE code='fluent'))
              AND archetype_b_id = GREATEST((SELECT id FROM archetype WHERE code='affectionate'),
                                            (SELECT id FROM archetype WHERE code='fluent'))
           )
       );
INSERT INTO "option" (question_id, text_i18n)
VALUES
    ((SELECT id FROM question WHERE position=1024), '{"pt":"Demonstro cuidado e apoio direto"}'::jsonb),
    ((SELECT id FROM question WHERE position=1024), '{"pt":"Deixo as coisas fluírem naturalmente"}'::jsonb);

INSERT INTO option_weight (option_id, archetype_id, "weight")
VALUES (
           (SELECT o.id FROM "option" o JOIN question q ON o.question_id=q.id WHERE q.position=1024 AND o.text_i18n->>'pt' = 'Demonstro cuidado e apoio direto'),
       (SELECT id FROM archetype WHERE code='affectionate'),
    1.0
    ), (
 (SELECT o.id FROM "option" o JOIN question q ON o.question_id=q.id WHERE q.position=1024 AND o.text_i18n->>'pt' = 'Deixo as coisas fluírem naturalmente'),
 (SELECT id FROM archetype WHERE code='fluent'),
 1.0
);

-- (determined, free) -> 1025,1026
INSERT INTO tiebreaker_pair (archetype_a_id, archetype_b_id)
SELECT
    LEAST(a.id, b.id),
    GREATEST(a.id, b.id)
FROM
    (SELECT id FROM archetype WHERE code = 'determined') a,
    (SELECT id FROM archetype WHERE code = 'free') b
ON CONFLICT (archetype_a_id, archetype_b_id) DO NOTHING;

INSERT INTO question (position, text_i18n, is_tiebreaker, tiebreaker_pair_id)
VALUES (
           1025,
           '{"pt":"O que te dá mais segurança em um relacionamento?"}'::jsonb,
           TRUE,
           (SELECT id FROM tiebreaker_pair
            WHERE archetype_a_id = LEAST((SELECT id FROM archetype WHERE code='determined'),
                                         (SELECT id FROM archetype WHERE code='free'))
              AND archetype_b_id = GREATEST((SELECT id FROM archetype WHERE code='determined'),
                                            (SELECT id FROM archetype WHERE code='free'))
           )
       );
INSERT INTO "option" (question_id, text_i18n)
VALUES
    ((SELECT id FROM question WHERE position=1025), '{"pt":"Saber que existe estabilidade e futuro juntos"}'::jsonb),
    ((SELECT id FROM question WHERE position=1025), '{"pt":"Ter liberdade e espaço para ser você mesmo"}'::jsonb);

INSERT INTO option_weight (option_id, archetype_id, "weight")
VALUES (
           (SELECT o.id FROM "option" o JOIN question q ON o.question_id=q.id WHERE q.position=1025 AND o.text_i18n->>'pt' = 'Saber que existe estabilidade e futuro juntos'),
       (SELECT id FROM archetype WHERE code='determined'),
    1.0
    ), (
 (SELECT o.id FROM "option" o JOIN question q ON o.question_id=q.id WHERE q.position=1025 AND o.text_i18n->>'pt' = 'Ter liberdade e espaço para ser você mesmo'),
 (SELECT id FROM archetype WHERE code='free'),
 1.0
);

INSERT INTO question (position, text_i18n, is_tiebreaker, tiebreaker_pair_id)
VALUES (
           1026,
           '{"pt":"Em um sábado à noite, você prefere..."}'::jsonb,
           TRUE,
           (SELECT id FROM tiebreaker_pair
            WHERE archetype_a_id = LEAST((SELECT id FROM archetype WHERE code='determined'),
                                         (SELECT id FROM archetype WHERE code='free'))
              AND archetype_b_id = GREATEST((SELECT id FROM archetype WHERE code='determined'),
                                            (SELECT id FROM archetype WHERE code='free'))
           )
       );
INSERT INTO "option" (question_id, text_i18n)
VALUES
    ((SELECT id FROM question WHERE position=1026), '{"pt":"Seguir um plano já definido e seguro"}'::jsonb),
    ((SELECT id FROM question WHERE position=1026), '{"pt":"Fazer algo inesperado, fora da rotina"}'::jsonb);

INSERT INTO option_weight (option_id, archetype_id, "weight")
VALUES (
           (SELECT o.id FROM "option" o JOIN question q ON o.question_id=q.id WHERE q.position=1026 AND o.text_i18n->>'pt' = 'Seguir um plano já definido e seguro'),
       (SELECT id FROM archetype WHERE code='determined'),
    1.0
    ), (
 (SELECT o.id FROM "option" o JOIN question q ON o.question_id=q.id WHERE q.position=1026 AND o.text_i18n->>'pt' = 'Fazer algo inesperado, fora da rotina'),
 (SELECT id FROM archetype WHERE code='free'),
 1.0
);

-- (determined, fluent) -> 1027,1028
INSERT INTO tiebreaker_pair (archetype_a_id, archetype_b_id)
SELECT
    LEAST(a.id, b.id),
    GREATEST(a.id, b.id)
FROM
    (SELECT id FROM archetype WHERE code = 'determined') a,
    (SELECT id FROM archetype WHERE code = 'fluent') b
ON CONFLICT (archetype_a_id, archetype_b_id) DO NOTHING;

INSERT INTO question (position, text_i18n, is_tiebreaker, tiebreaker_pair_id)
VALUES (
           1027,
           '{"pt":"Quando pensa no amor, você valoriza mais..."}'::jsonb,
           TRUE,
           (SELECT id FROM tiebreaker_pair
            WHERE archetype_a_id = LEAST((SELECT id FROM archetype WHERE code='determined'),
                                         (SELECT id FROM archetype WHERE code='fluent'))
              AND archetype_b_id = GREATEST((SELECT id FROM archetype WHERE code='determined'),
                                            (SELECT id FROM archetype WHERE code='fluent'))
           )
       );
INSERT INTO "option" (question_id, text_i18n)
VALUES
    ((SELECT id FROM question WHERE position=1027), '{"pt":"Clareza e estabilidade"}'::jsonb),
    ((SELECT id FROM question WHERE position=1027), '{"pt":"Leveza e espontaneidade"}'::jsonb);

INSERT INTO option_weight (option_id, archetype_id, "weight")
VALUES (
           (SELECT o.id FROM "option" o JOIN question q ON o.question_id=q.id WHERE q.position=1027 AND o.text_i18n->>'pt' = 'Clareza e estabilidade'),
       (SELECT id FROM archetype WHERE code='determined'),
    1.0
    ), (
 (SELECT o.id FROM "option" o JOIN question q ON o.question_id=q.id WHERE q.position=1027 AND o.text_i18n->>'pt' = 'Leveza e espontaneidade'),
 (SELECT id FROM archetype WHERE code='fluent'),
 1.0
);

INSERT INTO question (position, text_i18n, is_tiebreaker, tiebreaker_pair_id)
VALUES (
           1028,
           '{"pt":"Num relacionamento, você prefere..."}'::jsonb,
           TRUE,
           (SELECT id FROM tiebreaker_pair
            WHERE archetype_a_id = LEAST((SELECT id FROM archetype WHERE code='determined'),
                                         (SELECT id FROM archetype WHERE code='fluent'))
              AND archetype_b_id = GREATEST((SELECT id FROM archetype WHERE code='determined'),
                                            (SELECT id FROM archetype WHERE code='fluent'))
           )
       );
INSERT INTO "option" (question_id, text_i18n)
VALUES
    ((SELECT id FROM question WHERE position=1028), '{"pt":"Construir algo sólido e duradouro"}'::jsonb),
    ((SELECT id FROM question WHERE position=1028), '{"pt":"Deixar as coisas acontecerem sem pressão"}'::jsonb);

INSERT INTO option_weight (option_id, archetype_id, "weight")
VALUES (
           (SELECT o.id FROM "option" o JOIN question q ON o.question_id=q.id WHERE q.position=1028 AND o.text_i18n->>'pt' = 'Construir algo sólido e duradouro'),
       (SELECT id FROM archetype WHERE code='determined'),
    1.0
    ), (
 (SELECT o.id FROM "option" o JOIN question q ON o.question_id=q.id WHERE q.position=1028 AND o.text_i18n->>'pt' = 'Deixar as coisas acontecerem sem pressão'),
 (SELECT id FROM archetype WHERE code='fluent'),
 1.0
);

-- (free, fluent) -> 1029,1030
INSERT INTO tiebreaker_pair (archetype_a_id, archetype_b_id)
SELECT
    LEAST(a.id, b.id),
    GREATEST(a.id, b.id)
FROM
    (SELECT id FROM archetype WHERE code = 'free') a,
    (SELECT id FROM archetype WHERE code = 'fluent') b
ON CONFLICT (archetype_a_id, archetype_b_id) DO NOTHING;

INSERT INTO question (position, text_i18n, is_tiebreaker, tiebreaker_pair_id)
VALUES (
           1029,
           '{"pt":"Num fim de semana ideal, você prefere..."}'::jsonb,
           TRUE,
           (SELECT id FROM tiebreaker_pair
            WHERE archetype_a_id = LEAST((SELECT id FROM archetype WHERE code='free'),
                                         (SELECT id FROM archetype WHERE code='fluent'))
              AND archetype_b_id = GREATEST((SELECT id FROM archetype WHERE code='free'),
                                            (SELECT id FROM archetype WHERE code='fluent'))
           )
       );
INSERT INTO "option" (question_id, text_i18n)
VALUES
    ((SELECT id FROM question WHERE position=1029), '{"pt":"Explorar algo novo, viajar ou sair da rotina"}'::jsonb),
    ((SELECT id FROM question WHERE position=1029), '{"pt":"Viver um dia leve, sem pressa e sem regras"}'::jsonb);

INSERT INTO option_weight (option_id, archetype_id, "weight")
VALUES (
           (SELECT o.id FROM "option" o JOIN question q ON o.question_id=q.id WHERE q.position=1029 AND o.text_i18n->>'pt' = 'Explorar algo novo, viajar ou sair da rotina'),
       (SELECT id FROM archetype WHERE code='free'),
    1.0
    ), (
 (SELECT o.id FROM "option" o JOIN question q ON o.question_id=q.id WHERE q.position=1029 AND o.text_i18n->>'pt' = 'Viver um dia leve, sem pressa e sem regras'),
 (SELECT id FROM archetype WHERE code='fluent'),
 1.0
);

INSERT INTO question (position, text_i18n, is_tiebreaker, tiebreaker_pair_id)
VALUES (
           1030,
           '{"pt":"Pra você, o amor é mais..."}'::jsonb,
           TRUE,
           (SELECT id FROM tiebreaker_pair
            WHERE archetype_a_id = LEAST((SELECT id FROM archetype WHERE code='free'),
                                         (SELECT id FROM archetype WHERE code='fluent'))
              AND archetype_b_id = GREATEST((SELECT id FROM archetype WHERE code='free'),
                                            (SELECT id FROM archetype WHERE code='fluent'))
           )
       );
INSERT INTO "option" (question_id, text_i18n)
VALUES
    ((SELECT id FROM question WHERE position=1030), '{"pt":"Aventura e descoberta"}'::jsonb),
    ((SELECT id FROM question WHERE position=1030), '{"pt":"Tranquilidade e naturalidade"}'::jsonb);

INSERT INTO option_weight (option_id, archetype_id, "weight")
VALUES (
           (SELECT o.id FROM "option" o JOIN question q ON o.question_id=q.id WHERE q.position=1030 AND o.text_i18n->>'pt' = 'Aventura e descoberta'),
       (SELECT id FROM archetype WHERE code='free'),
    1.0
    ), (
 (SELECT o.id FROM "option" o JOIN question q ON o.question_id=q.id WHERE q.position=1030 AND o.text_i18n->>'pt' = 'Tranquilidade e naturalidade'),
 (SELECT id FROM archetype WHERE code='fluent'),
 1.0
);

