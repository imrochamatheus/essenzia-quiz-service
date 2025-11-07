NEW_MIGRATION := scripts/new_migration.sh

ENV ?= dev
TYPE ?= schema
MIGRATIONS_PATH = src/main/resources/migrations

DEBUG_FLAG :=
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
		echo "Exemplo: make migration MESSAGE='create_user_table' [TYPE=schema|seed]"; \
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

db-seed:
	@$(MAKE) db-migrate TYPE=seed MIGRATIONS_PATH=$(MIGRATIONS_PATH)/schema

db-undo-schema:
	mvn -P$(ENV) flyway:undo \
		-Dflyway.locations=filesystem:$(MIGRATIONS_PATH)/undo \
		-DskipTests $(DEBUG_FLAG)

db-reset: up-db-service
	mvn -P$(ENV) flyway:clean \
		-Dflyway.cleanDisabled=false \
		-DskipTests $(DEBUG_FLAG)
	mvn -P$(ENV) flyway:migrate \
		-Dflyway.locations=filesystem:$(MIGRATIONS_PATH)/schema \
		-DskipTests $(DEBUG_FLAG)

help:
	@echo "Comandos disponíveis:"
	@echo "  make create-migration MESSAGE='my_message' [TYPE=schema(default)|seed]"
	@echo "  make db-migrate-schema [ENV=dev(default)|prod] [DEBUG=True]"
	@echo "  make db-seed [ENV=dev(default)|prod] [DEBUG=True]"
	@echo "  make db-undo-schema [ENV=dev(default)|prod] [DEBUG=True]"
	@echo "  make db-reset [ENV=dev(default)|prod] [DEBUG=True]"
	@echo ""
	@echo "Exemplos:"
	@echo "  make create-migration MESSAGE='create_user_table'"
	@echo "  make create-migration MESSAGE='insert_users' TYPE=seed"
	@echo "  make db-migrate-schema"
	@echo "  make db-migrate-schema ENV=prod"

