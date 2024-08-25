.PHONY: nuke pave nuke_and_pave

# Environment variables for passwords
export ADMIN_PASSWORD := admin_password
export BOT_PASSWORD := bot_password

nuke:
	@echo "Nuking the database..."
	@./scripts/reset_db.sh

pave:
	@echo "Paving the database..."
	@./scripts/setup_db.sh

nuke_and_pave: nuke pave
	@echo "Database nuked and paved!"
