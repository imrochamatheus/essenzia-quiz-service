-- ==============================================
-- Migration: V1__create_enums_and_tables.sql
-- Tipo: migration
-- Criada em: 2025-11-04 15:44:32
-- ==============================================

-- Escreva seus comandos SQL abaixo:
CREATE TYPE yes_no_maybe AS ENUM (
    'YES',
    'NO',
    'MAYBE'
);

CREATE TYPE archetype_type AS ENUM (
    'DOMINANT',
    'COMPLEMENTARY'
);

CREATE TYPE "source" AS ENUM (
    'QUIZ',
    'MANUAL'
);

CREATE TABLE gender (
    id      SERIAL PRIMARY KEY,
    code    VARCHAR(50) UNIQUE NOT NULL,
    active  BOOLEAN DEFAULT TRUE
);

CREATE TABLE gender_i18n (
    gender_id   INT NOT NULL REFERENCES gender(id) ON DELETE CASCADE,
    locale      VARCHAR(10) NOT NULL,
    "name"      VARCHAR(100) NOT NULL,

    PRIMARY KEY (gender_id, locale)
);

CREATE TABLE pronoun (
    id      SERIAL PRIMARY KEY,
    code    VARCHAR(50) UNIQUE NOT NULL,
    active  BOOLEAN DEFAULT TRUE
);

CREATE TABLE pronoun_i18n (
    pronoun_id  INT NOT NULL REFERENCES pronoun(id) ON DELETE CASCADE,
    locale      VARCHAR(10) NOT NULL,
    "name"      VARCHAR(100) NOT NULL,

    PRIMARY KEY (pronoun_id, locale)
);

CREATE TABLE marital_status (
    id      SERIAL PRIMARY KEY,
    code    VARCHAR(50) UNIQUE NOT NULL,
    active  BOOLEAN DEFAULT TRUE
);

CREATE TABLE marital_status_i18n (
    marital_status_id  INT NOT NULL REFERENCES marital_status(id) ON DELETE CASCADE,
    locale             VARCHAR(10) NOT NULL,
    "name"             VARCHAR(100) NOT NULL,

    PRIMARY KEY (marital_status_id, locale)
);

CREATE TABLE religion (
    id      SERIAL PRIMARY KEY,
    code    VARCHAR(50) UNIQUE NOT NULL,
    active  BOOLEAN DEFAULT TRUE
);

CREATE TABLE religion_i18n (
    religion_id     INT NOT NULL REFERENCES religion(id) ON DELETE CASCADE,
    locale          VARCHAR(10) NOT NULL,
    "name"          VARCHAR(100) NOT NULL,

    PRIMARY KEY (religion_id, locale)
);

CREATE TABLE commitment_level (
    id      SERIAL PRIMARY KEY,
    code    VARCHAR(50) UNIQUE NOT NULL,
    active  BOOLEAN DEFAULT TRUE
);

CREATE TABLE commitment_level_i18n (
    commitment_level_id     INT NOT NULL REFERENCES commitment_level(id) ON DELETE CASCADE,
    locale                  VARCHAR(10) NOT NULL,
    "name"                  VARCHAR(100) NOT NULL,

    PRIMARY KEY (commitment_level_id, locale)
);

CREATE TABLE lifestyle (
    id      SERIAL PRIMARY KEY,
    code    VARCHAR(50) UNIQUE NOT NULL,
    active  BOOLEAN DEFAULT TRUE
);

CREATE TABLE lifestyle_i18n (
    lifestyle_id    INT NOT NULL REFERENCES lifestyle(id) ON DELETE CASCADE,
    locale          VARCHAR(10) NOT NULL,
    "name"          VARCHAR(100) NOT NULL,

    PRIMARY KEY (lifestyle_id, locale)
);

CREATE TABLE "user" (
    id                          SERIAL PRIMARY KEY,
    "name"                      VARCHAR(150) NOT NULL,
    age                         INT NOT NULL,
    gender                      INT REFERENCES gender(id),
    pronouns                    INT REFERENCES pronoun(id),
    marital_status              INT REFERENCES marital_status(id),
    city                        VARCHAR(100),
    "state"                     VARCHAR(50),
    country                     VARCHAR(50),
    email                       VARCHAR(150) UNIQUE NOT NULL,
    phone                       TEXT NOT NULL,
    bio                         TEXT,
    has_kids                    BOOLEAN,
    children_preference         yes_no_maybe,
    religion                    INT REFERENCES religion(id),
    commitment_level            INT REFERENCES commitment_level(id),
    long_distance_relationship  yes_no_maybe,
    lifestyle                   INT REFERENCES lifestyle(id),
    cpf                         VARCHAR(11) UNIQUE,
    profile_completeness        INT DEFAULT 0
);

