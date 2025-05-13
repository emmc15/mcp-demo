# Define the directories for different services
.PHONY: build
build:
	@echo "Building all services..."
	@docker compose -f docker-compose.yml build
	@echo "All services built successfully."

.PHONY: up
up:
	@echo "Starting all services..."
	@docker compose -f docker-compose.yml up -d
	@echo "All services are up and running."

.PHONY: down
down:
	@echo "Stopping all services..."
	@docker compose -f docker-compose.yml down
	@echo "All services have been stopped."

.PHONY: clean
clean:
	@echo "Cleaning up all services..."
	@docker compose -f docker-compose.yml down --volumes --remove-orphans
	@rm -rf ./.venv || echo "No virtual environment to remove"
	@rm -rf ./lib ./lib64
	@echo "All services have been cleaned up."

.PHONY: install
install:
	@echo "Installing dependencies..."
	uv sync --frozen
	@echo "Dependencies installed successfully."

.PHONY: update
update:
	@echo "Updating dependencies..."
	uv sync --all-packages
	@echo "All packages updated successfully."