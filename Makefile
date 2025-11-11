NEW_MIGRATION := scripts/new_migration.sh

ENV ?= dev
DEBUG ?= false
TYPE ?= schema
MIGRATIONS_PATH = src/main/resources/db/migrations

ifeq ($(DEBUG),True)
	DEBUG_FLAG = -X
endif
ifeq ($(DEBUG),true)
	DEBUG_FLAG = -X
endif


$(NEW_MIGRATION):
	chmod +x $(NEW_MIGRATION)

create-migration: $(NEW_MIGRATION)
	@if [ -z "$(MESSAGE)" ]; then \
		echo "ERRO: Você precisa informar uma mensagem."; \
		echo "Exemplo: make create-migration MESSAGE='create_user_table' [TYPE=schema|seed]"; \
		exit 1; \
	fi
	@./$(NEW_MIGRATION) "$(MESSAGE)" "$(TYPE)"

up-db-service:
	docker-compose up -d db

db-migrate: up-db-service
	mvn -P$(ENV) flyway:migrate \
		-Dflyway.locations=filesystem:$(MIGRATIONS_PATH)/$(TYPE) \
		-DskipTests $(DEBUG_FLAG)

db-migrate-schema:
	@$(MAKE) db-migrate TYPE=schema

db-undo-schema:
	@$(MAKE) db-migrate TYPE=undo

db-migrate-repeatable:
	@$(MAKE) db-migrate TYPE=repeatable

clean:
	mvn -P$(ENV) flyway:clean \
 		-Dflyway.cleanDisabled=false \
 		-DskipTests $(DEBUG_FLAG)

db-reset: clean db-migrate-schema db-migrate-repeatable

validate-migrations:
	mvn -P$(ENV) flyway:validate \
		-Dflyway.locations=filesystem:$(MIGRATIONS_PATH) \
		-DskipTests $(DEBUG_FLAG)

help:
	@echo ""
	@echo "Comandos disponíveis:"
	@echo "──────────────────────────────────────────────"
	@echo "  make create-migration MESSAGE='msg' [TYPE=schema|seed]"
	@echo "      → Cria nova migration numerada (schema) ou repeatable (seed)"
	@echo ""
	@echo "  make db-migrate-schema      → Executa migrations de schema (V###)"
	@echo "  make db-migrate-repeatable  → Executa scripts repeatable (R__)"
	@echo "  make db-undo-schema         → Desfaz migrations (U###)"
	@echo ""
	@echo "  make clean                  → Limpa o banco"
	@echo "  make db-reset               → Recria o banco do zero (clean + migrate + repeatable)"
	@echo "  make up-db-service          → Sobe o serviço do banco via docker-compose"
	@echo ""
	@echo "  make validate-migrations    → Valida integridade e nomes dos scripts"
	@echo ""
	@echo "Variáveis úteis:"
	@echo "──────────────────────────────────────────────"
	@echo "  ENV=<perfil>      → Define o profile Maven (default: dev)"
	@echo "  DEBUG=true        → Mostra logs detalhados do Maven"
	@echo "  MESSAGE='texto'   → Mensagem usada ao criar migrations"
	@echo "  TYPE=schema|seed  → Tipo de migration a criar (default: schema)"
	@echo ""
	@echo "Exemplos rápidos:"
	@echo "──────────────────────────────────────────────"
	@echo "  make create-migration MESSAGE='create_user_table'"
	@echo "  make create-migration MESSAGE='insert_users' TYPE=seed"
	@echo "  make db-migrate-schema ENV=prod DEBUG=true"
	@echo ""