CREATE TABLE archetype (
    id          SERIAL PRIMARY KEY,
    code        VARCHAR(100) NOT NULL UNIQUE,
    emoji       VARCHAR(50) NOT NULL,
    name_i18n   JSONB NOT NULL,
    short_i18n  JSONB,
    long_i18n   JSONB,
    active      BOOLEAN DEFAULT TRUE
);

CREATE TABLE user_archetype (
    user_id         INT NOT NULL,
    archetype_code  VARCHAR(100) NOT NULL,
    archetype_type  archetype_type NOT NULL,
    source          source NOT NULL,

    PRIMARY KEY (user_id, archetype_code),
    FOREIGN KEY (user_id) REFERENCES "user"(id) ON DELETE CASCADE,
    FOREIGN KEY (archetype_code) REFERENCES archetype(code) ON DELETE CASCADE
);

CREATE TABLE tiebreaker_pair (
    id              SERIAL PRIMARY KEY,
    archetype_a_id  INT NOT NULL REFERENCES archetype(id),
    archetype_b_id  INT NOT NULL REFERENCES archetype(id),

    UNIQUE (archetype_a_id, archetype_b_id),
    CHECK (archetype_a_id < archetype_b_id)
);

CREATE TABLE question (
    id                  SERIAL PRIMARY KEY,
    position            INT NOT NULL,
    text_i18n           JSONB NOT NULL,
    is_tiebreaker       BOOLEAN DEFAULT FALSE,
    tiebreaker_pair_id  INT REFERENCES tiebreaker_pair(id)
);

CREATE TABLE "option" (
    id          SERIAL PRIMARY KEY,
    question_id INT NOT NULL REFERENCES question(id) ON DELETE CASCADE,
    text_i18n   JSONB NOT NULL
);

CREATE TABLE option_weight (
    option_id     INT NOT NULL,
    archetype_id  INT NOT NULL,
    "weight"      REAL NOT NULL,

    PRIMARY KEY (option_id, archetype_id),
    FOREIGN KEY (option_id) REFERENCES "option"(id) ON DELETE CASCADE,
    FOREIGN KEY (archetype_id) REFERENCES archetype(id) ON DELETE CASCADE
);

CREATE TABLE quiz_attempt (
    id              SERIAL PRIMARY KEY,
    user_id         INT NOT NULL REFERENCES "user"(id) ON DELETE CASCADE,
    started_at      TIMESTAMP NOT NULL,
    completed_at    TIMESTAMP
);

CREATE TABLE quiz_answer (
    quiz_attempt_id     INT NOT NULL,
    option_id           INT NOT NULL,

    PRIMARY KEY (quiz_attempt_id, option_id),
    FOREIGN KEY (quiz_attempt_id) REFERENCES quiz_attempt(id) ON DELETE CASCADE,
    FOREIGN KEY (option_id) REFERENCES "option"(id) ON DELETE CASCADE
);

CREATE TABLE quiz_score (
    quiz_attempt_id     INT NOT NULL,
    archetype_id        INT NOT NULL,
    score_value         REAL NOT NULL,

    PRIMARY KEY (quiz_attempt_id, archetype_id),
    FOREIGN KEY (quiz_attempt_id) REFERENCES quiz_attempt(id) ON DELETE CASCADE,
    FOREIGN KEY (archetype_id) REFERENCES archetype(id) ON DELETE CASCADE
);

CREATE TABLE quiz_result (
    quiz_attempt_id INT NOT NULL,
    archetype_id    INT NOT NULL,
    archetype_type  archetype_type NOT NULL,

    PRIMARY KEY (quiz_attempt_id, archetype_id),
    FOREIGN KEY (quiz_attempt_id) REFERENCES quiz_attempt(id) ON DELETE CASCADE,
    FOREIGN KEY (archetype_id) REFERENCES archetype(id) ON DELETE CASCADE
);