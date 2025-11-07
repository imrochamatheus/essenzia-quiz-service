-- ==============================================
-- Migration: V5__insert_user_info_options.sql
-- Tipo: seed
-- Criada em: 2025-11-06 12:34:50
-- ==============================================

-- Escreva seus comandos SQL abaixo:
----------------------------------------------------------------
-- GENDER
----------------------------------------------------------------
INSERT INTO gender (code, active) VALUES
('male', TRUE),
('female', TRUE),
('non_binary', TRUE),
('prefer_not_to_say', TRUE),
('other', TRUE)
ON CONFLICT (code) DO NOTHING;;

INSERT INTO gender_i18n (gender_id, locale, "name")
SELECT id, 'pt', 'Masculino'
FROM gender WHERE code = 'male'
ON CONFLICT DO NOTHING;

INSERT INTO gender_i18n (gender_id, locale, "name")
SELECT id, 'pt', 'Feminino'
FROM gender WHERE code = 'female'
ON CONFLICT DO NOTHING;

INSERT INTO gender_i18n (gender_id, locale, "name")
SELECT id, 'pt', 'Não binário'
FROM gender WHERE code = 'non_binary'
ON CONFLICT DO NOTHING;

INSERT INTO gender_i18n (gender_id, locale, "name")
SELECT id, 'pt', 'Prefiro não dizer'
FROM gender WHERE code = 'prefer_not_to_say'
ON CONFLICT DO NOTHING;

INSERT INTO gender_i18n (gender_id, locale, "name")
SELECT id, 'pt', 'Outro'
FROM gender WHERE code = 'other'
ON CONFLICT DO NOTHING;

----------------------------------------------------------------
-- PRONOUN
----------------------------------------------------------------
INSERT INTO pronoun (code, active) VALUES
('he_him', TRUE),
('she_her', TRUE),
('they_them', TRUE),
('prefer_not_to_say', TRUE),
('other', TRUE)
ON CONFLICT (code) DO NOTHING;;

INSERT INTO pronoun_i18n (pronoun_id, locale, "name")
SELECT id, 'pt', 'Ele / Dele'
FROM pronoun WHERE code = 'he_him'
ON CONFLICT DO NOTHING;

INSERT INTO pronoun_i18n (pronoun_id, locale, "name")
SELECT id, 'pt', 'Ela / Dela'
FROM pronoun WHERE code = 'she_her'
ON CONFLICT DO NOTHING;

INSERT INTO pronoun_i18n (pronoun_id, locale, "name")
SELECT id, 'pt', 'Elu / Delu'
FROM pronoun WHERE code = 'they_them'
ON CONFLICT DO NOTHING;

INSERT INTO pronoun_i18n (pronoun_id, locale, "name")
SELECT id, 'pt', 'Prefiro não dizer'
FROM pronoun WHERE code = 'prefer_not_to_say'
ON CONFLICT DO NOTHING;

INSERT INTO pronoun_i18n (pronoun_id, locale, "name")
SELECT id, 'pt', 'Outro'
FROM pronoun WHERE code = 'other'
ON CONFLICT DO NOTHING;

----------------------------------------------------------------
-- MARITAL STATUS
----------------------------------------------------------------
INSERT INTO marital_status (code, active) VALUES
('single', TRUE),
('married', TRUE),
('divorced', TRUE),
('widowed', TRUE),
('separated', TRUE),
('prefer_not_to_say', TRUE)
ON CONFLICT (code) DO NOTHING;

INSERT INTO marital_status_i18n (marital_status_id, locale, "name")
SELECT id, 'pt', 'Solteiro(a)' FROM marital_status WHERE code = 'single'
ON CONFLICT DO NOTHING;

INSERT INTO marital_status_i18n (marital_status_id, locale, "name")
SELECT id, 'pt', 'Casado(a)' FROM marital_status WHERE code = 'married'
ON CONFLICT DO NOTHING;

INSERT INTO marital_status_i18n (marital_status_id, locale, "name")
SELECT id, 'pt', 'Divorciado(a)' FROM marital_status WHERE code = 'divorced'
ON CONFLICT DO NOTHING;

INSERT INTO marital_status_i18n (marital_status_id, locale, "name")
SELECT id, 'pt', 'Viúvo(a)' FROM marital_status WHERE code = 'widowed'
ON CONFLICT DO NOTHING;

INSERT INTO marital_status_i18n (marital_status_id, locale, "name")
SELECT id, 'pt', 'Separado(a)' FROM marital_status WHERE code = 'separated'
ON CONFLICT DO NOTHING;

INSERT INTO marital_status_i18n (marital_status_id, locale, "name")
SELECT id, 'pt', 'Prefiro não dizer' FROM marital_status WHERE code = 'prefer_not_to_say'
ON CONFLICT DO NOTHING;

----------------------------------------------------------------
-- RELIGION
----------------------------------------------------------------
INSERT INTO religion (code, active) VALUES
('catholic', TRUE),
('protestant', TRUE),
('evangelical', TRUE),
('jewish', TRUE),
('muslim', TRUE),
('buddhist', TRUE),
('hindu', TRUE),
('spiritualist', TRUE),
('none', TRUE),
('other', TRUE)
ON CONFLICT (code) DO NOTHING;

INSERT INTO religion_i18n (religion_id, locale, "name")
SELECT id, 'pt', 'Católico(a)' FROM religion WHERE code = 'catholic'
ON CONFLICT DO NOTHING;

INSERT INTO religion_i18n (religion_id, locale, "name")
SELECT id, 'pt', 'Protestante' FROM religion WHERE code = 'protestant'
ON CONFLICT DO NOTHING;

