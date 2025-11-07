-- ==============================================
-- Migration: V1__create_enums_and_tables.sql
-- Tipo: undo (gerado automaticamente)
-- Criada em: 2025-11-04 15:44:32
-- ==============================================

-- Escreva aqui os comandos para desfazer a migration correspondente.
DROP TABLE IF EXISTS quiz_result CASCADE;
DROP TABLE IF EXISTS quiz_score CASCADE;
DROP TABLE IF EXISTS quiz_answer CASCADE;
DROP TABLE IF EXISTS quiz_attempt CASCADE;
DROP TABLE IF EXISTS option_weight CASCADE;
DROP TABLE IF EXISTS "option" CASCADE;
DROP TABLE IF EXISTS question CASCADE;
DROP TABLE IF EXISTS tiebreaker_pair CASCADE;
DROP TABLE IF EXISTS user_archetype CASCADE;
DROP TABLE IF EXISTS archetype CASCADE;
DROP TABLE IF EXISTS "user" CASCADE;
DROP TABLE IF EXISTS lifestyle_i18n CASCADE;
DROP TABLE IF EXISTS lifestyle CASCADE;
DROP TABLE IF EXISTS commitment_level_i18n CASCADE;
DROP TABLE IF EXISTS commitment_level CASCADE;
DROP TABLE IF EXISTS religion_i18n CASCADE;
DROP TABLE IF EXISTS religion CASCADE;
DROP TABLE IF EXISTS marital_status_i18n CASCADE;
DROP TABLE IF EXISTS marital_status CASCADE;
DROP TABLE IF EXISTS pronoun_i18n CASCADE;
DROP TABLE IF EXISTS pronoun CASCADE;
DROP TABLE IF EXISTS gender_i18n CASCADE;
DROP TABLE IF EXISTS gender CASCADE;

DROP TYPE IF EXISTS "source" CASCADE;
DROP TYPE IF EXISTS archetype_type CASCADE;
DROP TYPE IF EXISTS yes_no_maybe CASCADE;

