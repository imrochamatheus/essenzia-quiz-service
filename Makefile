NEW_MIGRATION := scripts/new_migration.sh

ENV ?= dev
TYPE ?= migration

$(NEW_MIGRATION):
	chmod +x $(NEW_MIGRATION)

create-migration: $(NEW_MIGRATION)
	@if [ -z "$(MESSAGE)" ]; then \
		echo "ERRO: Você precisa informar uma mensagem."; \
		echo "Exemplo: make migration MESSAGE='create_user_table' [TYPE=undo]"; \
		exit 1; \
	fi
	@./$(NEW_MIGRATION) "$(MESSAGE)" "$(TYPE)"

db-migrate: up-db-service
	mvn -P$(ENV) flyway:migrate -DskipTests

up-db-service:
	docker-compose up -d db

help:
	@echo "Comandos disponíveis:"
	@echo "  make create-migration MESSAGE='my_message' [TYPE=migration|undo|repair]"
	@echo "  make db-migrate [ENV=dev|prod]"
	@echo ""
	@echo "Exemplos:"
	@echo "  make create-migration MESSAGE='create_user_table'"
	@echo "  make create-migration MESSAGE='drop_user_table' TYPE=undo"
	@echo "  make db-migrate"
	@echo "  make db-migrate ENV=prod"

