# Variables
PROJECT_NAME=wordpress-docker
DOCKER_COMPOSE=docker compose

# Start containers
up:
	$(DOCKER_COMPOSE) up -d

# Stop containers without removing them
stop:
	docker compose stop

# Stop and remove containers, networks, volumes, and images
down:
	docker compose down
	
# Rebuild containers
build:
	$(DOCKER_COMPOSE) build

# Restart specific service
restart:
	$(DOCKER_COMPOSE) restart wordpress

# Recreate WordPress (e.g., after config changes)
recreate-wordpress:
	$(DOCKER_COMPOSE) up -d --force-recreate wordpress

# View logs
logs:
	$(DOCKER_COMPOSE) logs -f

# Import SQL into the running MySQL container
# Usage: make import-sql FILE=path/to/file.sql
import-sql:
ifndef FILE
	$(error FILE is undefined. Use: make import-sql FILE=path/to/file.sql)
endif
	docker exec -i $$(docker compose ps -q db) \
	mysql -u$$(grep MYSQL_USER .env | cut -d '=' -f2) \
	-p$$(grep MYSQL_PASSWORD .env | cut -d '=' -f2) \
	$$(grep WORDPRESS_DB_NAME .env | cut -d '=' -f2) < $(FILE)

# Show running containers
ps:
	$(DOCKER_COMPOSE) ps
