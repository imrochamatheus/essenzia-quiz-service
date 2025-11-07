-- ==============================================
-- Migration: V2__create_indexes.sql
-- Tipo: undo (gerado automaticamente)
-- Criada em: 2025-11-04 15:51:34
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
DROP INDEX IF EXISTS idx_archetype_name_i18n_pt;
