.SILENT:

# Development
dev:
	COMPOSE_BAKE=true docker compose up --build 

down:
	docker compose down && clear

down-volumes:
	docker compose down -v && clear

restart:
	make down && make dev

logs:
	docker compose logs -f --tail=50

build:
	COMPOSE_BAKE=true docker compose build

# Production
prod:
	COMPOSE_BAKE=true docker compose -f docker-compose.prod.yaml up --build -d

down-prod:
	docker compose -f docker-compose.prod.yaml down

restart-prod:
	make down-prod && make prod

logs-prod:
	docker compose -f docker-compose.prod.yaml logs -f --tail=50

# Database / Pgadmin
shell-db:
	docker exec -it postgres psql -U $$POSTGRES_USER -d $$POSTGRES_DB

pgadmin:
	open http://localhost:5050

# App
open:
	open http://localhost/

# Status
status:
	docker compose ps