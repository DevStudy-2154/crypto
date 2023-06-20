.PHONY: init
init:
	@rm -rf ./db
	@rm -rf ./src/rails
	@mkdir ./src/rails
	@cp ./docker/rails/Gemfile ./src/rails/Gemfile
	@cp ./docker/rails/Gemfile.lock ./src/rails/Gemfile.lock
	@docker-compose build
	@docker-compose run --rm web rails new . -f -B -d mysql --api --skip-test --skip-turbolinks
	@docker-compose down

.PHONY: build
build:
	@docker-compose build

.PHONY: up
up:
	@docker-compose up

.PHONY: down
down:
	@docker-compose down

.PHONY: stop
stop:
	@docker-compose stop

.PHONY: app
app:
	@docker-compose exec app bash
