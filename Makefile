run:
	@./run.sh


sql_up:
	@echo "Removendo container anterior (se existir)..."
	-@docker rm -f postgres

	@echo "Iniciando novo container postgres com volume persistente..."
	@docker run --name postgres \
		-e POSTGRES_PASSWORD=1234 \
		-e POSTGRES_DB=wattsup \
		-v postgres_data:/var/lib/postgresql/data \
		-p 5432:5432 \
		-d postgres

	@echo "Aguardando inicialização do container postgres..."
	@sleep 10
