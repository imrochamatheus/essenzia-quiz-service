NEW_MIGRATION := scripts/new_migration.sh

TYPE ?= migration

$(NEW_MIGRATION):
	chmod +x $(NEW_MIGRATION)

migration: $(NEW_MIGRATION)
	@if [ -z "$(MESSAGE)" ]; then \
		echo "ERRO: Você precisa informar uma mensagem."; \
		echo "Exemplo: make migration MESSAGE='create_user_table' [TYPE=undo]"; \
		exit 1; \
	fi
	@./$(NEW_MIGRATION) "$(MESSAGE)" "$(TYPE)"

help:
	@echo "Comandos disponíveis:"
	@echo "  make migration MESSAGE='my_message' [TYPE=migration|undo|repair]"
	@echo ""
	@echo "Exemplos:"
	@echo "  make migration MESSAGE='create_user_table'"
	@echo "  make migration MESSAGE='drop_user_table' TYPE=undo"
	@echo "  make migration MESSAGE='fix_indexes' TYPE=repair"
