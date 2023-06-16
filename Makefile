PATH = '/etc/prometheus/rules'
TESTS := $(shell find ./etc/prometheus/rules -type f -regex '^.*_test\.yml$$' | sed 's\#.*/\#\#' | xargs )

start:
	@echo "\n 👉 Starting Application... \n"
	@docker compose up -d

test: start
	@echo "\n 👉 Running tests... \n"
	@docker compose exec -w $(PATH) prometheus promtool test rules $(TESTS)