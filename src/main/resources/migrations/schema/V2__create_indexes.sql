-- ==============================================
-- Migration: V2__create_indexes.sql
-- Tipo: schema
-- Criada em: 2025-11-04 15:51:34
-- ==============================================

-- Escreva seus comandos SQL abaixo:
CREATE INDEX idx_archetype_name_i18n_pt ON archetype ((name_i18n->>'pt'));
CREATE INDEX idx_archetype_dominant_i18n_pt ON archetype ((dominant_i18n->>'pt'));
CREATE INDEX idx_archetype_complementary_i18n_pt ON archetype ((complementary_i18n->>'pt'));

CREATE INDEX idx_archetype_name_i18n_en ON archetype ((name_i18n->>'en'));
CREATE INDEX idx_archetype_dominant_i18n_en ON archetype ((dominant_i18n->>'en'));
CREATE INDEX idx_archetype_complementary_i18n_en ON archetype ((complementary_i18n->>'en'));

CREATE INDEX idx_question_text_i18n_pt ON question ((text_i18n->>'pt'));
CREATE INDEX idx_question_text_i18n_en ON question ((text_i18n->>'en'));

CREATE INDEX idx_option_text_i18n_pt ON "option" ((text_i18n->>'pt'));
CREATE INDEX idx_option_text_i18n_en ON "option" ((text_i18n->>'en'));

