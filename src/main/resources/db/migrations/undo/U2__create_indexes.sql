-- ==============================================
-- Undo Migration: U2__create_indexes.sql
-- Referente a: V2__create_indexes.sql
-- Criada em: 2025-11-07 11:47:33
-- ==============================================

-- Escreva aqui os comandos para desfazer a migration correspondente.
DROP INDEX IF EXISTS idx_option_text_i18n_en;
DROP INDEX IF EXISTS idx_option_text_i18n_pt;

DROP INDEX IF EXISTS idx_question_text_i18n_en;
DROP INDEX IF EXISTS idx_question_text_i18n_pt;

DROP INDEX IF EXISTS idx_archetype_long_i18n_en;
DROP INDEX IF EXISTS idx_archetype_short_i18n_en;
DROP INDEX IF EXISTS idx_archetype_name_i18n_en;

DROP INDEX IF EXISTS idx_archetype_long_i18n_pt;
DROP INDEX IF EXISTS idx_archetype_short_i18n_pt;