INSERT INTO religion_i18n (religion_id, locale, "name")
SELECT id, 'pt', 'Evangélico(a)' FROM religion WHERE code = 'evangelical'
ON CONFLICT DO NOTHING;

INSERT INTO religion_i18n (religion_id, locale, "name")
SELECT id, 'pt', 'Judaico(a)' FROM religion WHERE code = 'jewish'
ON CONFLICT DO NOTHING;

INSERT INTO religion_i18n (religion_id, locale, "name")
SELECT id, 'pt', 'Muçulmano(a)' FROM religion WHERE code = 'muslim'
ON CONFLICT DO NOTHING;

INSERT INTO religion_i18n (religion_id, locale, "name")
SELECT id, 'pt', 'Budista' FROM religion WHERE code = 'buddhist'
ON CONFLICT DO NOTHING;

INSERT INTO religion_i18n (religion_id, locale, "name")
SELECT id, 'pt', 'Hinduísta' FROM religion WHERE code = 'hindu'
ON CONFLICT DO NOTHING;

INSERT INTO religion_i18n (religion_id, locale, "name")
SELECT id, 'pt', 'Espiritualista' FROM religion WHERE code = 'spiritualist'
ON CONFLICT DO NOTHING;

INSERT INTO religion_i18n (religion_id, locale, "name")
SELECT id, 'pt', 'Nenhuma' FROM religion WHERE code = 'none'
ON CONFLICT DO NOTHING;

INSERT INTO religion_i18n (religion_id, locale, "name")
SELECT id, 'pt', 'Outra' FROM religion WHERE code = 'other'
ON CONFLICT DO NOTHING;

----------------------------------------------------------------
-- COMMITMENT LEVEL
----------------------------------------------------------------
INSERT INTO commitment_level (code, active) VALUES
('casual', TRUE),
('serious', TRUE),
('open', TRUE),
('undecided', TRUE),
('prefer_not_to_say', TRUE)
ON CONFLICT (code) DO NOTHING;

INSERT INTO commitment_level_i18n (commitment_level_id, locale, "name")
SELECT id, 'pt', 'Casual' FROM commitment_level WHERE code = 'casual'
ON CONFLICT DO NOTHING;

INSERT INTO commitment_level_i18n (commitment_level_id, locale, "name")
SELECT id, 'pt', 'Sério(a)' FROM commitment_level WHERE code = 'serious'
ON CONFLICT DO NOTHING;

INSERT INTO commitment_level_i18n (commitment_level_id, locale, "name")
SELECT id, 'pt', 'Aberto(a)' FROM commitment_level WHERE code = 'open'
ON CONFLICT DO NOTHING;

INSERT INTO commitment_level_i18n (commitment_level_id, locale, "name")
SELECT id, 'pt', 'Indeciso(a)' FROM commitment_level WHERE code = 'undecided'
ON CONFLICT DO NOTHING;

INSERT INTO commitment_level_i18n (commitment_level_id, locale, "name")
SELECT id, 'pt', 'Prefiro não dizer' FROM commitment_level WHERE code = 'prefer_not_to_say'
ON CONFLICT DO NOTHING;

----------------------------------------------------------------
-- SEXUAL ORIENTATION
----------------------------------------------------------------
INSERT INTO sexual_orientation (code, active) VALUES
('heterosexual', TRUE),
('homosexual', TRUE),
('bisexual', TRUE),
('pansexual', TRUE),
('asexual', TRUE),
('demisexual', TRUE),
('prefer_not_to_say', TRUE),
('other', TRUE)
ON CONFLICT (code) DO NOTHING;

INSERT INTO sexual_orientation_i18n (sexual_orientation_id, locale, "name")
SELECT id, 'pt', 'Heterossexual' FROM sexual_orientation WHERE code = 'heterosexual'
ON CONFLICT DO NOTHING;

INSERT INTO sexual_orientation_i18n (sexual_orientation_id, locale, "name")
SELECT id, 'pt', 'Homossexual' FROM sexual_orientation WHERE code = 'homosexual'
ON CONFLICT DO NOTHING;

INSERT INTO sexual_orientation_i18n (sexual_orientation_id, locale, "name")
SELECT id, 'pt', 'Bissexual' FROM sexual_orientation WHERE code = 'bisexual'
ON CONFLICT DO NOTHING;

INSERT INTO sexual_orientation_i18n (sexual_orientation_id, locale, "name")
SELECT id, 'pt', 'Pansexual' FROM sexual_orientation WHERE code = 'pansexual'
ON CONFLICT DO NOTHING;

INSERT INTO sexual_orientation_i18n (sexual_orientation_id, locale, "name")
SELECT id, 'pt', 'Assexual' FROM sexual_orientation WHERE code = 'asexual'
ON CONFLICT DO NOTHING;

INSERT INTO sexual_orientation_i18n (sexual_orientation_id, locale, "name")
SELECT id, 'pt', 'Demissexual' FROM sexual_orientation WHERE code = 'demisexual'
ON CONFLICT DO NOTHING;

INSERT INTO sexual_orientation_i18n (sexual_orientation_id, locale, "name")
SELECT id, 'pt', 'Prefiro não dizer' FROM sexual_orientation WHERE code = 'prefer_not_to_say'
ON CONFLICT DO NOTHING;

INSERT INTO sexual_orientation_i18n (sexual_orientation_id, locale, "name")
SELECT id, 'pt', 'Outro' FROM sexual_orientation WHERE code = 'other'
ON CONFLICT DO NOTHING;