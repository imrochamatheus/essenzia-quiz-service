-- ==============================================
-- Migration: V3__insert_archetypes.sql
-- Tipo: seed
-- Criada em: 2025-11-07 09:45:49
-- ==============================================

-- Escreva seus comandos SQL abaixo:
INSERT INTO archetype (code, emoji, name_i18n, dominant_i18n, complementary_i18n, active) VALUES
(
  'intense',
  '🔥',
  '{"pt": "Intenso(a)"}',
  '{"pt": "Você vive tudo com paixão. Seu coração é fogo, sua energia aquece quem está ao seu lado e você mergulha de corpo e alma nos relacionamentos."}',
  '{"pt": "Além da sua intensidade, você carrega outras nuances que equilibram sua forma de amar."}',
  TRUE
),
(
  'affectionate',
  '🌸',
  '{"pt": "Afetuoso(a)"}',
  '{"pt": "Você é essência de carinho. O cuidado, a atenção aos detalhes e o acolhimento fazem parte de quem você é. Amar, para você, é estar presente nos pequenos gestos."}',
  '{"pt": "Além do seu afeto, você expressa outras energias que completam sua forma de se conectar."}',
  TRUE
),
(
  'free',
  '🌍',
  '{"pt": "Livre"}',
  '{"pt": "Você carrega a alma do explorador. O amor, para você, é movimento, descoberta e liberdade. Você busca alguém que some nas suas aventuras e respeite sua independência."}',
  '{"pt": "Mesmo com sua alma livre, você revela outras essências que fortalecem seu jeito de amar."}',
  TRUE
),
(
  'determined',
  '💎',
  '{"pt": "Determinado(a)"}',
  '{"pt": "Você sabe o que quer e valoriza a clareza. Amar, para você, é construir, planejar e crescer junto. Seu foco é um relacionamento estável e duradouro."}',
  '{"pt": "Apesar da determinação, você tem outras camadas que trazem equilíbrio e novas formas de amar."}',
  TRUE
),
(
  'fluent',
  '🌊',
  '{"pt": "Fluente"}',
  '{"pt": "Você é flexível, leve e sabe se adaptar. Amar, para você, é viver com calma e simplicidade. Você prefere relações sem peso, onde a cumplicidade flui naturalmente."}',
  '{"pt": "Mesmo com sua leveza, você guarda outras forças que completam sua essência no amor."}',
  TRUE
),
(
  'magnetic',
  '⚡',
  '{"pt": "Magnético(a)"}',
  '{"pt": "Você tem carisma, energia e atrai naturalmente quem está ao seu redor. Amar, para você, é diversão, intensidade social e conexão vibrante."}',
  '{"pt": "Junto à sua energia magnética, você manifesta outras essências que enriquecem sua forma de amar."}',
  TRUE
);

